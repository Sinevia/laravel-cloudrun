FROM php:7.4-apache

RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y zip unzip
RUN apt-get install -y libwebp-dev
#RUN apt-get install -y libjpeg62-turbo-dev
#RUN apt-get install -y libpng-dev
#RUN apt-get install -y libxpm-dev
#RUN apt-get install -y libfreetype6-dev
#RUN apt-get install -y libmcrypt-dev
RUN apt-get install -y curl
RUN apt-get install -y libcurl4
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libicu-dev

# For Oniguruma not found error
RUN apt-get install -y libonig-dev

# Install PDP
#RUN docker-php-ext-install mysql
RUN docker-php-ext-install pdo

# Install PDO SQLite 3
RUN apt-get install libsqlite3-dev
RUN docker-php-ext-install pdo_sqlite

# Install PDO MySQL
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd
RUN docker-php-ext-install pdo_mysql
#RUN docker-php-ext-configure mysqli --with-mysqli=mysqlnd


# Install gd
#RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp
#RUN docker-php-ext-install gd

# Install dom
RUN docker-php-ext-configure dom
RUN docker-php-ext-install dom

# Install intl
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

# Install mbstring
RUN docker-php-ext-configure mbstring
RUN docker-php-ext-install mbstring

# Install intl
RUN docker-php-ext-configure simplexml
RUN docker-php-ext-install simplexml

# Install Zip
RUN apt-get install -y libzip-dev
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip

# Install imagick
RUN apt-get install -y libmagickwand-dev
RUN pecl install imagick-3.4.4
RUN docker-php-ext-enable imagick

# clean image
RUN apt-get clean
