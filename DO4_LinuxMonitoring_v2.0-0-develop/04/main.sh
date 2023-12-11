#!/bin/bash

codeResponse[0]=200
codeResponse[1]=201
codeResponse[2]=400
codeResponse[3]=401
codeResponse[4]=403
codeResponse[5]=404
codeResponse[6]=501
codeResponse[7]=502
codeResponse[8]=503

method[0]="GET"
method[1]="POST"
method[2]="PUT"
method[3]="PATCH"
method[4]="DELETE"

UserAgent[0]="Mozilla/5.0 (X11; Linux x86_64)"
UserAgent[1]="Safari/51.5 (X11; MacOs x86_64)"
UserAgent[2]="Opera/1.0   (X11; Windows 11)"
UserAgent[3]="Google Chrome (X11; Windows 11)"
UserAgent[4]="Internet Explorer (X11; Windows 11)"
UserAgent[5]="Microsoft Edge (X11; Windows 11)"
UserAgent[6]="Crawler and bot (X11; Windows 11)"
UserAgent[7]="Library (X11; Windows 11)"
UserAgent[8]="Yandex Bot (X11; LinuxAstra 11)"


urlAd[0]="/s21School"
urlAd[1]="/s21Adm"
urlAd[2]="/s21Student"
urlAd[3]="/s21Exam"

dateMe="$(( $RANDOM % 3 + 2020 ))-$(( $RANDOM % 12 + 1))-$(( $RANDOM % 31 + 1))"

genLog() {
    curlac=$1
    ranD=$(( $RANDOM % 1001 + 100 ))
    count=0
    while [[ $count -lt $ranD ]]
    do
        (( count++ ))
        echo "$(( $RANDOM % 255)).$(( $RANDOM % 255)).$(( $RANDOM % 255)).$(( $RANDOM % 255)) - - ${codeResponse[$RANDOM%${#codeResponse}]} - \"${method[$RANDOM%${#method}]}\" - [$(date  -d"${curlac} +21second" +"%d/%b/%Y:%H:%M:%S %z")] - ${urlAd[$RANDOM%4]} - \"${UserAgent[$RANDOM % 8]}\"" >> "$1.log"
        curlac=$(date  -d"${curlac} +21second" +"%H:%M:%S %Y-%m-%d")
    done
}
countE=0
while [[ $countE -lt 5 ]]
do
    (( countE++ ))
    genLog $dateMe
    dateMe=$(date -d"${dateMe} +day" +%Y-%m-%d )
    echo $countE $dateMe
done