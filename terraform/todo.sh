#!/bin/bash
sudo apt update 
sudo apt upgraade -y
sudo apt install apache2 -y
sudo apt install software-properties-common -y
sudo ass-apt-repository ppa:ondrej/php -y
sudo apt install php7.4 php7.4cli php7.4-fpm php7.4-mysql php7.4-zip php7.4-gd -y
sudo apt install composer
sudoinstall python3-certbot-apache -y