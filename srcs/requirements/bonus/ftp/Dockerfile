FROM alpine:edge

COPY tools/setup.sh /tmp
COPY tools/vsftpd.conf  /tmp

RUN chmod +x /tmp/setup.sh

EXPOSE 21

CMD [ "/tmp/setup.sh" ]