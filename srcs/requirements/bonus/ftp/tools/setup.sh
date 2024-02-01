#!/bin/sh

apk update 
apk add vsftpd
adduser -D -h /home/samaqloftp -s /sbin/nologin samaqloftp
echo "samaqloftp:samaqlo" | chpasswd
mkdir -p /home/samaqloftp/ftp
chown -R samaqloftp:samaqloftp /home/samaqloftp
chmod a-w /home/samaqloftp
mv /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.backup
mv /tmp/vsftpd.conf /etc/vsftpd/
sed -i "s/docker_host_ip/$DOCKER_HOST_IP/g" /etc/vsftpd/vsftpd.conf
mkdir -p /var/run/vsftpd/empty
vsftpd /etc/vsftpd/vsftpd.conf