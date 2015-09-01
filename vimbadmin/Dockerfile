FROM php:5.6-fpm

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      bzip2 \
      sudo \
      git \
      libpng12-dev \
      libjpeg-dev \
      libmemcached-dev \
      libmcrypt-dev \
      mysql-client \
      patch \
 && rm -rf /var/lib/apt/lists/* \
 && curl -fsL http://pecl.php.net/get/memcache-2.2.7.tgz >> /usr/src/php/ext/memcache.tgz \
 && tar -xf /usr/src/php/ext/memcache.tgz -C /usr/src/php/ext/ \
 && rm /usr/src/php/ext/memcache.tgz \
 && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
 && docker-php-ext-install \
      gd \
      zip \
      mysql \
      pdo_mysql \
      memcache-2.2.7 \
      mcrypt \
      mbstring \
      json \
      gettext \
 && echo "date.timezone = 'UTC'" > /usr/local/etc/php/php.ini \ 
 && echo "short_open_tag = 0" >> /usr/local/etc/php/php.ini \
 && curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin

ENV INSTALL_PATH=/var/www/html \
    VIMBADMIN_VERSION=3.0.12

COPY patch /patch

RUN cd /tmp \
 && rm -rf $INSTALL_PATH \
 && curl -o VIMBADMIN.tar.gz -fSL https://github.com/opensolutions/ViMbAdmin/archive/${VIMBADMIN_VERSION}.tar.gz \
 && tar zxf VIMBADMIN.tar.gz \
 && rm VIMBADMIN.tar.gz \
 && mv ViMbAdmin-${VIMBADMIN_VERSION} $INSTALL_PATH \
 && cd $INSTALL_PATH \
 && composer install \
 && patch $INSTALL_PATH/application/views/mailbox/email/settings.phtml < /patch \
 && rm /patch

WORKDIR /var/www/html
VOLUME /var/www/html
COPY mail.mobileconfig.php /var/www/html/public/mail.mobileconfig.php
COPY mozilla-autoconfig.xml /var/www/html/public/mail/config-v1.1.xml
COPY docker-entrypoint.sh /entrypoint.sh
COPY application.ini /var/www/html/application/configs/application.ini

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
