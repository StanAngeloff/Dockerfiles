FROM ubuntu:14.04

include(`prerequisites.m4')

RUN apt-get install -y -qq \
        php7.0-common \
        php7.0-cli \
        php7.0-dev \
        php7.0-apcu \
        php7.0-curl \
        php7.0-gmp \
        php7.0-intl \
        php7.0-json \
        php7.0-mbstring \
        php7.0-mcrypt \
        php7.0-mysql \
        php7.0-readline \
        php7.0-sqlite \
        php7.0-xml \
        php7.0-zip \
        php-pear

ENV PHP_CONF_DIR /etc/php/7.0/cli/conf.d

include(`configure.m4')

include(`tools.m4')

include(`cleanup.m4')
