ENV PHP_CONF_DIR /etc/php5/cli/conf.d

RUN echo "memory_limit=-1" >> "$PHP_CONF_DIR"/defaults.ini && \
    echo "date.timezone=${PHP_TIMEZONE:-UTC}" >> "$PHP_CONF_DIR"/defaults.ini
