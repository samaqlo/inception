FROM alpine:3.18.6

COPY tools/setup.sh /tmp
COPY tools/vsftpd.conf  /tmp

RUN chmod +x /tmp/setup.sh

CMD [ "/tmp/setup.sh" ]