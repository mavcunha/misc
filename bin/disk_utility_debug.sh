#!/bin/bash

if [ "$#" -ne "1" ]; then
  echo "Usage: disk_utility_debug  <true|false> by default it's false." 1>&2;
  exit 1;
fi;

flag="false"
[ "${1}" == "true" ] && flag=${1}

defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool ${flag}

echo "Done." 
