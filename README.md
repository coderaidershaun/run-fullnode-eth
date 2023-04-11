## Instructions

1: Clone repo

```shell
git clone https://github.com/coderaidershaun/run-fullnode-eth.git noderepo
```

2: Run Pre-requisites

```shell
cd noderepo
./prereq.sh
```

3: Start GETH

```shell
sudo cat /etc/systemd/system/geth.service # If reading
sudo nano /etc/systemd/system/geth.service # If editing
```

```shell
sudo systemctl start geth
rm -rf eth.sh
```

4: Useful service commands

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
