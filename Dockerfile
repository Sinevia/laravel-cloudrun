FROM php:8.4-apache

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1


# Install required packages
RUN apt-get update -y && \
    apt-get install -y build-essential && \
    apt-get install -y zlib1g-dev && \
    apt-get install -y zip unzip && \
    apt-get install -y libwebp-dev && \
    apt-get install -y libmcrypt-dev && \
    apt-get install -y curl && \
    apt-get install -y libcurl4 && \
    apt-get install -y libcurl4-openssl-dev && \
    apt-get install -y libicu-dev && \
    # For Oniguruma not found error
    apt-get install -y libonig-dev

RUN apt-get update -y && \
    # Install bcmath
    docker-php-ext-configure bcmath && \
    docker-php-ext-install bcmath && \
    # Install calendar
    docker-php-ext-configure calendar && \
    docker-php-ext-install calendar && \
    # Install curl
    docker-php-ext-configure curl && \
    docker-php-ext-install curl && \
    # Install dom
    apt-get install -y libxml2-dev && \
    docker-php-ext-configure dom && \
    docker-php-ext-install dom && \
    # Install exif
    docker-php-ext-configure exif && \
    docker-php-ext-install exif

RUN apt-get update -y && \
    # Install gd
    apt-get install -y libfreetype6-dev && \
    apt-get install -y libjpeg62-turbo-dev && \
    apt-get install -y libpng-dev && \
    apt-get install -y libxpm-dev && \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install gd && \
    # Install iconv
    docker-php-ext-configure iconv && \
    docker-php-ext-install iconv

RUN apt-get update -y && \
    # Install imagick (not available for PHP8 yet)
    apt-get install -y libmagickwand-dev && \
    pecl install imagick-3.8.0 && \
    docker-php-ext-enable imagick

RUN apt-get update -y && \
    # Install intl
    docker-php-ext-configure intl && \
    docker-php-ext-install intl && \
    # Install mbstring
    docker-php-ext-configure mbstring && \
    docker-php-ext-install mbstring && \
    # Install opcache
    docker-php-ext-configure opcache && \
    docker-php-ext-install opcache && \
    # Install PCNTL
    docker-php-ext-configure pcntl && \
    docker-php-ext-install pcntl

RUN apt-get update -y && \
    # Install PDO
    docker-php-ext-install pdo && \
    # Install PDO SQLite 3
    apt-get install libsqlite3-dev && \
    docker-php-ext-install pdo_sqlite && \
    # Install PDO MySQL
    docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && \
    docker-php-ext-install pdo_mysql && \
    # Install simplexml
    docker-php-ext-configure simplexml && \
    docker-php-ext-install simplexml && \
    # Install XML
    docker-php-ext-configure xml && \
    docker-php-ext-install xml && \
    # Install Zip
    apt-get install -y libzip-dev && \
    docker-php-ext-configure zip && \
    docker-php-ext-install zip

RUN apt-get update -y && \
    # Install composer
    curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer && \
    # clean image
    apt-get autoremove -y && \
    apt-get clean -y
