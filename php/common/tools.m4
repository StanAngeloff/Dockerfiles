RUN apt-get install -y -qq --no-install-recommends \
        curl \
        git-core

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV NPM_CONFIG_CACHE /cache/npm

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash && \
    apt-get install -y nodejs
