FROM php:7.4-apache

RUN apt-get update -y  \
    && apt-get install -y build-essential \
#RUN apt-get install -y zlib1g-dev
#RUN apt-get install -y zip unzip
#RUN apt-get install -y libzip-dev
#RUN apt-get install -y libwebp-dev
#RUN apt-get install -y libjpeg62-turbo-dev
#RUN apt-get install -y libpng-dev
#RUN apt-get install -y libxpm-dev
#RUN apt-get install -y libfreetype6-dev
#RUN apt-get install -y libmcrypt-dev
    && apt-get install -y curl \
    && apt-get install -y libcurl4 \
    && apt-get install -y libcurl4-openssl-dev \
    && apt-get install -y libicu-dev \
#RUN apt-get install -y libmagickwand-dev

# For Oniguruma not found error
    && apt-get install -y libonig-dev

#RUN docker-php-ext-install mysql
RUN docker-php-ext-install pdo 
# RUN docker-php-ext-install pdo_sqlite
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd
RUN docker-php-ext-install pdo_mysql
#RUN docker-php-ext-configure mysqli --with-mysqli=mysqlnd
#RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp
#RUN docker-php-ext-install gd
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-configure mbstring
RUN docker-php-ext-install mbstring
#RUN docker-php-ext-configure opcache
#RUN docker-php-ext-install opcache
#RUN docker-php-ext-configure zip
#RUN docker-php-ext-install zip

# install xdebug
# RUN pecl install xdebug
# RUN docker-php-ext-enable xdebug
# RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_autostart=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.default_enable=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.profiler_enable=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
# RUN echo "xdebug.remote_log=\"/tmp/xdebug.log\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# configure opcache
# RUN echo "opcache.memory_consumption=128" >> /usr/local/etc/php/conf.d/opcache-recommended.ini
# RUN echo "opcache.interned_strings_buffer=8" >> /usr/local/etc/php/conf.d/opcache-recommended.ini
# RUN echo "opcache.max_accelerated_files=4000" >> /usr/local/etc/php/conf.d/opcache-recommended.ini
# RUN echo "opcache.revalidate_freq=2" >> /usr/local/etc/php/conf.d/opcache-recommended.ini
# RUN echo "opcache.fast_shutdown=1" >> /usr/local/etc/php/conf.d/opcache-recommended.ini

# install imagick
#RUN pecl install imagick-3.4.4
#RUN docker-php-ext-enable imagick

# clean image
RUN apt-get clean
