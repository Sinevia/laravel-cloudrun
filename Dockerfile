FROM php:8-apache

ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y zip unzip
RUN apt-get install -y libwebp-dev
#RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y curl
RUN apt-get install -y libcurl4
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libicu-dev

# For Oniguruma not found error
RUN apt-get install -y libonig-dev

# Install bcmath
RUN docker-php-ext-configure bcmath
RUN docker-php-ext-install bcmath

# Install calendar
RUN docker-php-ext-configure calendar
RUN docker-php-ext-install calendar

# Install curl
RUN docker-php-ext-configure curl
RUN docker-php-ext-install curl

# Install dom
RUN apt-get install -y libxml2-dev
RUN docker-php-ext-configure dom
RUN docker-php-ext-install dom

# Install exif
RUN docker-php-ext-configure exif
RUN docker-php-ext-install exif

# Install gd
RUN apt-get install -y libfreetype6-dev
RUN apt-get install -y libjpeg62-turbo-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libxpm-dev
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-install gd

# Install iconv
RUN docker-php-ext-configure iconv
RUN docker-php-ext-install iconv

# Install imagick (not available for PHP8 yet)
# RUN apt-get install -y libmagickwand-dev
# RUN pecl install imagick-3.4.4
# RUN docker-php-ext-enable imagick

# Install intl
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

# Install mbstring
RUN docker-php-ext-configure mbstring
RUN docker-php-ext-install mbstring

# Install opcache
RUN docker-php-ext-configure opcache
RUN docker-php-ext-install opcache

# Install PCNTL
RUN docker-php-ext-configure pcntl
RUN docker-php-ext-install pcntl

# Install PDO
RUN docker-php-ext-install pdo

# Install PDO SQLite 3
RUN apt-get install libsqlite3-dev
RUN docker-php-ext-install pdo_sqlite

# Install PDO MySQL
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd
RUN docker-php-ext-install pdo_mysql

# Install simplexml
RUN docker-php-ext-configure simplexml
RUN docker-php-ext-install simplexml

# Install tokenizer
RUN docker-php-ext-configure tokenizer
RUN docker-php-ext-install tokenizer

# Install XML
RUN docker-php-ext-configure xml
RUN docker-php-ext-install xml
    
# Install Zip
RUN apt-get install -y libzip-dev
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip

# Install composer
ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# clean image
RUN apt-get autoremove -y
RUN apt-get clean -y
