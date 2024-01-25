#!/bin/sh

sed -i 's/listen = 127.0.0.1:9000/listen = wordpress:9000/g' /etc/php82/php-fpm.d/www.conf
sed -i "s/database_name_here/$DATABASE_NAME/g" /srv/www/wordpress/wp-config.php
sed -i "s/username_here/$DATABASE_USER/g" /srv/www/wordpress/wp-config.php
sed -i "s/password_here/$DATABASE_PSWD/g" /srv/www/wordpress/wp-config.php
sed -i "s/localhost/$DB_HOST_NAME/g" /srv/www/wordpress/wp-config.php

wp core install --path=/srv/www/wordpress/ --url=$DOMAINE_NAME/ --title=$TITLE --admin_user=$ADM_USER --admin_password=$ADM_PSWD --admin_email=$ADM_EMAIL --skip-email --allow-root
wp user create --path=/srv/www/wordpress/ $WP_USR $WP_EMAIL --role=author --user_pass=$WP_USR_PSWD --allow-root
wp theme install --path=/srv/www/wordpress/ $THEME --activate --allow-root

exec /usr/sbin/php-fpm82 -F