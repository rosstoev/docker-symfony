ARG IMAGE_VERSION=8.1-debian-12

FROM bitnami/php-fpm:${IMAGE_VERSION}

COPY php-fpm/custom.ini /opt/bitnami/php/etc/conf.d/custom.ini

WORKDIR /var/www/app

