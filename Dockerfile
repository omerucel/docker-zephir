FROM alpine:3.7
MAINTAINER Ömer ÜCEL <omerucel@gmail.com>
WORKDIR /project

RUN apk --no-cache add \
    git \
    gcc \
    g++ \
    re2c \
    autoconf \
    automake \
    make \
    curl \
    php7-dev \
    php7-json \
    php7-pdo \
    php7-phar \
    php7-openssl \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    php7-mcrypt \
    php7-opcache \
    php7-curl \
    php7-iconv \
    php7-mbstring \
    php7-zlib \
    php7-session \
    php7-ctype \
    php7-xml \
    php7-dom \
    php7-tokenizer \
    php7-simplexml \
    php7-posix \
    php7-xmlwriter \
    php7-intl \
    php7-xdebug && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    git clone git://github.com/phalcon/php-zephir-parser.git && \
    cd /project/php-zephir-parser && phpize && ./configure && make && make install && \
    rm -rf /project/php-zephir-parser && \
    echo "extension=zephir_parser.so" >> "/etc/php7/conf.d/zephir.ini" && \
    composer global require phalcon/zephir

ENV PATH="/root/.composer/vendor/bin:${PATH}"
ENTRYPOINT ["zephir"]