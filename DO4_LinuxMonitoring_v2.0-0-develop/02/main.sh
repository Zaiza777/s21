#!/bin/bash

# Исключительные случаи =)
if  echo $1 | grep -qvE "^[a-Z]{1,7}$" || echo $2 | grep -qvE "^[a-Z]{1,7}\.[a-z]{1,3}$" ||
    [[ $# != 3 ]]  || echo $3 | grep -qvE '^[0-9]{1,3}mb$';  then
  echo "Incorrect parametr";
  exit 0;
fi

count=0
dateTime=$(date +%d.%m.%y)
papka=$1
while [ ${#papka} -lt 5 ]; do papka="$papka${1:(-1)}"; done  # не меньше 5 $3 аргумент

createDir() {
	echo $count $papok
	while [ $count -lt $papok ] && [ $(df  | grep -E '/$' | awk '{print $4}') -gt 1048576 ]
	do
		(( count++ ))
		ccc="$1/$papka""_$dateTime"
		mkdir -p $ccc
		echo $ccc >> s21log.log
		createFile $(( $RANDOM % 10 )) $4 $ccc $5
		papka="$papka${3:(-1)}"
		done
}

createFile() {
	countFile=0
	rashiren=${2#*.}
	nameFile=${2%.*}
	while [ $countFile -lt $1 ] && [ $(df  | grep -E '/$' | awk '{print $4}') -gt 1048576 ] &&
	[ ${#nameFile} -lt 253 ]
	do
		(( countFile++ ))
		fallocate -l $4 "$3/$nameFile.$rashiren"
		echo "$3 $nameFile.$rashiren $(date +%F) $4" >> s21log.log
		nameFile="$nameFile${nameFile:(-1)}"
		done
}

direcotry=($(find -maxdepth 1 -type d  -not -path '*/.*' -not -path '.' | shuf -n1 ))
papka=$1
while [ ${#papka} -lt 5 ]; do papka="$papka${1:(-1)}"; done  # не меньше 5 $3 аргумент

papok=$(( $RANDOM % 100 ))


createDir $direcotry $papok $papka  $2 $3