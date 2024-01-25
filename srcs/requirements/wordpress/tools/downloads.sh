#!/bin/sh

mkdir /srv/www
apk update && apk add curl 
rm -rf /srv/www/*
# curl https://wordpress.org/latest.tar.gz | tar zx -C /srv/www && mv /srv/www/wordpress/* /srv/www && rm -rf /srv/www/wordpress
apk add php php-fpm php-mysqli mysql-client php-phar php-cgi php-fileinfo php-json php-curl php-dom php-iconv php-session php-exif php-mbstring php-openssl php-xml php-tokenizer
cd /srv/www
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv  wp-cli.phar /usr/local/bin/wp
mkdir /srv/www/wordpress
wp core download --path=/srv/www/wordpress
cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config-sample_backup.php
mv /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
# sed -i -r "s/database/$DATABASE_NAME/1"   wp-config.php
# sed -i -r "s/database_user/$DATABASE_USER/1"  wp-config.php
# sed -i -r "s/passwod/$DATABASE_PSWD/1"    wp-config.php
# sed -i -r "s/localhost/$DB_HOST_NAME/1"   wp-config.php

