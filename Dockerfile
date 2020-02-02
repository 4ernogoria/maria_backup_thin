FROM 4ernogoria/mariadb_new_base

MAINTAINER SharxDC

COPY temp.sh /home/oneadmin/temp
COPY entrypoint.sh /entrypoint.sh
#COPY  mariabackup /home/oneadmin/periodic/hourly/mariabackup
#COPY  mysqldump /home/oneadmin/periodic/daily/mysqldump
#COPY  cleaner /home/oneadmin/periodic/weekly/cleaner
#COPY crontab /home/oneadmin/crontab
COPY cronie-1.4.11-23.1.el7.x86_64.rpm  /cronie-1.4.11-23.1.el7.x86_64.rpm
COPY cronie-anacron-1.4.11-23.1.el7.x86_64.rpm /cronie-anacron-1.4.11-23.1.el7.x86_64.rpm

RUN yum -y install --setopt=tsflags=nodocs MariaDB-backup MariaDB-client /cronie-1.4.11-23.1.el7.x86_64.rpm /cronie-anacron-1.4.11-23.1.el7.x86_64.rpm && yum clean all && chmod +x /entrypoint.sh && mkdir -p /backup && chmod 777 /backup && mkdir -p /backup/oneadmin && chown -R 9869:9869 /backup/oneadmin && rm -rf /home/oneadmin /cronie-anacron-1.4.11-23.1.el7.x86_64.rpm /cronie-1.4.11-23.1.el7.x86_64.rpm && ln -s /backup/oneadmin /home/oneadmin

STOPSIGNAL SIGTERM

ENTRYPOINT ["/entrypoint.sh"]
