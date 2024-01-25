#!/bin/sh

# mkdir /var/www/html
# mv /tmp/index.html /var/www/html
mv /tmp/default.conf /etc/nginx/http.d/
# mv /tmp/dawdaw.png /var/www/html/
nginx -g "daemon off;"