#!/usr/bin/env bash

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null && pwd)"
FLY_BIN="${ROOT_DIR}/fly"

CONCOURSE_EXTERNAL_URL="http://10.0.1.2:8080"
export CONCOURSE_EXTERNAL_URL

${FLY_BIN} -t lite login --team-name=main --username=concourse --password=changeme --concourse-url=${CONCOURSE_EXTERNAL_URL}

[[ -f mavcunha-misc.yml ]] && ${FLY_BIN} -t lite set-pipeline mavcunha-misc -c mavcunha-misc.yml
