#!/bin/bash


log=($(cat $(find *.log) | awk '/\.|\//{print $1}'))

if [ $1 -eq 1 ]
then

    log=($(cat $(find *.log) | awk '/\.|\//{print $1}'))
    rm -rf ${log[*]}

elif [ $1 -eq 2 ]
then
    dateStart=0;
    dateEnd=0;
    if [ $# -eq 3 ]
    then
        dateStart=$2;
        dateEnd=$3;
    else
        echo "Date/Time start"
        read dateStart
        echo "Date/Time end"
        read dateEnd
    fi
    find . -type f -newerct "$dateStart" ! -newerct "$dateEnd" -delete
elif [ $1 -eq 3 ]
then
    withTochka=($(find  -regextype posix-egrep -regex '.*[a-z]{4,255}_(([3][0-1])|([0-2][0-9])).([1][0-2]|[0][0-9]).[0-9]{2,2}.*' -not -path '*/.*' -not -path '.'))
    withoutTochka=($(find  -regextype posix-egrep -regex '.*[a-z]{4,255}_(([3][0-1])|([0-2][0-9]))([1][0-2]|[0][0-9])[0-9]{2,2}.*' -not -path '*/.*' -not -path '.'))
    rm -rf ${withTochka[*]}
    rm -rf ${withoutTochka[*]}
fi
cat /dev/null > *.log
