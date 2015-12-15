#!/bin/bash

# to disable selinux
yum -y update

mkdir -p ~/download && cd ~/download
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm
yum -y groupinstall 'Development Tools'
yum -y install epel-release
yum -y install tmux screen subversion git \
               php-cli php-devel php-fpm php-mbstring php-mysqlnd \
               php-apc php-memcache php-redis \
               mariadb-server nginx

systemctl enable mariadb-server
systemctl start mariadb-server

systemctl enable nginx
systemctl start nginx