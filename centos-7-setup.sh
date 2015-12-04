#!/bin/bash

# to disable selinux
yum -y update
yum -y groupinstall 'Development Tools'
yum -y install epel-release
yum -y install tmux screen subversion git \
               mariadb-server nginx

systemctl enable mariadb-server
systemctl start mariadb-server

systemctl enable nginx
systemctl start nginx