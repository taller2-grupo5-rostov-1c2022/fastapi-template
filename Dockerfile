FROM python:3.9 as python-base

ENV PYTHONUNBUFFERED=1 PYTHONDONTWRITEBYTECODE=1 PIP_NO_CACHE_DIR=off PIP_DISABLE_PIP_VERSION_CHECK=on PIP_DEFAULT_TIMEOUT=100 POETRY_HOME="/opt/poetry" POETRY_VIRTUALENVS_IN_PROJECT=true POETRY_NO_INTERACTION=1 PYSETUP_PATH="/opt/pysetup" VENV_PATH="/opt/pysetup/.venv"

# prepend poetry and venv to path
ENV PATH="$POETRY_HOME/bin:$VENV_PATH/bin:$PATH"

###############################################
# Builder Image
###############################################
FROM python-base as builder-base

# install poetry - respects $POETRY_VERSION & $POETRY_HOME
RUN pip install poetry

# copy project requirement files here to ensure they will be cached.
WORKDIR $PYSETUP_PATH
COPY poetry.lock pyproject.toml ./


# install runtime deps - uses $POETRY_VIRTUALENVS_IN_PROJECT internally
RUN poetry install

###############################################
# Production Image
###############################################
FROM python-base as production
COPY --from=builder-base $PYSETUP_PATH $PYSETUP_PATH
COPY ./src /src/
COPY ./start.sh /start.sh
RUN chmod +x /start.sh
CMD ["./start.sh"]