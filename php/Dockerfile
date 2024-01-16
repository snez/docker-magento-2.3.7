FROM php:7.4-fpm

RUN apt-get update

# gd
RUN apt-get install -y libzip-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libfreetype-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd

# bcmath
RUN docker-php-ext-install -j$(nproc) bcmath

# intl
RUN apt-get install -y libicu-dev libxml2-dev
RUN docker-php-ext-install -j$(nproc) intl

# pdo_mysql
RUN docker-php-ext-install -j$(nproc) pdo_mysql

# soap
RUN docker-php-ext-install -j$(nproc) soap

# sockets
RUN docker-php-ext-install -j$(nproc) sockets

# xsl
RUN apt-get install -y libxslt1-dev
RUN docker-php-ext-install -j$(nproc) xsl

# zip
RUN docker-php-ext-install -j$(nproc) zip

# Composer 2
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer