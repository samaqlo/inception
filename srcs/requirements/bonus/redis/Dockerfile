FROM alpine:edge

COPY ./tools/test.sh /tmp
RUN chmod +x /tmp/test.sh
ENTRYPOINT [ "/tmp/test.sh" ]

