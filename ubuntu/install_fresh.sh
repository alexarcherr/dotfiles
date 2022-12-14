#!/bin/sh

# tested on Ubuntu 20.04 (Focal Fossa)

apt-get install -y \
    software-properties-common \
    mc locate \
    python3-dev python3-pip \
    nginx \
    php-fpm \
    mysql-server sqlite3 \
    zsh tmux wget curl git

apt-get update && upt-get upgrade

apt autoclean
apt autoremove

echo 'All done!'
