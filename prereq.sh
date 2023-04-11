#!/bin/bash
cd /
echo "Starting Server Setup preparation for ETH node Setup"
cd /
cd home
rm -rf ethfullnode
mkdir ethfullnode
clear
echo "Updating server packages"
sudo apt-get update
sudo apt update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install software-properties-common
clear
echo "Installing useful command line packages"
sudo apt-get -y update
sudo apt-get install net-tools
sudo apt-get -y update
sudo apt-get install iftop
clear
echo "Installing additional software"
sudo apt -y install snapd
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get -y update
sudo apt-get -y install ethereum
sudo apt-get -y upgrade geth
sudo snap install go --classic
sudo apt -y install wget
sudo apt -y install git
sudo apt -y install make
sudo apt -y install unzip
sudo apt -y install nodejs
sudo apt -y install npm
sudo apt -y install ufw
clear
cd /
cd usr/bin
rm -rf go
wget https://go.dev/dl/go1.17.5.linux-amd64.tar.gz
tar -xzf go1.17.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/bin/go/bin
clear
cd /
cd home
rm -rf ethfullnode
mkdir ethfullnode
cd ethfullnode
git clone https://github.com/ethereum/go-ethereum
mv go-ethereum eth
cd eth
make geth
ls -al build/bin/geth
clear
echo "Opening ports"
sudo ufw allow 80
sudo ufw allow 8000
sudo ufw allow 8001
sudo ufw allow 443
sudo ufw allow 22
sudo ufw allow 6060
sudo ufw allow 8545
sudo ufw allow 8546
sudo ufw allow 8547
sudo ufw allow 8548
sudo ufw --force enable
echo "Installing reverse proxy for RPC"
clear
sudo apt -y install haproxy
cd /
# cd /etc/haproxy/haproxy.cfg
# rm -rf haproxy.cfg
# wget https://multi-sniper.com/scripts/files/haproxy.cfg
sudo cp /home/ubuntu/noderepo/haproxy.cfg /etc/haproxy/haproxy.cfg
systemctl enable haproxy
systemctl start haproxy
