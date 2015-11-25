FROM ubuntu:14.04

include(`prerequisites.m4')

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    echo "deb http://ppa.launchpad.net/ondrej/php-7.0/ubuntu $( lsb_release -cs ) main" > /etc/apt/sources.list.d/ondrej-php-7.0.list

RUN apt-get update

# The PHP 7.0 install now comes with GMP, JSON out of the box.
# There is no need to install separate packages.
RUN apt-get install -y -qq \
        expect wget \
        php7.0-cli \
        php7.0-dev \
        php-curl \
        php-intl \
        php-json \
        php-opcache \
        php-sqlite3

# APCu is not yet supported on PHP 7.

ENV PHP_CONF_DIR /etc/php/7.0/cli/conf.d

include(`configure.m4')

include(`tools.m4')

# Install PEAR non-interactively.
# This is needed until 'php-pear' is included in the PPA.
RUN mkdir -p /tmp/PEAR && cd /tmp/PEAR && \
    wget http://pear.php.net/go-pear.phar && \
    echo 'spawn php /tmp/PEAR/go-pear.phar' > install && \
    echo 'expect "1-12, '"'all'"' or Enter to continue:"' >> install && \
    echo 'send "\r"' >> install && \
    echo 'expect -re {\[Y/n\]}' >> install && \
    echo 'send "y\r"' >> install && \
    echo 'expect "Press Enter to continue"' >> install && \
    echo 'send "\r"' >> install && \
    expect install && \
    rm -R /tmp/PEAR

include(`cleanup.m4')
