#!/bin/bash

# Install Build Tools
cd $HOME

sudo /bin/date +%H:%M:%S > install.progress.txt

echo "ooooo      FULL INSTALL      ooooo" >> install.progress.txt

# Install Java
echo "Installing openjdk-8-jdk package" >> install.progress.txt

sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get -y update
sudo apt-get install -y openjdk-8-jdk
sudo apt-get -y update --fix-missing
sudo apt-get install -y openjdk-8-jdk

sudo ln -s /usr/lib/jvm/java-8-openjdk-amd64/ /usr/lib/jvm/default-java

sudo /bin/date +%H:%M:%S >> install.progress.txt


# Install Java build tools
echo "Installing ant package" >> install.progress.txt
sudo apt-get -y install ant
sudo /bin/date +%H:%M:%S >> install.progress.txt

echo "Installing maven package" >> install.progress.txt
sudo apt-get -y install maven
sudo /bin/date +%H:%M:%S >> install.progress.txt

echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> .bashrc
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Install Apache NiFi
echo "Installing NiFi 1.1.2" >> install.progress.txt
sudo mkdir /usr/bin/nifi
cd /usr/bin/nifi
sudo wget ftp://apache.mirrors.tds.net/pub/apache.org/nifi/1.1.2/nifi-1.1.2-bin.tar.gz
sudo tar -xzf nifi-1.1.2-bin.tar.gz
sudo /usr/bin/nifi/nifi-1.1.2/bin/nifi.sh install dataflow
sudo /usr/bin/nifi/nifi-1.1.2/bin/nifi.sh start 

cd $HOME

sudo /bin/date +%H:%M:%S >> install.progress.txt

echo "nifi installation done"
