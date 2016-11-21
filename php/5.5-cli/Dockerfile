FROM ubuntu:14.04

MAINTAINER Stan Angeloff <stanimir@angeloff.name>

ENV COMPOSER_VERSION 1.2.2

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu $( lsb_release -cs ) main" > /etc/apt/sources.list.d/ondrej-php.list

RUN apt-get update -q


RUN apt-get install -y -qq \
        php5.5-common \
        php5.5-cli \
        php5.5-dev \
        php5.5-bcmath \
        php5.5-curl \
        php5.5-gmp \
        php5.5-intl \
        php5.5-json \
        php5.5-mbstring \
        php5.5-mcrypt \
        php5.5-mysql \
        php5.5-readline \
        php5.5-sqlite \
        php5.5-xml \
        php5.5-zip \
        php-pear && \
                    apt-get install -y -qq --no-install-recommends php5.5-apcu

ENV PHP_CONF_DIR /etc/php/5.5/cli/conf.d

RUN echo "memory_limit=-1" >> "$PHP_CONF_DIR"/defaults.ini && \
    echo "date.timezone=${PHP_TIMEZONE-UTC}" >> "$PHP_CONF_DIR"/defaults.ini


RUN apt-get install -y -qq --no-install-recommends \
        curl \
        git-core \
        lsof

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --version=${COMPOSER_VERSION} --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash && \
    apt-get install -y nodejs


RUN apt-get clean

