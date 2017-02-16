#!/bin/bash

sudo apt-get install -y salt-minion

echo "Enter DNS/IP of Salt-Master:"
read saltmaster_ip

sudo sed -i "16s/.*/master: $saltmaster_ip/" /etc/salt/minion
grep master /etc/salt/minion


