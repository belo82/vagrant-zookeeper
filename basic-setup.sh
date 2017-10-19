#!/bin/sh


sed -i '$ a LC_ALL="en_US.UTF-8"' /etc/default/locale

apt-get update
apt-get install -y screen tmux htop mc pdsh

# Java
apt-get install -y python-software-properties debconf-utils
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
apt-get install -y oracle-java8-installer
echo 'JAVA_HOME="/usr/lib/jvm/java-8-oracle"' | sudo tee -a /etc/environment


### Create groups and users
groupadd -g 10000 hadoop

usermod -a -G hadoop ubuntu

useradd -G hadoop zookeeper
mkhomedir_helper zookeeper


### Install Core Hadoop
cd /usr/local
wget http://archive.apache.org/dist/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz
tar xzvf zookeeper-3.4.10.tar.gz

cat /vagrant/custom_profile >> /home/ubuntu/.profile


#### Configure zookeeper data dir
mkdir -p /data/zookeeper
chown -R zookeeper:hadoop /data/zookeeper
cp /vagrant/etc/zookeeper/zoo.cfg /usr/local/zookeeper-3.4.10/conf/zoo.cfg

sudo -u zookeeper /usr/local/zookeeper-3.4.10/bin/zkServer.sh start