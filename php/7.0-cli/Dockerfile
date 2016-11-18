FROM ubuntu:14.04

MAINTAINER Stan Angeloff <stanimir@angeloff.name>

ENV COMPOSER_VERSION 1.2.2

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu $( lsb_release -cs ) main" > /etc/apt/sources.list.d/ondrej-php.list

RUN apt-get update -q


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
        php-pear

ENV PHP_CONF_DIR /etc/php/7.0/cli/conf.d

RUN echo "memory_limit=-1" >> "$PHP_CONF_DIR"/defaults.ini && \
    echo "date.timezone=${PHP_TIMEZONE-UTC}" >> "$PHP_CONF_DIR"/defaults.ini


RUN apt-get install -y -qq --no-install-recommends \
        curl \
        git-core

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --version=${COMPOSER_VERSION} --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash && \
    apt-get install -y nodejs


RUN apt-get clean

