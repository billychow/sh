#!/bin/bash

# to disable selinux
yum -y update

mkdir -p ~/download && cd ~/download
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm
yum -y groupinstall 'Development Tools'
yum -y install epel-release
yum -y install tmux screen subversion git bash-completion \
               php-cli php-devel php-fpm php-mbstring php-mysqlnd \
               php-apc php-memcache php-redis \
               mariadb-server ruby pygpgme curl

gem install bundler --no-rdoc --no-ri
curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
yum -y install nginx passenger

systemctl enable mariadb.service
systemctl start mariadb.service

systemctl enable php-fpm.service
systemctl start php-fpm.service

systemctl enable nginx
systemctl start nginx