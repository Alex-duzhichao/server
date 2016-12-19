#!/bin/bash
yum -y install epel-release
yum install -y sudo
yum install -y zsh
yum install -y lrzsz
yum install -y strace
yum install -y htop
#install dev tools
yum groupinstall -y "Development Tools"

yum install -y redis

find ~/server -name "*.sh" | xargs chmod +x 
