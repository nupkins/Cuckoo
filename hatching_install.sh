!#/bin/bash

sudo apt-get update
sudo apt-get -y install python virtualenv python-pip python-dev build-essential

sudo adduser --disabled-password --gecos "" cuckoo

sudo groupadd pcap
sudo usermod -a -G pcap cuckoo
sudo chgrp pcap /usr/sbin/tcpdump
sudo setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump


mkdir /mnt/win7
sudo mount -o ro,loop win7ultimate.iso /mnt/win7

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"

sudo apt-get update
sudo apt-get install virtualbox-6.0
sudo usermod -a -G vboxusers cuckoo

sudo apt-get -y install build-essential libssl-dev libffi-dev python-dev genisoimage
sudo apt-get -y install zlib1g-dev libjpeg-dev
sudo apt-get -y install python-pip python-virtualenv python-setuptools swig

sudo su cuckoo
virtualenv ~/cuckoo
. ~/cuckoo/bin/activate

pip install -U cuckoo vmcloak

vmcloak-vboxnet0

vmcloak init --verbose --win7x64 win7x64base --cpus 2 --ramsize 2048
