RUN apt-get install -y -qq --no-install-recommends \
        curl \
        git-core \
        lsof

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --version=${COMPOSER_VERSION} --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION-4.x} | bash && \
    apt-get install -y nodejs
