# Container for Laravel app

Docker image for laravel projects.

```sh
git clone https://github.com/braian125/laravel_app.git
cd laravel_app
mkdir -p docker/nginx/conf.d 
mkdir docker/php-fpm 
mkdir code
touch docker/nginx/conf.d/site.conf
touch docker/php-fpm/log.conf
```

# site.conf
```
server {
    listen 80;
    server_name php-docker.local;
    root /var/www/laratest/public;
    index index.php index.html;
    error_log  /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
    location ~ \.php$ {
    try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass php:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
}
```

# log.conf
```
php_admin_flag[log_errors] = on
php_flag[display_errors] = off
```

docker-compose up
winpty docker exec -it laravelapp_php_1 composer create-project --prefer-dist laravel/laravel blog

    - winpty: windows users using git-bash
    
    - laravelapp_php_1: container name or container id
