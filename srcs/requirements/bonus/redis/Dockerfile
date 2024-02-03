FROM alpine:3.18.6

COPY ./tools/test.sh /tmp
RUN chmod +x /tmp/test.sh
ENTRYPOINT [ "/tmp/test.sh" ]

