MAINTAINER Stan Angeloff <stanimir@angeloff.name>

ENV COMPOSER_VERSION 1.2.2

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu $( lsb_release -cs ) main" > /etc/apt/sources.list.d/ondrej-php.list

RUN apt-get update -q
