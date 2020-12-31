apt-get update ; apt-get install -y wget
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update -y
apt-get install apt-transport-https -y
apt-get update -y
apt-get -y install dotnet-sdk-2.2 git cmake build-essential libssl-dev pkg-config libboost-all-dev libsodium-dev autoconf automake pkg-config
#libzmq5
git clone https://github.com/coinfoundry/miningcore
cd miningcore/src/Miningcore
dotnet publish -c Release --framework netcoreapp2.2  -o ../../build
wget https://github.com/zeromq/libzmq/archive/v4.2.3.tar.gz
tar zxvf v4.2.3.tar.gz
cd libzmq-4.2.3/
./autogen.sh
./configure --prefix=/usr
make
make install
