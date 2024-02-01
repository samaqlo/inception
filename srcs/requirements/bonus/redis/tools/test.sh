#!/bin/sh
apk update
apk add redis iputils curl php php-phar php-mysqli
sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis.conf 
sed -i "59i\define('WP_REDIS_HOST', 'redis');\ndefine('WP_CACHE_KEY_SALT', 'astalha.42.fr');\ndefine('WP_CACHE', 'true');" /var/www/html/wp-config.php

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv  wp-cli.phar /usr/local/bin/wp

wp --path=/var/www/html plugin install redis-cache --activate
wp --path=/var/www/html redis enable --host=redis --port=6379

redis-server --protected-mode no