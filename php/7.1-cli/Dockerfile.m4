FROM ubuntu:14.04

include(`prerequisites.m4')

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

include(`configure.m4')

include(`tools.m4')

include(`cleanup.m4')
