FROM ubuntu:14.04

MAINTAINER Stan Angeloff <stanimir@angeloff.name>

ENV COMPOSER_VERSION 1.2.2

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu $( lsb_release -cs ) main" > /etc/apt/sources.list.d/ondrej-php.list

RUN apt-get update -q


RUN apt-get install -y -qq \
        php5.6-common \
        php5.6-cli \
        php5.6-dev \
        php5.6-bcmath \
        php5.6-curl \
        php5.6-gmp \
        php5.6-intl \
        php5.6-json \
        php5.6-mbstring \
        php5.6-mcrypt \
        php5.6-mysql \
        php5.6-readline \
        php5.6-sqlite \
        php5.6-xml \
        php5.6-zip \
        php-pear && \
                    apt-get install -y -qq --no-install-recommends php5.6-apcu

ENV PHP_CONF_DIR /etc/php/5.6/cli/conf.d

RUN echo "memory_limit=-1" >> "$PHP_CONF_DIR"/defaults.ini && \
    echo "date.timezone=${PHP_TIMEZONE-UTC}" >> "$PHP_CONF_DIR"/defaults.ini


RUN apt-get install -y -qq --no-install-recommends \
        curl \
        git-core

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --version=${COMPOSER_VERSION} --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash && \
    apt-get install -y nodejs


RUN apt-get clean

