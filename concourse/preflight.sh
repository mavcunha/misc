#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd)"
FLY_BIN=${ROOT_DIR}/fly

${FLY_BIN} -t local -n main -u concourse -p changeme login

${FLY_BIN} -t local pipelines
