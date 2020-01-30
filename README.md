# maria_backup_thin
to do:
-think about mounting /home/cron folder as a volume(which supposed to have the current structure of /home/oneadmin(crontab file + periodic folder+ maybe my.cnf file which should be simlinked to my.cnf.d/ to have the ability of changing it for different DB passwords
-check if the RO mounting still have the ability to execute script on them, if it has, maybe mount the volume RO mode
- if its possible to mount a singular file inside the container
