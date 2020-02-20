FROM mariabase 

MAINTAINER SharxDC

#COPY temp.sh /home/oneadmin/temp
COPY entrypoint.sh /entrypoint.sh
#COPY  mariabackup /home/oneadmin/periodic/hourly/mariabackup
#COPY  mysqldump /home/oneadmin/periodic/daily/mysqldump
#COPY  cleaner /home/oneadmin/periodic/weekly/cleaner
#COPY crontab /home/oneadmin/crontab
#COPY cronie-1.4.11-23.1.el7.x86_64.rpm  /cronie-1.4.11-23.1.el7.x86_64.rpm
#COPY cronie-anacron-1.4.11-23.1.el7.x86_64.rpm /cronie-anacron-1.4.11-23.1.el7.x86_64.rpm

RUN chmod +x /entrypoint.sh && mkdir -p /backup && touch /backup/mysqldump.cnf && \
chown 9869:9869 /backup/mysqldump.cnf && ln -s /backup/mysqldump.cnf /etc/my.cnf.d/mysqldump.cnf && \
chmod 1777 /backup && rm -f /backup/mysqldump.cnf && useradd oneadmin && usermod -a -G mysql oneadmin && chown -R oneadmin:oneadmin /home/oneadmin
#RUN yum -y install --setopt=tsflags=nodocs MariaDB-backup MariaDB-client /cronie-1.4.11-23.1.el7.x86_64.rpm /cronie-anacron-1.4.11-23.1.el7.x86_64.rpm && yum clean all && chmod +x /entrypoint.sh /home/oneadmin/temp /home/oneadmin/periodic/hourly/mariabackup /home/oneadmin/periodic/daily/mysqldump /home/oneadmin/periodic/weekly/cleaner && mkdir -p /backup && chmod 777 /backup && chown -R 9869:9869 /home/oneadmin

STOPSIGNAL SIGTERM
USER 9869
ENTRYPOINT ["/entrypoint.sh"]
