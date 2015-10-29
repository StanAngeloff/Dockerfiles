FROM ubuntu:14.04

include(`prerequisites.m4')

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    echo "deb http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu $( lsb_release -cs ) main" > /etc/apt/sources.list.d/ondrej-php5-5.6.list

include(`install.m4')
include(`configure.m4')

include(`tools.m4')

include(`cleanup.m4')
