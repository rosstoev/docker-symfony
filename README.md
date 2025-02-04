# Symfony docker build
### This is the docker build for develop symfony application.
# Structure
```sh
┣ 📂 app/
┣ 📂 dockerfiles/
┣ ┃ ┣ 📜 composer.dockerfile
┣ ┃ ┣ 📜 nginx.dockerfile
┣ ┃ ┣ 📜 php-fpm.dockerfile
┣ ┃ ┣ 📜 symfony.dockerfile
┣ 📂 env/
┣ ┃ ┣ 📜 mariadb.env
┣ 📂 nginx/
┣ ┃ ┣ 📜 nginx.conf
┣ 📂 php-fpm/
┣ ┃ ┣ 📜custom.ini
┣ 📜 docker-compose.yaml
```
# How to use
* Download docker from official site and install on your machine (for Windows better integration with WSL)
* The project directory name is app. If you want you can rename it, but you have to change it in docker-compose.yaml and in dockerfiles also.
* Configure nginx.conf file. By default nginx will use directory name, build in container. If you leave it in that way it will be app. From the browser you can open from ```http://app.develop```.\
**If you want to use you machine localhost you have to change server_name to be static, for example** ```server_name app.develop;```
* To change php version use IMAGE_VERSION in docker.compose file. Check the official docs of the [php-fpm image](https://hub.docker.com/r/bitnami/php-fpm/tags)
* Change database credentials form ```env/mariadb.env``` file.
* Download your repo in application directory.

## To create new project use symfony util container.
Run: ```command: docker-compose run --rm symfonycli new app --version="6.4.*" --webapp```. Change symfony version for your needs. Change git credentials in the docker-compose file with yours. It's required by symfony command.

## To execute php bin/console command in the project
* Run ```docker-compose run --rm commander command:name```

## To build images and container developing environment
* When you are ready with your configuration run: ```docker-compose up -d server php database```

## To execute composer command in the project
* Run ```docker compose run --rm composer command/name```

## PHP configuration:
* In ```php-fpm/custom.ini``` file can change php configuration. To apply changes just restart container: ```docker compose restart php```

### Xdebug:
* In ```php-fpm/custom.ini``` file is the xdebug configuration. If you want to use it in phpstorm IDE you have to add server in file -> settings -> php -> servers. For host use server_name from nginx conf file, port is 80. Map the files File/Directory should be ```/absolute/path/to/project/dir/``` on your machine - absolute path on server is ```/var/wwww/project-dir-name```.