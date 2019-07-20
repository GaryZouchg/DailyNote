#ehereum cpp 
git clone --recursive https://github.com/ethereum/aleth.git
cd aleth
mkdir build
cd build
cmake ..
make 

#ehereum golang

 wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.9.0-52f24617.tar.gz

#----------------私有链部署--------------------#
# 初始化  
./geth --identity "myeth" \
     --networkid 100 init "/home/me/github/DailyNote/eth/mygenesis.json" 
#    --rpc \
#    --rpccorsdomain "*" \
#    --rpcapi "db,eth,net,web3" \
#    --networkid 100 init "/home/me/github/DailyNote/eth/mygenesis.json" 
#    --datadir "" \

# 启动

./geth  --identity "myeth" \
     --rpc \
     --rpccorsdomain "*" \
     --rpcapi "db,eth,net,web3,personal,admin,miner,shh,txpool,debug" \
      --networkid 100 console
 #    --datadir "C:\MyChains\T1"

RPC接口调用
https://github.com/ethereum/wiki/wiki/JSON-RPC 
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"net_version","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"net_listening","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_coinbase","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_mining","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"net_version","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"net_version","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"net_version","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"net_version","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"net_version","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"net_version","params":[],"id":67}' http://127.0.0.1:8545


#web3 javascript 
install nodejs
npm install web3
npm install solc -g
solcjs simpleStorage.sol --abi
solcjs simpleStorage.sol --bin



solidity  基于web的ide  Remix
          使用clion 安装插件 solcjs编译







