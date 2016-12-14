FROM ubuntu:14.04

MAINTAINER Stan Angeloff <stanimir@angeloff.name>

ENV COMPOSER_VERSION 1.2.2

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu $( lsb_release -cs ) main" > /etc/apt/sources.list.d/ondrej-php.list

RUN apt-get update -q


ENV NODE_VERSION 6.x

RUN apt-get install -y -qq \
        php7.1-common \
        php7.1-cli \
        php7.1-dev \
        php7.1-bcmath \
        php7.1-curl \
        php7.1-gmp \
        php7.1-intl \
        php7.1-json \
        php7.1-mbstring \
        php7.1-mcrypt \
        php7.1-mysql \
        php7.1-readline \
        php7.1-soap \
        php7.1-sqlite \
        php7.1-xml \
        php7.1-zip \
        php-pear && \
                    apt-get install -y -qq --no-install-recommends php7.1-apcu

ENV PHP_CONF_DIR /etc/php/7.1/cli/conf.d

RUN echo "memory_limit=-1" >> "$PHP_CONF_DIR"/defaults.ini && \
    echo "date.timezone=${PHP_TIMEZONE-UTC}" >> "$PHP_CONF_DIR"/defaults.ini


RUN apt-get install -y -qq --no-install-recommends \
        curl \
        git-core \
        lsof

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --version=${COMPOSER_VERSION} --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION-4.x} | bash && \
    apt-get install -y nodejs


RUN apt-get clean

