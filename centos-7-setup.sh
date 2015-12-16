#!/bin/bash

# to disable selinux
yum -y update

mkdir -p ~/download && cd ~/download
wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
rpm -Uvh remi-release-7.rpm
yum -y groupinstall 'Development Tools'
yum -y install epel-release
yum -y install tmux screen subversion git bash-completion fail2ban iptables-services \
               php-cli php-devel php-fpm php-mbstring php-mysqlnd \
               php-apc php-memcache php-redis php-gd php-mcrypt \
               mariadb-server ruby pygpgme curl

gem install bundler --no-rdoc --no-ri
curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
yum -y install nginx passenger

systemctl stop firewalld.service
systemctl disable firewalld.service

systemctl enable iptables.service
systemctl start iptables.service

systemctl enable fail2ban.service
systemctl start fail2ban.service

systemctl enable mariadb.service
systemctl start mariadb.service

systemctl enable php-fpm.service
systemctl start php-fpm.service

systemctl enable nginx
systemctl start nginx