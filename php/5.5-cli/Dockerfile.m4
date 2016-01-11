FROM ubuntu:14.04

include(`prerequisites.m4')

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    echo "deb http://ppa.launchpad.net/ondrej/php5/ubuntu $( lsb_release -cs ) main" > /etc/apt/sources.list.d/ondrej-php5-5.5.list

RUN apt-get update

RUN apt-get install -y -qq \
        php5-cli \
        php5-dev \
        php-pear \
        php5-apcu \
        php5-curl \
        php5-gmp \
        php5-intl \
        php5-json \
        php5-mcrypt \
        php5-mysql \
        php5-sqlite

ENV PHP_CONF_DIR /etc/php5/cli/conf.d

include(`configure.m4')

include(`tools.m4')

include(`cleanup.m4')
