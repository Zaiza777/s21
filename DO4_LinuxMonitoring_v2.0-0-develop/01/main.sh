#!/bin/bash

# Исключительные случае =)
if  echo $1 | grep -qv "^\/[a-Z]*" || echo $2$4| grep -qv "^[0-9]*$" ||
    echo $5 | grep -vEq '^[a-Z]{1,7}\.[a-z]{1,3}$' || [[ $# != 6 ]]  ||
    echo $3 | grep -qvE '^[a-Z]{1,7}$' || echo $6 | grep -qvE '^[0-9]{1,3}kb$' ||
    [ $(echo "$6" | grep -Eo '^[0-9]{1,3}') -ge 101 ]; then
  echo "Incorrect parametr";
  exit 0;
fi