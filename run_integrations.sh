#!/usr/bin/env bash

FAILED=0 # no failures at start

function _color()   { tput setaf ${1}; echo -en ${2}; tput sgr0; }
function in_red()     { _color 1 "${1}"; } # use for failures
function in_green()   { _color 2 "${1}"; } # use for successes
function in_yellow()  { _color 3 "${1}"; } # use for warnings / attention
function in_magenta() { _color 5 "${1}"; } # use for debug messages
function in_cyan()    { _color 6 "${1}"; } # use for main actions / progress

function _test() {
  local name=${1}
  echo -n "TEST ${name}:"
  sleep 1
  return $(($(date +%s) % 11))
}

function _fail() {
  in_red "FAIL\n"
  ((FAILED++))
  return 0
}

function _pass() {
  in_green "OK\n"
}

in_cyan "INTEGRATION TESTS\n"

for i in $(seq 1 7); do
  _test $(printf "%02d" "${i}") && _fail || _pass # purposely flipped.
done
echo

exit ${FAILED}
