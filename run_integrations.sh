#!/usr/bin/env bash

function _color()   { tput -Txterm setaf ${1}; echo -en ${2}; tput -Txterm sgr0; }
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

in_cyan "INTEGRATION TESTS\n"
echo

in_yellow "IMPORTANT TESTS\n"
for i in $(seq 1 4); do
  _test $(printf "%02d" "${i}") && in_red "FAIL\n" || in_green "OK\n" # purposely flipped.
done
echo

in_yellow "NON IMPORTANT TESTS\n"
for i in $(seq 4 7); do
  _test $(printf "%02d" "${i}") && in_red "FAIL\n" || in_green "OK\n" # purposely flipped.
done
echo
