#!/bin/bash

sudo useradd cuckoo
sudo usermod -a -G vboxusers cuckoo
sudo usermod -aG sudo cuckoo

sudo apt update
sudo apt upgrade

sudo apt install python python3-pip python-dev libffi-dev libssl-dev
sudo apt install python-setuptools
pip3 install virtualenv
sudo apt install libjpeg-dev zlib1g-dev swig
sudo apt install mongodb
sudo apt install postgresql libpq-dev
sudo apt install virtualbox
sudo apt install tcpdump apparmor-utils
sudo apt install m2crypto


sudo groupadd pcap
sudo usermod -a -G pcap cuckoo
sudo chgrp pcap /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
sudo aa-disable /usr/sbin/tcpdump
