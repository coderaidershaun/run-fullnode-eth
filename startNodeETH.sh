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
