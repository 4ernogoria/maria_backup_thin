#!/bin/bash
for bhost in $(grep "mariabackuphost" /etc/hosts | awk '{ print $2 }')
  do if ssh -q -o "BatchMode=yes" oneadmin@$bhost exit
    then echo "host is accesible,rsyncing to $bhost" && rsync -a /backup/backups/ oneadmin@"$bhost":/tmp/backup 2>&1
    else echo "host $bhost is unreachable for ssh connection"
     fi
  done

