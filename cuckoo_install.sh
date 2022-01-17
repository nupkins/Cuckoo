#!/bin/bash

sudo useradd cuckoo
sudo usermod -a -G vboxusers cuckoo
sudo usermod -aG sudo cuckoo

sudo apt update
sudo apt upgrade

sudo apt install python python3-pip python-dev libffi-dev libssl-dev -y
sudo apt install python-setuptools -y
pip3 install virtualenv
sudo apt install libjpeg-dev zlib1g-dev swig -y
sudo apt install mongodb -y
sudo apt install postgresql libpq-dev -y
sudo apt install virtualbox -y
sudo apt install tcpdump apparmor-utils -y
sudo apt install m2crypto -y


sudo groupadd pcap
sudo usermod -a -G pcap cuckoo
sudo chgrp pcap /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
sudo aa-disable /usr/sbin/tcpdump

virtualenv -p /usr/bin/python2.7 cuckoo-env
source cuckoo-env/bin/activate

pip install setutools
pip install -U cuckoo
cuckoo init
