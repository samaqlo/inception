#!/bin/sh

touch init_db.sql
echo "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;" > init_db.sql
echo "CREATE USER IF NOT EXISTS '$DATABASE_USER' IDENTIFIED BY '$DATABASE_PSWD';" >> init_db.sql
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER';" >> init_db.sql
echo "FLUSH PRIVILEGES;" >> init_db.sql

exec mariadbd --no-defaults --user=root --datadir=/var/lib/mysql --init-file=/init_db.sql
