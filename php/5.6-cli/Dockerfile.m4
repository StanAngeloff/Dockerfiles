FROM ubuntu:14.04

include(`prerequisites.m4')

RUN apt-get install -y -qq \
        php5.6-common \
        php5.6-cli \
        php5.6-dev \
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
        php-pear && \
    dnl APCu is a virtual package which depends on packages which pull php7.0-cli.
    dnl When --no-install-recommends is used this behaviour is suppressed.
    dnl
    dnl See https://github.com/oerdnj/deb.sury.org/wiki/PPA-migration-to-ppa:ondrej-php#why-is-php70-cli-always-installed
    apt-get install -y -qq --no-install-recommends php5.6-apcu

ENV PHP_CONF_DIR /etc/php/5.6/cli/conf.d

include(`configure.m4')

include(`tools.m4')

include(`cleanup.m4')
