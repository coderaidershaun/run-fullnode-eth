echo "Starting ETH Full Node Service: $(date)"
/home/ethfullnode/eth/build/bin/geth \
--ipcpath ~/.ethereum/geth.ipc \
--metrics \
--http \
--http.addr 0.0.0.0 \
--maxpeers 500 \
--cache 18000 \
--authrpc.addr localhost \
--authrpc.port 8551 \
--authrpc.vhosts localhost \
--authrpc.jwtsecret /home/ethfullnode/eth/jwtsecret \
--http.corsdomain '*' \
--http.api eth,net,web3,txpool,debug \
--ws \
--ws.addr 0.0.0.0 \
--ws.origins '*' \
--ws.api eth,net,web3,txpool,debug \
--snapshot=false \
--ulc.onlyannounce


ExecStart=/usr/bin/geth \
  --authrpc.addr localhost \
  --authrpc.port 8551 \
  --authrpc.vhosts localhost \
  --authrpc.jwtsecret /tmp/jwtsecret \
  --syncmode full \
  --http \
  --http.api personal,eth,net,web3,txpool \
  --http.addr 0.0.0.0 \
  --http.corsdomain * \
  --ws \
  --ws.addr 0.0.0.0 \
  --ws.origins '*' \
  --ws.api eth,net,web3,txpool,debug \
  --snapshot=false \
  --ulc.onlyannounce \
  --metrics \
  --ipcpath ~/.ethereum/geth.ipc \
  --maxpeers 500 \
  --cache 18000 \