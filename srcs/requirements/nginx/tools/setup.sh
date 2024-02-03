#!/bin/sh

mv /tmp/default.conf /etc/nginx/http.d/
nginx -g "daemon off;"