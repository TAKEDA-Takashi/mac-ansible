#!/bin/bash

export PATH="$(python3 -m site --user-base)/bin:$PATH"

export PIPENV_VENV_IN_PROJECT=1

eval "$(pipenv --completion)"
