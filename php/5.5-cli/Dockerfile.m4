FROM ubuntu:14.04

include(`prerequisites.m4')

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
        php5.5-soap \
        php5.5-sqlite \
        php5.5-xml \
        php5.5-zip \
        php-pear && \
    dnl APCu is a virtual package which depends on packages which pull php7.0-cli.
    dnl When --no-install-recommends is used this behaviour is suppressed.
    dnl
    dnl See https://github.com/oerdnj/deb.sury.org/wiki/PPA-migration-to-ppa:ondrej-php#why-is-php70-cli-always-installed
    apt-get install -y -qq --no-install-recommends php5.5-apcu

ENV PHP_CONF_DIR /etc/php/5.5/cli/conf.d

include(`configure.m4')

include(`tools.m4')

include(`cleanup.m4')
