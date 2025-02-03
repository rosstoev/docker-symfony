FROM composer:lts

WORKDIR /var/www/html

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash

RUN apk add symfony-cli

RUN git config --global --add safe.directory /var/www/app

RUN git config --global user.email "rossto3v@gmail.com"

RUN git config --global user.name "Rosen Stoev"

ENTRYPOINT ["symfony"]