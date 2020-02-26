#!/bin/bash
set -e
if [ -n  "$DBUSER" ] && [ -n  "$DBPASS" ]
   then echo "created .cnf file for "$DBUSER" with password"
   else echo >&2 "Supposed to be set 2 arguments: DBUSER=user(wth certain rights in mariadb) DBPASS=password of his"
#touch /var/log/db_backup_cron.log
#crontab -u mysql /home/oneadmin/crontab
#exec /usr/sbin/crond -s -p -n 
#mkdir -p /backup/backups/hourly /backup/backups/daily /backup/backups/last_week /backup/backups/week_before /backup/backups/2weeks_before /backup/backups/month_ago /var/log/one
/bin/echo -e "[mysqldump] \nhost=127.0.0.1 \nuser="$DBUSER" \npassword="$DBPASS" \n[client] \nhost=127.0.0.1 \nuser="$DBUSER" \npassword="$DBPASS"" > /backup/mysqldump.cnf
chmod -R 770 /backup/*
exec tail -f /var/log/one/*.log

