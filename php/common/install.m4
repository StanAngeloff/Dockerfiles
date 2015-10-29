RUN apt-get update

RUN apt-get install -y -qq \
        php5-cli \
        php5-dev \
        php-pear \
        php5-apcu \
        php5-curl \
        php5-gmp \
        php5-intl \
        php5-json \
        php5-sqlite
