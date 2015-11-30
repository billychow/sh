#!/bin/bash

yum -y update
yum -y groupinstall 'Development Tools'
yum -y install tmux screen subversion git
