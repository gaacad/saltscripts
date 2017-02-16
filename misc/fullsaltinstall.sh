#!/bin/bash

#Turn on Sudo
sudo -s

wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" >> /etc/apt/source.list.d/saltstack.ist

apt-get update

apt-get install salt-master
apt-get install salt-minion
apt-get install salt-ssh
apt-get install salt-syndic
apt-get install salt-cloud
apt-get install salt-api

#Add DNS Entry for Salt
grep 'salt' /etc/hosts 
if [ $? -eq 1 ]; then #not found
  read -e -p "IP Address of Salt Master:" saltmaster_ip 
  echo " " >> /etc/hosts
  echo "$saltmaster_ip  salt" >>  /etc/hosts
fi



