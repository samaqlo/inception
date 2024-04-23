FROM alpine:3.18.6

WORKDIR /data
COPY ./tools/test.sh /tmp
RUN chmod 777 /data
RUN chmod +x /tmp/test.sh
ENTRYPOINT [ "/tmp/test.sh" ]