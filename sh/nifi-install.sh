#!/bin/bash

# Install Build Tools
sudo /bin/date +%H:%M:%S > /home/$5/install.progress.txt

echo "ooooo      FULL INSTALL      ooooo" >> /home/$5/install.progress.txt

# Install Java
echo "Installing openjdk-8-jdk package" >> /home/$5/install.progress.txt

sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get -y update
sudo apt-get install -y openjdk-8-jdk
sudo apt-get -y update --fix-missing
sudo apt-get install -y openjdk-8-jdk

sudo ln -s /usr/lib/jvm/java-8-openjdk-amd64/ /usr/lib/jvm/default-java

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt


# Install Java build tools
echo "Installing ant package" >> /home/$5/install.progress.txt
sudo apt-get -y install ant
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt

echo "Installing maven package" >> /home/$5/install.progress.txt
sudo apt-get -y install maven
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt

echo "Installing gradle package" >> /home/$5/install.progress.txt
sudo apt-get -y install gradle
sudo -u $5 /usr/bin/gradle
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt

echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /home/$5/.bashrc
sudo export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Install Apache NiFi
echo "Installing NiFi 1.1.2" >> /home/$5/install.progress.txt
sudo mkdir /usr/bin/nifi
cd /usr/bin/nifi
sudo wget ftp://apache.mirrors.tds.net/pub/apache.org/nifi/1.1.2/nifi-1.1.2-bin.tar.gz
sudo tar -xzf nifi-1.1.2-bin.tar.gz
sudo /usr/bin/nifi/nifi-1.1.2/bin/nifi.sh install dataflow
sudo /usr/bin/nifi/nifi-1.1.2/bin/nifi.sh start 

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt

echo "nifi installation done"
