# Installing for Ethereum Blockchain

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

### Create Prysm BEACON client

In your /home/ubuntu/ folder (~), create a folder structure as follows:

$(/home/ubuntu/)
```shell
mkdir ethereum
cd ethereum
mkdir consensus
mkdir execution
```

Then change directory into your consensus folder and install prysm:

$(/home/ubuntu/ethereum/consensus/)
```shell
mkdir prysm && cd prysm
curl https://raw.githubusercontent.com/prysmaticlabs/prysm/master/prysm.sh --output prysm.sh && chmod +x prysm.sh
```

Generate a JWT auth token. This is required for communication between the execution and consensus client.

```shell
./prysm.sh beacon-chain generate-auth-secret
```

Prysm will output your jwt.hex file path, such as:

/home/ubuntu/ethereum/consensus/prysm/jwt.hex

### Test Your Execution (GETH) Client

Make sure you navigate to your ethereum folder

```shell
cd /home/ubuntu/ethereum/execution/
```

Then start your Geth node:

/home/ubuntu/ethereum/execution/
```shell
geth --http --http.api eth,net,engine,admin --authrpc.jwtsecret -ENTER YOUR PATH FROM EARLIER TO YOUR JWT.hex file-
```

For example:

```shell
geth --http --http.api eth,net,engine,admin --authrpc.jwtsecret /home/ubuntu/ethereum/consensus/prysm/jwt.hex
```

...or for full example:

```shell
geth --http --http.api personal,eth,net,web3,debug,txpool,admin --authrpc.jwtsecret /home/ubuntu/ethereum/consensus/prysm/jwt.hex --ws --ws.port 8546 --ws.api eth,net,web3,txpool,debug --metrics --maxpeers 500
```

### Start Prysm Beacon Node

```shell
cd /home/ubuntu/ethereum/consensus/prysm/
```

/home/ubuntu/ethereum/consensus/prysm/
```shell
./prysm.sh beacon-chain --execution-endpoint=http://localhost:8551 --jwt-secret=<ENTER PATH TO YOUR JWT FILE HERE> --suggested-fee-recipient=<ENTER ETHEREUM YOUR ADDRESS HERE>

So for example:

./prysm.sh beacon-chain --execution-endpoint=http://localhost:8551 --jwt-secret=/home/ubuntu/ethereum/consensus/prysm/jwt.hex --suggested-fee-recipient=0x0d09aEC2D10F396fB59482644708CBd353798b87
```

### PRYSM Service Setup

Make sure geth is running before doing this next step.

Run Beacon node (takes a few days to sync)

```shell
sudo nano /lib/systemd/system/prysm.service
```

-----

[Unit]
Description=Prysm Beacon consensus client
After=network-online.target
Wants=network-online.target

[Service]
WorkingDirectory=/home/ubuntu
User=ubuntu
ExecStart=/home/ubuntu/ethereum/consensus/prysm/prysm.sh beacon-chain --checkpoint-sync-url=https://sync-mainnet.beaconcha.in --genesis-beacon-api-url=https://sync-mainnet.beaconcha.in --execution-endpoint=http://localhost:8551 --jwt-secret=/home/ubuntu/ethereum/consensus/prysm/jwt.hex --suggested-fee-recipient=0x0d09aEC2D10F396fB59482644708CBd353798b87
Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target

-----

Then run the following:

```shell
sudo systemctl daemon-reload
sudo systemctl enable prysm
sudo systemctl start prysm
sudo journalctl -f -u prysm
```

### GETH Service Setup

Run Beacon node (takes a few days to sync)

```shell
sudo nano /lib/systemd/system/geth.service
```

-----

[Unit]
Description=Geth execution client
After=network-online.target
Wants=network-online.target

[Service]
WorkingDirectory=/home/ubuntu/ethereum/execution
User=ubuntu
ExecStart=/usr/bin/geth --http --http.api personal,eth,net,web3,debug,txpool,admin --authrpc.jwtsecret /home/ubuntu/ethereum/consensus/prysm/jwt.hex --ws --ws.port 8546 --ws.api eth,net,web3,t>
Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target

-----

Then run the following:

```shell
sudo systemctl daemon-reload
sudo systemctl enable geth
sudo systemctl start geth
sudo journalctl -f -u geth
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


# Installing for Binance Smart Chain
https://docs.bnbchain.org/docs/validator/fullnode/

### Preparations

```shell
sudo apt install unzip
sudo apt update
mkdir bsc
cd bsc
```

### Download Chaindata Snapshot

Go to the following url: https://github.com/bnb-chain/bsc-snapshots

Right click on the Endpoint and get the Url address. The endpoint may look something like this: geth-20230416.tar.lz4

Then past the address below on the wget.

***This may take up to half a day, so using nohup + cli command + &***

(~/bsc)
```shell
nohup wget -O geth.tar.lz4 https://pub-c0627345c16f47ab858c9469133073a8.r2.dev/geth-20230416.tar.lz4 &
```

You can check the size downloaded by using:

```shell
lsof nohup.out
```

Remember you can also kill the process by using kill 'Insert PID'

***Decompression takes around 2 hours so we run this in the background***

```shell
nohup tar -I lz4 -xvf geth.tar.lz4 &
```
