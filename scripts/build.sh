#!/bin/bash

create_zip() {
  if [[ $# != 2 ]]; then
    echo -e "Usage: create_zip <arch_name> <files>"
    exit 1
  fi

  if [[ $(which winrar 2>/dev/null) ]]; then
    winrar a -afzip -ep1 "$1" "$2"
  else
    zip -9 -r -j "$1" $2
  fi
}

dist_name="$1"

if [[ ! "$dist_name" ]]; then
  echo -e "Usage: $0 <dist_name>"
  exit 1
fi

create_zip "../dist/$dist_name.tdesktop-theme" "../src/*"
