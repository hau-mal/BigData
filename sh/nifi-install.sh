#!/bin/bash

# Install Java
sudo apt-get -y update
sudo apt-get install -y $1
sudo apt-get -y update --fix-missing
sudo apt-get install -y $1

# Install Apache NiFi

sudo mkdir /usr/bin/nifi
cd /usr/bin/nifi
sudo wget ftp://apache.mirrors.tds.net/pub/apache.org/nifi/1.1.2/nifi-1.1.2-bin.tar.gz
sudo tar -xzf nifi-1.1.2-bin.tar.gz
sudo /usr/bin/nifi/nifi-1.1.2/bin/nifi.sh install dataflow
sudo /usr/bin/nifi/nifi-1.1.2/bin/nifi.sh start 

echo "nifi installation done"
