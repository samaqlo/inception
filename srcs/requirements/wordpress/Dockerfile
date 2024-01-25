FROM alpine:edge

COPY tools/downloads.sh /tmp
RUN chmod +x tmp/downloads.sh
RUN /tmp/downloads.sh
COPY tools/setup.sh /tmp
RUN chmod +x /tmp/setup.sh
CMD ["/tmp/setup.sh"]