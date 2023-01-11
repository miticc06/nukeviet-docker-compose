FROM php:7.3-apache

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update -y && apt-get install -y libpng-dev

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev 

RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip
 
RUN a2enmod rewrite

RUN apt-get update && apt-get install -y \ 
libfreetype6-dev libjpeg62-turbo-dev \ 
libgd-dev libpng-dev
RUN docker-php-ext-configure gd \ 
--with-freetype-dir=/usr/include/ \ 
--with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
