FROM ubuntu:14.04

include(`prerequisites.m4')

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    echo "deb http://ppa.launchpad.net/ondrej/php-7.0/ubuntu $( lsb_release -cs ) main" > /etc/apt/sources.list.d/ondrej-php-7.0.list

RUN apt-get update

RUN apt-get install -y -qq \
        php7.0-cli \
        php7.0-dev \
        php-pear \
        # `APCu is not yet supported on PHP 7: php7.0-apcu'
        php7.0-curl \
        php7.0-gmp \
        php7.0-intl \
        php7.0-json \
        php7.0-mysql \
        php7.0-sqlite

ENV PHP_CONF_DIR /etc/php/7.0/cli/conf.d

include(`configure.m4')

include(`tools.m4')

include(`cleanup.m4')
