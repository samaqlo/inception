FROM alpine:edge 
WORKDIR /var/www/html
RUN apk update && apk add php82  php82-pdo_mysql  php82-session
RUN mkdir -p /var/www/html/ && wget -O /var/www/html/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
ENTRYPOINT [ "php", "-S", "0.0.0.0:8080" ]