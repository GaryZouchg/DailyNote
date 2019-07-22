#ehereum cpp 
git clone --recursive https://github.com/ethereum/aleth.git
cd aleth
mkdir build
cd build
cmake ..
make 

#ehereum golang
wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.9.0-52f24617.tar.gz
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum

#----------------私有链部署--------------------#
# 初始化  
./geth --identity "myeth" \
       --rpc \
       --rpccorsdomain "*" \
       --rpcapi "db,eth,net,web3,personal,admin,miner,shh,txpool,debug" \
       --networkid 100 init "/home/me/github/DailyNote/eth/mygenesis.json" 
    #    --datadir "" \
https://github.com/ethereum/go-ethereum/wiki/Command-Line-Options

# 启动
./geth  --identity "myeth" \
        --rpc \
        --rpccorsdomain "*" \
        --rpcapi "db,eth,net,web3,personal,admin,miner,shh,txpool,debug" \

./geth --identity "myeth" \
       --rpc \
       --rpccorsdomain "*" \
       --rpcapi "db,eth,net,web3,personal,admin,miner,shh,txpool,debug" \
       --"allow-insecure-unlock" \
       --networkid 100 console
     #--unlock '0x4c6cbd2b8428f3ea8257a325258c03b9e9daaf64' 
     #--password password2.txt"

./geth attach
$ geth attach ipc:/some/custom/path
$ geth attach http://191.168.1.1:8545
$ geth attach ws://191.168.1.1:8546

#RPC接口调用
https://github.com/ethereum/wiki/wiki/JSON-RPC 
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"net_version","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"net_listening","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_coinbase","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_mining","params":[],"id":67}' http://127.0.0.1:8545
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":67}' http://127.0.0.1:8545

#web3 javascript 
https://github.com/ethereum/wiki/wiki/JavaScript-API
https://web3js.readthedocs.io/en/1.0/
install nodejs
npm install web3
sudo npm install solc -g
solcjs simpleStorage.sol --abi
solcjs simpleStorage.sol --bin
#install nodejs onwindows
npm install --global --production windows-build-tools

#console command
personal.newAccount()
miner.start()
eth.accounts
eth.blockNumber
eth.getBalance(eth.accounts[0])

personal.unlockAccount(eth.accounts[0])
amount = web3.toWei(9,'ether')
eth.sendTransaction({from:eth.accounts[0],to:eth.accounts[1],value:amount})

myContract = eth.contract(abi)
contract = myContract.new({from:eth.accounts[0],data:code,gas:1000000})


#solidity web IDE
http://remix.ethereum.org/#optimize=false&evmVersion=null
