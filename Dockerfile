FROM 4ernogoria/mariadb_new_base

MAINTAINER SharxDC

COPY temp.sh /home/oneadmin/temp
COPY entrypoint.sh /entrypoint.sh
COPY cronie-1.4.11-23.1.el7.x86_64.rpm  /cronie-1.4.11-23.1.el7.x86_64.rpm
COPY cronie-anacron-1.4.11-23.1.el7.x86_64.rpm /cronie-anacron-1.4.11-23.1.el7.x86_64.rpm

RUN yum -y install --setopt=tsflags=nodocs MariaDB-backup MariaDB-client /cronie-1.4.11-23.1.el7.x86_64.rpm /cronie-anacron-1.4.11-23.1.el7.x86_64.rpm && yum clean all && chmod +x /entrypoint.sh /home/oneadmin/temp && touch /var/log/cron && echo "1-59 * * * * /bin/bash /home/oneadmin/temp" > /home/oneadmin/crontab && mkdir -p /backup && chmod 777 /backup && chown -R 9869:9869 /home/oneadmin

STOPSIGNAL SIGTERM

ENTRYPOINT ["/entrypoint.sh"]
