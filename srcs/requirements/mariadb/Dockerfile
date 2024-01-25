FROM alpine:edge

COPY ./tools/install.sh /tmp
RUN chmod +x /tmp/install.sh
RUN /tmp/install.sh
COPY ./conf/config.sh /tmp
COPY ./tools/setup.sh /tmp
RUN chmod +x /tmp/config.sh
RUN /tmp/config.sh
RUN chmod +x /tmp/setup.sh
ENTRYPOINT [ "/tmp/setup.sh"]





