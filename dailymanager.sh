#!/bin/bash
dayfolder=/backup/backups/daily
hourfolder=/backup/backups/hourly
mkdir -p "$dayfolder"
mkdir -p "$hourfolder"
onedayold=$(find "$hourfolder" -type f -printf '%T+ %p\n' | sort | tail -n 1 | awk '{ print $2 }')
NOW=$(date '+%b %y %H:%M:%S')

#supposed to be executed late at evening
if [ -s "onedayold" ]
  then mv "$onedayold" "$dayfolder" && echo "$NOW backup "$onedayold" from a number made yesterday moved to the daily folder" >> /var/log/one/backup.log && \
       rm -f "$wfolder"/hourly/* 2&>/dev/null && echo "$NOW cleaned hourly backup folder" >> /var/log/one/backup.log
  else echo "$NOW WARNING. no files was sorted out for an evening moving, is backup service working properly "
fi
