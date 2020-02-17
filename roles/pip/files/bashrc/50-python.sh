#!/bin/bash

PYTHON_VERSION=$(python3 -V | grep -E -o 3\.\\d+)
export PATH="~/Library/Python/${PYTHON_VERSION}/bin/:$PATH"
unset PYTHON_VERSION
