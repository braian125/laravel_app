FROM php:7-fpm

# install apt dependencies
# some of these are not needed in all php projects
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    ca-certificates \
    curl \
    dos2unix \
    git \
    g++ \
    jq \
    libedit-dev \
    libfcgi0ldbl \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    #libpng12-dev \
    libpq-dev \
    libssl-dev \
    mcrypt \
    openssh-client \
    supervisor \
    unzip \
    zip \
    && rm -r /var/lib/apt/lists/*

RUN apt-get install \
    autoconf pkg-config

WORKDIR /var/www

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apt-get install -y openssl

RUN curl -s https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer