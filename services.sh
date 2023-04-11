#!/bin/bash
cd /
cd /etc/systemd/system
systemctl stop bsc-node.service
systemctl disable bsc-node.service
systemctl stop eth-node.service
systemctl disable eth-node.service
rm -rf bsc-node.service
rm -rf eth-node.service
wget http://multi-sniper.com/scripts/files/bsc-node.service
wget http://multi-sniper.com/scripts/files/eth-node.service