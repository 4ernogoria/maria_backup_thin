FROM localhost/maria_base_lnk 

MAINTAINER SharxDC

COPY entrypoint.sh /entrypoint.sh
COPY cronie-1.4.11-23.1.el7.x86_64.rpm  /cronie-1.4.11-23.1.el7.x86_64.rpm
COPY cronie-anacron-1.4.11-23.1.el7.x86_64.rpm /cronie-anacron-1.4.11-23.1.el7.x86_64.rpm

RUN yum -y install --setopt=tsflags=nodocs MariaDB-backup MariaDB-client \
                                           /cronie-1.4.11-23.1.el7.x86_64.rpm \
                                           /cronie-anacron-1.4.11-23.1.el7.x86_64.rpm && \
    yum clean all && \
    chmod +x /entrypoint.sh && \
    chmod 777 /mnt && mkdir -p /mnt/backup/oneadmin && \
    touch /mnt/backup/oneadmin/mysqldump.cnf && \
    ln -s /mnt/backup/oneadmin/mysqldump.cnf /etc/my.cnf.d/mysqldump.cnf && \
    chown -R 9869:9869 /mnt/backup/oneadmin && \
    rm -rf /home/oneadmin /cronie-anacron-1.4.11-23.1.el7.x86_64.rpm /cronie-1.4.11-23.1.el7.x86_64.rpm /var/log/* && \
    ln -s /mnt/backup/oneadmin /home/oneadmin

STOPSIGNAL SIGTERM

ENTRYPOINT ["/entrypoint.sh"]
