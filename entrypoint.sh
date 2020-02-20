#!/bin/bash
#touch /var/log/db_backup_cron.log
#crontab -u mysql /home/oneadmin/crontab
#exec /usr/sbin/crond -s -p -n 
mkdir -p /backup/backups/hourly /backup/backups/daily /backup/backups/last_week /backup/backups/week_before /backup/backups/2weeks_before /backup/backups/month_ago /var/log/one
chmod -R 770 /backup/*
tail -f /var/log/one/*.log

