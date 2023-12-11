#!/bin/bash
function s21School() {
    HOSTNAME=$(cat /etc/hostname)
    TIMEZONE="$(cat /etc/timezone) $(date +"%-:::z")"
    USER=$USER
    OS=$(cat /etc/issue | awk '{print $1 $2 $3}')
    DATE=$(date +"%d %B %Y %H:%M:%S")
    UPTIME=$(uptime -s)
    UPTIME_SEC=$(cat /proc/uptime | awk '{printf $1}')
    IP=$(hostname -I | awk '{print $1}')
    MASK=$(ifconfig | awk '/netmask/{ print $4;} ' | head -n 1)
    GATEWAY=$(ip r | awk '/default via/{print $3;}')
    RAM_TOTAL=$(cat /proc/meminfo | head -n 1 | awk '{print $2/1024/1024}')
    RAM_USED=$(awk '/MemAvailable/ { printf "%.3f \n", $2/1024/1024}' /proc/meminfo)
    RAM_FREE=$(awk '/MemFree/ { printf "%.3f \n", $2/1024/1024}' /proc/meminfo)
    SPACE_ROOT=$(du -s /root | awk '{ printf "%.2f \n", $1/1024 }')
    SPACE_ROOT_USED=$(df -l | awk '/\/$/{printf "%.2f", $3/1024}')
    SPACE_ROOT_FREE=$(df -l | awk '/\/$/ { printf "%.2f\n", $2/1024 } ')
    echo "HOSTNAME   = $HOSTNAME"
    echo "TIMEZONE   = $TIMEZONE"
    echo "USER       = $USER"
    echo "OS         = $OS"
    echo "DATE       = $DATE"
    echo "UPTIME     = $UPTIME"
    echo "UPTIME_SEC = $UPTIME_SEC"
    echo "IP         = $IP"
    echo "MASK       = $MASK"
    echo "GATEWAY    = $GATEWAY"
    echo "RAM_TOTAL  = $RAM_TOTAL"
    echo "RAM_USED   = $RAM_USED"
    echo "RAM_FREE   = $RAM_FREE"
    echo "SPACE_ROOT = $SPACE_ROOT"
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}

s21School


read -p "Save file? Y/n" FILE_YES
if [[ $FILE_YES = 'y' ]] || [[ $FILE_YES = 'Y' ]]; then
DATEFILE=$(date "+%d_%m_%y_%R_%S.status")
s21School > $DATEFILE
fi