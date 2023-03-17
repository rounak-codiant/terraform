#!/bin/bash
sudo export DEBIAN_FRONTEND="noninteractive"

# Default Parameters
composer_install=no
nginx_config=no
node_nginx_config=no
php_modules=no
php_nginx_config=no

usage(){
    echo "Usage: $0 --php-version <value> --node-version <value> --composer-install <yes/no> \
--php-nginx-config <yes/no> --php-modules <yes/no> --node-nginx-config <yes/no>"
    echo "OR"
    echo "Usage: $0 -p <value> -n <value> -c <yes/no> -pngx <yes/no> -pmodule <yes/no> -nngx <yes/no>"
}

help(){
    echo "---------------------------------------------------------------------------------------------------"
    echo "       Options                        Usage"
    echo "  [-p|--php-version]             Set PHP Version (ex:7.4)"
    echo "  [-n|--node-version]            Set Nodejs Version (ex:16)"
    echo "  [-c|--composer-install]        Set Composer Installation (yes/no)"
    echo "  [-pngx|--php-nginx-config]     Set PHP Nginx Configuration File (yes/no)"
    echo "  [-pmodule|--php-modules]       Set PHP Modules Installation (yes/no)"
    echo "  [-nngx|--node-nginx-config]    Set Node Nginx Configuration File (yes/no)"
    echo "  [-h|--help]                    Print this help message and exit"
    echo "---------------------------------------------------------------------------------------------------"
    usage
    echo "---------------------------------------------------------------------------------------------------"
}

if [ "$#" -gt 0 ]
then
while [ "$#" -gt 0 ]; do
    case $1 in
        -p|--php-version) varname="$2"; shift ;;
        -n|--node-version) node_version="$2"; shift ;;
        -c|--composer-install) composer_install="$2"; shift ;;
        -pngx|--php-nginx-config) php_nginx_config="$2"; shift ;;
        -pmodule|--php-modules) php_modules="$2"; shift ;;
        -nngx|--node-nginx-config) node_nginx_config="$2"; shift ;;
        -h|--help) help
            exit 1;;
        *) usage
           exit 1 ;;
    esac
    shift
done

echo "
---------------------------------------------------------------
                    Installation Details
---------------------------------------------------------------
    PHP Version                 -       $varname
    PHP Modules Installation    -       $php_modules
    Composer Installation       -       $composer_install
    Nodejs Version              -       $node_version
    PHP Nginx Configuration     -       $php_nginx_config
    Node Nginx Configuration    -       $node_nginx_config
---------------------------------------------------------------"
echo Thanks!! This program will install above configuration.
sleep 5
sudo apt-get update -y && sudo apt-get install curl -y
sudo apt install software-properties-common -y

## Adding PHP Repo
echo ------------------ Adding PHP Repo --------------------------
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y
sudo apt remove purge apache2 -y

## Nginx Installation
echo ------------------ Nginx Installing --------------------------
sudo apt-get install nginx -y
sudo systemctl enable nginx

##Installing PHP
echo "------------- PHP Installing -------------"
sudo apt-get install php$varname -y

### PHP module Installation
if [ $php_modules = "yes" ]; then
    echo "------------- PHP Modules Installing -------------"
    sudo apt-get install --ignore-missing php$varname-fpm php$varname-mysql php$varname-curl php$varname-bcmath php$varname-gd php$varname-intl php-pear php$varname-imap php$varname-mcrypt php$varname-memcache php$varname-ps php$varname-pspell php$varname-redis php$varname-snmp php$varname-sqlite php$varname-tidy php$varname-xmlrpc php$varname-xsl php$varname-intl php$varname-zip php$varname-imagick php$varname-mbstring unzip zip -y; printf "$(php -m)  %s\nPHP modules installation is completed. %s\n";
    sudo service php$varname-fpm restart
    echo "PHP$varname-FPM service started"
else
    echo "PHP modules installation is skipped."
fi

# Composer Installation
if [ $composer_install = "yes" ] ; then
    echo "------------- Composer Installing -------------"
    sudo curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer; echo "Composer installation is completed";
else
    echo "Composer Installation Skipped.";
fi

# NodeJs Installation
echo "------------- NodeJS Installing -------------"
cd /tmp; curl -sL https://deb.nodesource.com/setup_$node_version.x | bash -
sudo apt-get install nodejs -y; echo "Installed\nNodeJs Version: $(node -v)\nNPM Version: $(npm -v)";

if [ $node_nginx_config = "yes" ] &&  [ $php_nginx_config = "yes" ]; then
sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default_bak
sudo sh -c 'cat << EOF > /etc/nginx/sites-available/default
server {
   listen 80 default_server;
   listen [::]:80 default_server;
   server_name _;
   root /var/www/html;
   index index.html index.htm index.nginx-debian.html;

   location / {
      try_files $uri $uri/ =404;
     }
}
EOF
'
else
# PHP Ngnix Configuration
if [ $php_nginx_config = "yes" ]; then
sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default_bak
sudo sh -c 'cat << EOF > /etc/nginx/sites-available/default
server {
    listen 80;
    server_name _;
    root /var/www/html/public;
    client_max_body_size 200M;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";

    index index.nginx-debian.html index.php index.html;
    error_page 404 /index.php;
    charset utf-8;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }
    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }


    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php$varname-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$realpath_root\$fastcgi_script_name;
        include fastcgi_params;
        include snippets/fastcgi-php.conf;
    }
    location ~ /\.ht {
    deny all;
    }

    location ~ /\.env {
    deny all;
    }
}
EOF
'
fi
# Node Ngnix Configuration
if [ $node_nginx_config = "yes" ]; then
sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default_bak
sudo sh -c 'cat << EOF > /etc/nginx/sites-available/default
server {
   listen 80;
   listen [::]:80;
   server_name _;
   client_max_body_size 200M;

   access_log /var/log/nginx/access.log;
   error_log /var/log/nginx/error.log;

   location / {
      proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
      proxy_set_header X-Real-IP \$remote_addr;
      proxy_set_header Host \$http_host;
      proxy_set_header X-Forwarded-Proto \$scheme;
      proxy_pass http://localhost:3000/;
      proxy_http_version 1.1;
      proxy_set_header Upgrade \$http_upgrade;
      proxy_set_header Connection "upgrade";
  }
}
EOF
'
fi
fi
fi
sudo systemctl disable apache2
sudo apt remove apache2 -y
sudo service nginx restart
sudo apt autoremove -y
sudo chown -R ubuntu:www-data /var/www/html/
exit 0