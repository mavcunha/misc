#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd)"
FLY_BIN=${ROOT_DIR}/fly

${FLY_BIN} -h
