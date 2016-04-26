FROM alpine:3.3
MAINTAINER Katsuma Ito <katsumai@gmail.com>

RUN apk add --update apache2-utils squid && \
rm -rf /var/cache/apk/*

RUN sed -i 's@^http_access allow localhost$@\0\nhttp_access allow ncsa_users@' /etc/squid/squid.conf
RUN sed -i '/^http_access allow ncsa_users/i auth_param basic program /usr/lib/squid/basic_ncsa_auth /usr/etc/passwd' /etc/squid/squid.conf
RUN sed -i '/^http_access allow ncsa_users/i acl ncsa_users proxy_auth REQUIRED' /etc/squid/squid.conf


RUN mkdir /usr/etc

EXPOSE 3128
VOLUME /var/log/squid

ADD init /init
CMD ["/init"]
