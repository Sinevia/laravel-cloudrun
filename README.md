# Laravel on Google CloudRun

This is a docker image to run Laravel on Google CloudRun. 

## Details

This is a plug-and-play image that is used to deploy a Laravel application to the Google CloudRun.

Out-of-the-box the image comes with lots of PHP libraries are pre-installed. For instance:

- Composer
- Dom
- GD
- ImageMagic
- MySQL
- SQLite
- and others

Using the image will save approximately 10-15 minutes of deployment time


## Usage

```
FROM sinevia/laravel-cloudrun:v2.3.0

WORKDIR /var/www/
COPY . /var/www/
RUN composer install

# clean image
RUN apt-get clean

EXPOSE 8080

COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf 
COPY .env.example /var/www/.env 
RUN chmod 777 -R /var/www/storage/ && \     
    echo "Listen 8080" >> /etc/apache2/ports.conf && \     
    chown -R www-data:www-data /var/www/ && \     
    a2enmod rewrite
```

## Notes
For PHP 8.4 use v2.4.0

For PHP 8.3 use v2.3.0

For PHP 8.2 use v2.2.1

For PHP 8.1 use v2.2.0

For PHP 8.0 use v2.0.0 (note ImageMagick is available for PHP 8 yet)

For PHP 7.4 use v1.1.0

## Changelog
2025-04-10 - PHP 8.4 (v2.4.0)
2025-04-10 - PHP 8.3 (v2.3.0)
2023-06-06 - PHP 8.2 (v2.2.0)
2023-06-06 - PHP 8.1 (v2.2.0)
2021-08-30 - image size reduced
