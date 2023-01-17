FROM php:8.2.1-fpm-alpine3.17                                                  Dockerfile                                                                FROM php:8.2.1-fpm-alpine3.17

WORKDIR /var/www/html

# Installing OS libs
RUN apk update
RUN apk add --no-cache zip libzip-dev

# Installing composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN rm -rf composer-setup.php

# Installing bash
RUN apk add bash
RUN sed -i 's/bin\/ash/bin\/bash/g' /etc/passwd

#RUN docker-php-ext-install gd
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-enable opcache
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip



#RUN composer install --no-dev