#!/bin/sh
apk update && apk add redis iputils curl php php-phar php-mysqli
echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf 
sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis.conf 
redis-server --protected-mode no