#!/bin/sh

mkdir /srv/www
apk update && apk add curl
rm -rf /srv/www/*
apk add php82 php82-fpm php82-mysqli mysql-client php82-phar php82-cgi php82-fileinfo php82-json php82-curl php82-dom php82-iconv php82-session php82-mbstring php82-openssl php82-xml php82-tokenizer
cd /srv/www
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv  wp-cli.phar /usr/local/bin/wp
cp /usr/bin/php82 /usr/bin/php
wp core download --path=/srv/www/
cp /srv/www/wp-config-sample.php /srv/www/wp-config-sample_backup.php
mv /srv/www/wp-config-sample.php /srv/www/wp-config.php

sed -i 's/listen = 127.0.0.1:9000/listen = wordpress:9000/g' /etc/php82/php-fpm.d/www.conf
sed -i "s/database_name_here/$DATABASE_NAME/g" /srv/www/wp-config.php
sed -i "s/username_here/$DATABASE_USER/g" /srv/www/wp-config.php
sed -i "s/password_here/$DATABASE_PSWD/g" /srv/www/wp-config.php
sed -i "s/localhost/$DB_HOST_NAME/g" /srv/www/wp-config.php

wp core install --path=/srv/www/ --url=$DOMAINE_NAME/ --title=$TITLE --admin_user=$ADM_USER --admin_password=$ADM_PSWD --admin_email=$ADM_EMAIL --skip-email --allow-root
wp user create --path=/srv/www/ $WP_USR $WP_EMAIL --role=author --user_pass=$WP_USR_PSWD --allow-root
wp theme install --path=/srv/www/ $THEME --activate --allow-root
wp --path=/srv/www/  plugin install redis-cache --activate
sed -i "59i\define('WP_REDIS_HOST', 'redis');\ndefine('WP_CACHE_KEY_SALT', 'astalha.42.fr');\ndefine('WP_CACHE', 'true');" /srv/www/wp-config.php
wp --path=/srv/www/  redis enable --host=redis --port=6379
chown -R nobody:nobody .
exec /usr/sbin/php-fpm82 -F 