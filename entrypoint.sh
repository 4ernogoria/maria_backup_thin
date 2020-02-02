#!/bin/bash
touch /var/log/db_backup_cron.log
chown -R 9869:9869 /mnt/backup/oneadmin
chmod -R +x /mnt/backup/oneadmin/periodic
crontab -u mysql /home/oneadmin/crontab
exec /usr/sbin/crond -s -p -n 
