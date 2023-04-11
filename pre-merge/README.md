## Starting

1: Clone repo

```shell
git clone https://github.com/coderaidershaun/run-fullnode-eth.git noderepo
```

2: Run Pre-requisites

```shell
cd noderepo
chmod +x prereq.sh
sudo ./prereq.sh
```

3: Copy eth node services to correct location

```shell
sudo cp /home/noderepo/startNodeETH.sh /home/startNodeETH.sh
chmod +x /home/startNodeETH.sh
```

## Create Lighthouse Beacon Service

```shell
cd /home
sudo wget https://github.com/sigp/lighthouse/releases/download/v3.3.0/lighthouse-v3.3.0-x86_64-unknown-linux-gnu.tar.gz
sudo tar zxvf lighthouse-v3.3.0-x86_64-unknown-linux-gnu.tar.gz
sudo mv lighthouse /usr/local/bin/
sudo nano /etc/systemd/system/lighthouse.service
```

Paste in Lighthouse Service data

```shell
sudo systemctl enable lighthouse
sudo systemctl start lighthouse
sudo systemctl lighthouse lighthouse
```

## Create ETH NODE Service

```shell
sudo nano /etc/systemd/system/eth-node.service
```

Paste in eth-node.services to above

STOP:

```shell
sudo systemctl stop eth-node
sudo systemctl disable eth-node
```

START:

```shell
sudo systemctl daemon-reload
sudo systemctl start eth-node
sudo systemctl status eth-node
sudo journalctl -fu eth-node.service
# sudo systemctl enable eth-node
```

### Useful Service Commands

```shell
sudo cat /etc/systemd/system/geth.service
sudo systemctl daemon-reload
sudo journalctl -fu geth.service
sudo systemctl status geth
sudo systemctl start geth
```

### Useful CLI Commands

Geth

```shell
geth attach
  eth.syncing
sudo netstat -tulpn # Shows networking ports being used
sudo iftop # Shows bandwidth and network usage
```

Ubuntu

```shell
df -h # Checks data utilized
top # Shows active processes
sudo netstat -tulpn # Shows networking ports being used
sudo iftop # Shows bandwidth and network usage
```
