// https://pawelurbanek.com/ethereum-node-aws

### Updating server packages

```shell
sudo apt-get update
sudo apt update
sudo apt-get -y upgrade
sudo apt-get -y install build-essential
sudo apt-get -y install software-properties-common
```

### Installing useful command line packages

```shell
sudo apt-get -y update
sudo apt-get install net-tools
sudo apt-get -y update
sudo apt-get install iftop
```

### Installing software

```shell
sudo apt -y install snapd
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get -y update
sudo apt-get -y install ethereum
sudo apt-get -y upgrade geth
sudo snap install go --classic
```

### Create Geth Service

```shell
sudo nano /lib/systemd/system/geth.service
```

Paste in contents from geth.service

```shell
sudo systemctl daemon-reload
sudo systemctl enable geth
sudo systemctl start geth
sudo systemctl status geth
sudo journalctl -f -u geth
```

### Create Lighthouse Service

```shell
wget https://github.com/sigp/lighthouse/releases/download/v3.3.0/lighthouse-v3.3.0-x86_64-unknown-linux-gnu.tar.gz
tar zxvf lighthouse-v3.3.0-x86_64-unknown-linux-gnu.tar.gz
sudo mv lighthouse /usr/local/bin/
```

```shell
sudo nano /lib/systemd/system/lighthouse.service
```

Paste in contents from lighthouse.service

```shell
sudo systemctl daemon-reload
sudo systemctl enable lighthouse
sudo systemctl start lighthouse
sudo systemctl status lighthouse
sudo journalctl -f -u lighthouse
```

### Check status commands

View Geth live

```shell
sudo journalctl -f -u geth
```

Attach Geth

```shell
geth attach
```

Monitor progress

```shell
eth.syncing; # Should take about 30 mins to switch from false to showing an object
eth.blockNumber;
eth.pendingTransactions;
eth.hashrate;
txpool.status;
admin.nodeInfo;
admin.peers;
admin.nodeInfo.protocols;
```
