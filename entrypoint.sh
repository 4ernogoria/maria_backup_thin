#!/bin/bash
touch /var/log/db_backup_cron.log
crontab -u mysql /home/oneadmin/crontab
exec /usr/sbin/crond -s -p -n 
