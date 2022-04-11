[![Pipeline](https://github.com/FacuMastri/fastapi-server/actions/workflows/pipeline.yml/badge.svg?branch=main)](https://github.com/FacuMastri/fastapi-server/actions/workflows/pipeline.yml)
[![codecov](https://codecov.io/gh/FacuMastri/fastapi-server/branch/main/graph/badge.svg?token=RdVC85n674)](https://codecov.io/gh/FacuMastri/fastapi-server)
[![](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![](https://img.shields.io/badge/python-3.6-blue.svg)](https://www.python.org/downloads/)
[![](https://img.shields.io/badge/docs-fastapi-blue.svg)](https://fastapi.tiangolo.com/)
![](https://img.shields.io/badge/version-0.1-blue.svg)


# FastAPI server Template


## Setup

##### Using [poetry](https://python-poetry.org/)

```
$ pip3 install poetry
```


### Install dependencies and venv

The virtual environment is automatically created and activated via poetry.

```
$ cd to-project-path
$ poetry install
```

To make sure everything is setup correctly, run the following command which must show the virtual envoirnment path:

```
$ poetry show -v
```


## Running the server

- Development: `uvicorn src.main:app --reload`
- Production: `uvicorn src.main:app`
- Production Container: `docker build -t fastapi-server . && docker run -p 8080:80 fastapi-server`

> Default port : `8000`

## API Documentation

Documentation will be automatically generated at `{app}/docs`

## Workflow - CI/CD

- Cancel Redundant Deploys
- Setup
- Run Linter
- Run Tests
- Upload Test Coverage
- Deploy to heroku

### Upload Coverage to Codecov

The pipeline automatically generates a coverage report and uploads it to [codecov](https://codecov.io/gh/NicolasEzequielZulaicaRivera/nodeserver)

You'll need to set the following actions secrets:

- `CODECOV_TOKEN`: Repo Token
  > Can be obtained on codecov when setting up or on settings

### Deploy to Heroku

You'll need to set the following actions secrets:

- `HEROKU_APP_NAME`: App name
- `HEROKU_EMAIL`: Account email
- `HEROKU_API_KEY`: Account [API key](https://dashboard.heroku.com/account)