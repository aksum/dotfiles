#!/bin/bash

# set -x

RESULT=0

for f in $(ls -lA | awk '{print $9}')
do
  echo "file: $f"
  diff "$f" ~/"$f" &>/dev/null
  RESULT="$?"
  if [[ $RESULT -eq 1 ]]
  then
    cp ~/"$f" .
    echo -e "Updated file...\n"
  elif [[ $RESULT -eq 2 ]]
  then
    echo -e "I do not exist...\n"
  else
    echo -e "Nothing to do...\n"
  fi
done
