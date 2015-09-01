FROM debian:jessie

COPY start.sh /start.sh

RUN apt-get update \
 && apt-get install -yq rsyslog \
 && rm -rf /var/lib/apt/lists/* \
 && chmod +x /start.sh \
 && groupadd -g 1000 user \
 && useradd -u 1000 -g 1000 user \
 && sed -i -e 's/\$PrivDropToUser syslog/\$PrivDropToUser user/' -e 's/\$PrivDropToGroup syslog/\$PrivDropToGroup user/' /etc/rsyslog.conf

CMD ["/start.sh"]
VOLUME ["/dev", "/var/log"]

