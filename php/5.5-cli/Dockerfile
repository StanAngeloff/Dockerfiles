FROM ubuntu:14.04

MAINTAINER Stan Angeloff <stanimir@angeloff.name>

ENV COMPOSER_VERSION 1.2.2


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

RUN echo "memory_limit=-1" >> "$PHP_CONF_DIR"/defaults.ini && \
    echo "date.timezone=${PHP_TIMEZONE:-UTC}" >> "$PHP_CONF_DIR"/defaults.ini


RUN apt-get install -y -qq --no-install-recommends \
        curl \
        git-core

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --version=${COMPOSER_VERSION} --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash && \
    apt-get install -y nodejs


RUN apt-get clean

