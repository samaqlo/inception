FROM alpine:3.18.6

RUN mkdir /srv/www
RUN apk update && apk add nginx && apk add openssl 
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=[astalha.1337.ma]"

COPY conf/default.conf ./tmp
COPY tools/setup.sh ./tmp

CMD sh tmp/setup.sh