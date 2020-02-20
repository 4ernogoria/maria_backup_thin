#!/bin/bash
TEST=$(ps aux | grep  "mariabackup --backup" | grep -v grep)
NOW=$(date '+%b %y %H:%M:%S')
wfolder=/backup/backups
mkdir -p $wfolder
#echo "$TEST"
if [ -n "$TEST" ]
then echo "$NOW process mariabackup exists, something is wrong, immediate intervention is necessary" >> /var/log/one/backup.log
else mariabackup --backup --compress --no-lock --databases=opennebula --user=oneadmin --stream=xbstream > $wfolder/hourly/$(date '+%y%m%d%H%M').xb
fi
