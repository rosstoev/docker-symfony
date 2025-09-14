FROM composer:lts

ARG GIT_EMAIL=""
ARG GIT_USERNAME=""

WORKDIR /var/www

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash

RUN apk add symfony-cli

RUN git config --global --add safe.directory /var/www/app

RUN git config --global user.email $GIT_EMAIL

RUN git config --global user.name $GIT_USERNAME

ENTRYPOINT ["symfony"]