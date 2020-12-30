apt-get update ; apt-get install -y wget
wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update -y
apt-get install apt-transport-https -y
apt-get update -y
apt-get -y install dotnet-sdk-2.2 git cmake build-essential libssl-dev pkg-config libboost-all-dev libsodium-dev libzmq5
git clone https://github.com/coinfoundry/miningcore
cd miningcore/src/Miningcore
dotnet publish -c Release --framework netcoreapp2.2  -o ../../build
