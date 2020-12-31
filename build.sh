#!/bin/bash
#Get depends
apt-get update ; apt-get install -y wget dotnet-sdk-2.2 git cmake build-essential libssl-dev pkg-config libboost-all-dev libsodium-dev autoconf automake pkg-config apt-transport-https
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update -y

#Install miningcore
git clone https://github.com/coinfoundry/miningcore
cd miningcore/src/Miningcore
dotnet publish -c Release --framework netcoreapp2.2  -o ../../build

#Install ZMQ
#The default package for libzmq5 is not working by default, replaced with build of latest ZMQ.
wget https://github.com/zeromq/libzmq/archive/v4.3.3.tar.gz
tar zxvf v4.3.3.tar.gz
cd libzmq-4.3.3/
./autogen.sh
./configure --prefix=/usr
make
make install
