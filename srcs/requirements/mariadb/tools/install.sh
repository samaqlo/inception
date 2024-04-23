#!/bin/sh

apk update && apk add mariadb
mkdir -p /run/mysqld
mkdir -p /var/lib/mysql
rm -rf /var/lib/mysql/*
mariadb-install-db --user=root --datadir=/var/lib/mysql --skip-test-db