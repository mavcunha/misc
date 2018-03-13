#!/usr/bin/env bash

case ${1} in
  compile)
    echo "We are compiling this!"
  ;;
  test)
    echo "We are testing our application."
  ;;
  package)
    echo "We are packaging this application"
  ;;
  *)
    echo "Missing argumento to this script"
esac
