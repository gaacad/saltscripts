#!/bin/bash

curl -o bootstrap-salt.sh -L https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh git develop

echo ' '
echo "*****************************"
echo "Enter DNS/IP of Salt-Master:"
read saltmaster_ip

sudo sed -i "16s/.*/master: $saltmaster_ip/" /etc/salt/minion
grep ^master: /etc/salt/minion

sudo service salt-minion restart
