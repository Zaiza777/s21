#!/bin/bash

# Исключительные случаи =)
if  echo $1 | grep -qv "^\/[a-Z]*" || echo $2$4| grep -qv "^[0-9]*$" ||
    echo $5 | grep -vEq '^[a-Z]{1,7}\.[a-z]{1,3}$' || [[ $# != 6 ]]  ||
    echo $3 | grep -qvE '^[a-Z]{1,7}$' || echo $6 | grep -qvE '^[0-9]{1,3}kb$' ||
	[ $(echo "$6" | grep -Eo '^[0-9]{1,3}') -ge 101 ];  then
  echo "Incorrect parametr";
  exit 0;
fi

createFile() {
	countFile=0
	rashiren=${2#*.}
	nameFile=${2%.*}
	while [ $countFile -lt $1 ] && [ $(df  | grep -E '/$' | awk '{print $4}') -gt 1048576 ] &&
	[ ${#nameFile} -lt 253 ]
	do
		(( countFile++ ))
		fallocate -l $4 "$3/$nameFile.$rashiren"
		echo "$3$nameFile.$rashiren $(date +%F) $4" >> s21log.log
		nameFile="$nameFile${nameFile:(-1)}"
		done
}


count=0;
name=$3
while [ ${#name} -lt 4 ]; do name="$name${3:(-1)}"; done  # не меньше 4 $3 аргумент

dateTime=$(date +%d%m%y)

createDir() {
	while [ $count -lt $2 ] && [ $(df  | grep -E '/$' | awk '{print $4}') -gt 1048576 ]
	do
		(( count++ ))
		ccc="$1/$name""_$dateTime"
		echo $ccc
		mkdir -p $ccc
		createFile $4 $5 $ccc $6
		name="$name${3:(-1)}"
		done
}
createDir $1 $2 $3 $4 $5 $6
