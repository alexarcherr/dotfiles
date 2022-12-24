#!/bin/sh

# tested on Ubuntu 20.04 (Focal Fossa)

apt-get install -y \
    software-properties-common \
    mc locate \
    python3-dev python3-pip \
    nginx \
    php-fpm memcached php-mysql php-memcached php-mbstring \
    mysql-server sqlite3 \
    zsh tmux wget curl git net-tools

apt-get update && upt-get upgrade

apt autoclean
apt autoremove

echo 'All done!'
