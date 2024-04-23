#!/bin/sh

apk update 
apk add vsftpd
adduser -D -h /home/$FTP_USER -s /sbin/nologin $FTP_USER
echo "$FTP_USER:$FTP_PASSWD" | chpasswd
mkdir -p /home/$FTP_USER/ftp
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER
chmod a-w /home/$FTP_USER
# mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.backup
mv /tmp/vsftpd.conf /etc/vsftpd/
sed -i "s/docker_host_ip/$DOCKER_HOST_IP/g" /etc/vsftpd/vsftpd.conf
mkdir -p /var/run/vsftpd/empty
vsftpd /etc/vsftpd/vsftpd.conf