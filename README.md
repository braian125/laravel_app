# laravel_app
Docker image for laravel projects


mkdir -p docker/nginx/conf.d 
mkdir docker/php-fpm
mkdir code

vi docker/nginx/conf.d/site.conf

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
