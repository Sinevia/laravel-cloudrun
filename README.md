# Laravel Cloudrun

This is a docker image to run Laravel on Google CloudRun

## Usage

```
FROM composer:2.0.6 as build 
WORKDIR /app 
COPY . /app 
RUN composer install

FROM sinevia/laravel-cloudrun

# clean image
RUN apt-get clean

EXPOSE 8080

COPY --from=build /app /var/www/
COPY docker/000-default.conf /etc/apache2/sites-available/000-default.conf 
COPY .env.example /var/www/.env 
RUN chmod 777 -R /var/www/storage/ && \     
    echo "Listen 8080" >> /etc/apache2/ports.conf && \     
    chown -R www-data:www-data /var/www/ && \     
    a2enmod rewrite
```
