#!/bin/bash
wfolder=/backup/backups
mkdir -p $wfolder $wfolder/last_week $wfolder/week_before $wfolder/2weeks_before $wfolder/month_ago
oneweekold=$(find "$wfolder"/daily -type f -maxdepth 0 -mtime +6 -printf '%P\n')
NOW=$(date '+%b %y %H:%M:%S')

#basically it gradually moves backups week by week starting from the oldest, then chooses the 7days old backup from
#the daily/folder(which is supposed to have 7 backups according to the number of week days)  and puts in the last_week/

rm -rf "$wfolder"/month_ago/* && echo "$NOW older than a month_ago backup successfuly removed" >> /var/log/one/backup.log
mv "$wfolder"/2weeks_before/* "$wfolder"/month_ago/ && echo "$NOW 3weeks old backup moved to month_ago folder" >> /var/log/one/backup.log
mv "$wfolder"/week_before/* "$wfolder"/2weeks_before/ && echo "$NOW week_before backup moved to 3weeks folder" >> /var/log/one/backup.log
mv "$wfolder"/last_week/* "$wfolder"/week_before/ && echo "$NOW last_week backup moved week_before folder" >> /var/log/one/backup.log
if [ -s "$oneweekold" ]
then mv "$wfolder"/daily/"$oneweekold" "$wfolder"/last_week/ && echo "$NOW oldest (last mod > 6 days) "$oneweekold" backup moved to last_week folder" >> /var/log/one/backup.log
else echo "WARNING. A week old backup file wasnt found. Is backup system working properly" >> /var/log/one/backup.log
fi
