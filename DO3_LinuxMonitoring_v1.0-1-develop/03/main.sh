#!/bin/bash
# Цвет текста:
BLACK='\033[0;30m'     #  ${BLACK}    # чёрный цвет знаков
RED='\033[0;31m'       #  ${RED}      # красный цвет знаков
GREEN='\033[0;32m'     #  ${GREEN}    # зелёный цвет знаков
YELLOW='\033[0;33m'     #  ${YELLOW}    # желтый цвет знаков
BLUE='\033[0;34m'       #  ${BLUE}      # синий цвет знаков
MAGENTA='\033[0;35m'     #  ${MAGENTA}    # фиолетовый цвет знаков
CYAN='\033[0;36m'       #  ${CYAN}      # цвет морской волны знаков
GRAY='\033[0;37m'       #  ${GRAY}      # серый цвет знаков

# Цвет фона
BGBLACK='\033[40m'     #  ${BGBLACK}
BGRED='\033[41m'       #  ${BGRED}
BGGREEN='\033[42m'     #  ${BGGREEN}
BGBROWN='\033[43m'     #  ${BGBROWN}
BGBLUE='\033[44m'     #  ${BGBLUE}
BGMAGENTA='\033[45m'     #  ${BGMAGENTA}
BGCYAN='\033[46m'     #  ${BGCYAN}
BGGRAY='\033[47m'     #  ${BGGRAY}
BGDEF='\033[49m'      #  ${BGDEF}

NORMAL='\033[0m'      # Reset color

arrColor[0]=${GREY}
arrColor[1]='\033[37m'
arrColor[2]=$RED
arrColor[3]=$GREEN
arrColor[4]=$BLUE
arrColor[5]=$MAGENTA
arrColor[6]=$BLACK

arrBackGround[0]=${BGGREY}
arrBackGround[1]='\033[37m'
arrBackGround[2]=${BGRED}
arrBackGround[3]=${BGGREEN}
arrBackGround[4]=${BGBLUE}
arrBackGround[5]=${BGMAGENTA}
arrBackGround[6]=${BGBLACK}

if [[ $1 = $2 ]] || [[ $3 = $4 ]]; then
  echo -en ${RED} "ERROR, no have argument! or equalJiEst"${NORMAL}
  exit 0
fi
CL=${arrColor[$2]}
BG=${arrBackGround[$1]}
CLR=${arrColor[$4]}
BGR=${arrBackGround[$3]}



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
    echo -en ${CL}${BG}"HOSTNAME   = "${CLR}${BGR}"$HOSTNAME${NORMAL}\n"
    echo -en ${CL}${BG}"TIMEZONE   = "${CLR}${BGR}"$TIMEZONE${NORMAL}\n"
    echo -en ${CL}${BG}"USER       = "${CLR}${BGR}"$USER${NORMAL}\n"
    echo -en ${CL}${BG}"OS         = "${CLR}${BGR}"$OS${NORMAL}\n"
    echo -en ${CL}${BG}"DATE       = "${CLR}${BGR}"$DATE${NORMAL}\n"
    echo -en ${CL}${BG}"UPTIME     = "${CLR}${BGR}"$UPTIME${NORMAL}\n"
    echo -en ${CL}${BG}"UPTIME_SEC = "${CLR}${BGR}"$UPTIME_SEC${NORMAL}\n"
    echo -en ${CL}${BG}"IP         = "${CLR}${BGR}"$IP${NORMAL}\n"
    echo -en ${CL}${BG}"MASK       = "${CLR}${BGR}"$MASK${NORMAL}\n"
    echo -en ${CL}${BG}"GATEWAY    = "${CLR}${BGR}"$GATEWAY${NORMAL}\n"
    echo -en ${CL}${BG}"RAM_TOTAL  = "${CLR}${BGR}"$RAM_TOTAL${NORMAL}\n"
    echo -en ${CL}${BG}"RAM_USED   = "${CLR}${BGR}"$RAM_USED${NORMAL}\n"
    echo -en ${CL}${BG}"RAM_FREE   = "${CLR}${BGR}"$RAM_FREE${NORMAL}\n"
    echo -en ${CL}${BG}"SPACE_ROOT = "${CLR}${BGR}"$SPACE_ROOT${NORMAL}\n"
    echo -en ${CL}${BG}"SPACE_ROOT_USED = "${CLR}${BGR}"$SPACE_ROOT_USED${NORMAL}\n"
    echo -en ${CL}${BG}"SPACE_ROOT_FREE = "${CLR}${BGR}"$SPACE_ROOT_FREE${NORMAL}\n"
}

s21School