FROM php:7.1-cli-alpine

ENV PATH=${PATH}:/root/.composer/vendor/bin/
RUN apk update \
    && apk add php7-phar \
    && apk add php7-json \
    && apk add php7-openssl \
    && apk add php7-mbstring \
    && apk add php7-tokenizer \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && composer global require phpspec/phpspec

RUN rm -rf /var/cache/apk/* /var/tmp/*/tmp/*

WORKDIR /code

ENTRYPOINT [ "sh", "-c", "while [ true ]; do sleep 1d; done" ]
