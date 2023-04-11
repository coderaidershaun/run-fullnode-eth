echo "Starting ETH Full Node Service: $(date)"
geth \
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
--http.api eth,net,web3,txpool \
--ws \
--ws.addr 0.0.0.0 \
--ws.origins '*' \
--ws.api eth,net,web3,txpool \
--snapshot=false \
--ulc.onlyannounce
