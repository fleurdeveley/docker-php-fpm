FROM php:7.4-fpm-buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y apt-transport-https sudo curl zip unzip pkg-config cron libonig-dev libcurl4-openssl-dev libssl-dev && \
    rm -r /var/lib/apt/lists/* && apt-get autoremove -y && apt-get clean all

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql bcmath

RUN pecl install mongodb && echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

EXPOSE 9000
