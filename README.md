# Laravel Cloudrun

This is a docker image to run Laravel on Google CloudRun

## Usage

```
FROM sinevia/laravel-cloudrun:v1.0.0

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
