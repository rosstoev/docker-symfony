FROM composer:lts

WORKDIR /var/www/app

ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]
