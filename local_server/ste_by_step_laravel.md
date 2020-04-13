## Пошаговая инструкция по установке LEMP стека на Ubuntu 18.04 для проектов на Laravel

Перед началом установки обновим Ubuntu

    sudo apt update && apt upgrade
    
Нам могут понадобиться дополнительные утилиты:
    
    sudo apt install nano curl zip unzip git
    
### MySQL

    sudo apt install mysql-server
    
Выполните скрипт безопасности командой:
    
    sudo mysql_secure_installation
 
Создадим базу данных:

    mysql
    create database example collate utf8mb4_unicode_ci;

Добавим пользователя для этой базы:
    
    CREATE USER 'example'@'localhost' IDENTIFIED BY 'password';
    GRANT ALL PRIVILEGES ON example . * TO 'example'@'localhost';
    FLUSH PRIVILEGES;

Если нужно импортировать базу данных:
   
    use example;
    sorce /backup/example.sql
    
### PHP 7.2

    sudo apt install -y php7.2 php7.2-fpm php7.2-mysql php7.2-zip php7.2-gd php7.2-mbstring php7.2-xml php7.2-curl

Если нужен SOAP:

    sudo apt install php7.2-soap

Отредактируем конфигурацию php:

    sudo nano /etc/php/7.2/fpm/php.ini

Раскомментируем параметр `cgi.fix_pathinfo` и изменим значение:
    
    cgi.fix_pathinfo=0
    
Для применения настроек перезагрузим php7.2-fpm

    sudo service php7.2-fpm restart

### Composer

Установим пакетный менеджер composer:

    cd ~
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    
Проверяем команду `composer` в терминале.    

### Nginx

    sudo apt install nginx
   
Создадим каталог для проекта:

    sudo mkdir -p /var/www/example.com
   
Настроим хост.
Перед этим на всякий случай сохраним стандартные настройки ngnix:

    sudo mkdir ~/Backups
    sudo cp /etc/nginx/sites-available/default ~/Backups/default

Далее можно отредакитровать этот файл:

    server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /var/www/example.com/public;
        index index.php index.html index.htm;

        server_name example.com;

        location / {
                try_files $uri $uri/ /index.php?$query_string;
        }
        location ~ \.php$ {
                try_files $uri =404;
                fastcgi_split_path_info ^(.+\.php)(/.+)$;
                fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
                fastcgi_index index.php;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                include fastcgi_params;
        }
    }

или создать свой в каталоге `/etc/nginx/sites-available\example.com.conf` и создать символичсекую ссылку в `sites-enabled`:

    ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/

Для проверки новыйх настроек запустим:

    nginx -t

Если не появилось сообщений об ошибке - перезагрузим nginx:

    sudo service nginx restart
    
### Laravel

Переходим в каталог подготовленный для проекта `cd /var/www/example.com`. Клонируем проект из git репозитория:
    
    git clone {your_path} .
    
Устанавливаем пакеты composer:

    composer install
    
Копируем env.example и генерируем ключ приложения:

    cp .env.example .env
    php artisan key:generate
    
Если нужно перенести проект с другого сервера - можно скопировать каталог по ssh используя утилиту scp:

    scp -r user@host:/var/www/example.com /var/www
    
Назначаем права:

    chown -R www-data:root /var/www/example.com
    chmod 755 /var/www/example.com/storage

### Максимальный размер загружаемого файла

По умолчанию в конфигурации php максимальный размер загружаемого файла ограничен 2Mb. 
Отредактируйте следущие параметры в файле `/etc/php/7.2/fpm/php.ini` до нужного значения:

    upload_max_filesize = 100M
    post_max_size = 100M

Так же нужно изменить конфигурацию nginx для увеличения максимального размера файла. 
Можно изменить в основном конфиге `/etc/nginx/nginx.conf` или в кофиге хоста в блоке `server {...}`:

    client_max_body_size 100m;

Для применения настроек перезагрузим php7.2-fpm и nginx:

    sudo service php7.2-fpm restart
    sudo service nginx restart
   
### Elasticsearch 5

Импортируем Elasticsearch PGP Key:

    apt-get install gnupg
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

Добавляем репозиторий:

    sudo apt -y install apt-transport-https
    echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-5.x.list

Устанавливаем:
  
    sudo apt update
    sudo apt -y install elasticsearch
    
Если нужно изменить настройки elasticsearch:

    sudo nano /etc/elasticsearch/elasticsearch.yml

По умолчанию JVM использует 2Gb памяти. Если у вас слабенький сервер - можно изменить это значение:

    sudo nano /etc/elasticsearch/jvm.options
    
Измените: 
     
    -Xms2g
    -Xmx2g
    
На: 

    -Xms512m
    -Xmx512m
    
После изменения - запускаем Elasticsearch:

    sudo systemctl enable elasticsearch.service && sudo systemctl restart elasticsearch.service
    
Проверяем статус:

    systemctl status elasticsearch.service 