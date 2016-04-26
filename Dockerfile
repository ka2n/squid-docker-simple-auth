FROM alpine:3.3
MAINTAINER Katsuma Ito <katsumai@gmail.com>

RUN apk add --update apache2-utils squid && \
rm -rf /var/cache/apk/*

COPY squid.conf /etc/squid/squid.conf

RUN mkdir /usr/etc

EXPOSE 3128
EXPOSE 3129
VOLUME /var/log/squid

ADD init /init
CMD ["/init"]
