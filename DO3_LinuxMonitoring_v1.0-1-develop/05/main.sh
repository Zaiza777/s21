#!/bin/bash
if ! echo $1 | grep -q '\/$' ; then
echo "kyky"
exit 0
fi

START=$(date +%s%N)

COUNTDIR=$(ls -lR $1| grep "^d" | wc -l )
COUNTFILE=$(ls -lR $1| grep "^-" | wc -l )
TOPDIRECTORY=$(du -sh -- ./*/ | sort -rh | head -n 5 | awk '{print $2 " - " $1}' )
CONFFILE=$(ls -lR $1| grep ".conf$" | wc -l)
TEXTFILE=$(ls -lR $1| grep ".txt$" | wc -l)
EXECFILE=$(find $1 -executable -type f | wc -l)
LOGFILE=$(ls -lR $1| grep ".log$" | wc -l)
ARCHFILE=$(ls -lR $1 | grep -e ".rar$" -e ".tar$" -e ".zip$" | wc -l)
SYMBOLLINK=$(ls -lR $1 | grep -e "^l" | wc -l)
TOPFILE=$(ls -lSh $1 | head -6 | tail -n 5 | awk '{print $9 " - " $5}')


echo "Total number of folders (including all nested ones) = ${COUNTDIR}"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo  "${TOPDIRECTORY}"
echo  "Total number of files = ${COUNTFILE}"
echo  "Configuration files (with the .conf extension) =  ${CONFFILE}"
echo  "Executable files = ${EXECFILE}"
echo  "Log files (with the extension .log) = ${LOGFILE}"
echo  "Archive files = ${ARCHFILE}"
echo  "Symbolic links = ${SYMBOLLINK}"
echo  "TOPFILE ${TOPFILE}"


F="$(find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $2}')"
FS="$(find $1 -type f -executable -exec du -h {} + | sort -hr | head -10 | awk '{print $1}')"
FILETOP=($F)
FILETOPSIZE=($FS)

for (( i = 0; i < 10; i++ )); do
        printf "${FILETOP[$i]} - ${FILETOPSIZE[$i]}"
        HASH=$(md5sum ${FILETOP[$i]} | awk '{print $1}')
        printf " - ${HASH} \n"
done

END=$(date +%s%N)
DIFF=$((($END - $START)/1000000))
printf "Time end %d in mill second"  $DIFF


