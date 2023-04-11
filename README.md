## Instructions

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

4: Create services

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

Useful service commands

```shell
sudo cat /etc/systemd/system/geth.service
sudo systemctl daemon-reload
sudo journalctl -fu geth.service
sudo systemctl status geth
sudo systemctl start geth
```

## Useful Commands

```shell
df -h # Checks data utilized
top # Shows active processes
sudo netstat -tulpn # Shows networking ports being used
sudo iftop # Shows bandwidth and network usage
```
