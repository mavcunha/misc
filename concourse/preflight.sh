#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd)"
FLY_BIN=${ROOT_DIR}/fly

${FLY_BIN} -t lite login --team-name=main --username=concourse --password=changeme

${FLY_BIN} -t lite pipelines
