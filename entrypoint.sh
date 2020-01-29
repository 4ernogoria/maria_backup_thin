#!/bin/bash
crontab -u mysql /home/oneadmin/crontab
exec /usr/sbin/crond -s -p -n
