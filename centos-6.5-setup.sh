#!/bin/sh

# to disable selinux
yum -y update
yum -y groupinstall 'Development Tools'
yum -y install epel-release
# Add phusion passenger el6 YUM repository
curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo && rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y install tmux screen subversion git bind-utils \
               php-cli php-devel php-fpm php-mbstring php-mysqlnd \
               php-apc php-memcache php-redis php-gd php-mcrypt php-soap \
               mysql-server mysql-devel nginx passenger jenkins \
               ruby ruby-devel rubygems pygpgme curl \
               ImageMagick-devel java-1.8.0-openjdk postfix mailx alpine

gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
gem install bundler

chkconfig mysqld on
chkconfig nginx on
chkconfig php-fpm on
service mysqld start
service nginx start
service php-fpm start
# setup mysql
mysql_secure_installation
