#!/bin/bash
DISK_USAGE=$(df -hT | grep 9p)
DISK_THERSHOLD=28
MSG=""
while read -r line
do
        threshold=$(echo "$line" | awk -F ' ' '{print $6}' | cut -d % -f 1)
        partition=$(echo $line | awk -F " " '{print $NF}')
        if [ $threshold -gt $DISK_THERSHOLD ]
        then
                MSG+="High Disk usage on $partition filesystem usage is $threshould. \n"
        fi
done <<< ${DISK_USAGE}
echo -e "Message: $MSG"
echo $MSG | mutt -s "High Disk Usage on server" jayanthavula1997@gmail.com
