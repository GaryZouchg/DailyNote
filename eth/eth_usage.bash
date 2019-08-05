#ehereum cpp 
git clone --recursive https://github.com/ethereum/aleth.git


#ehereum golang
wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.9.0-52f24617.tar.gz
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum

#----------------私有链部署--------------------#
# 初始化  
geth   --identity "myeth" \
       --rpc \
       --rpccorsdomain "*" \
       --rpcapi "db,eth,net,web3,personal,admin,miner,shh,txpool,debug" \
       --networkid 100 init "/Users/zou/github/DailyNote/eth/mygenesis.json" 
    #   --networkid 100 init "/home/me/github/DailyNote/eth/mygenesis.json" 
    #   --datadir "" \
https://github.com/ethereum/go-ethereum/wiki/Command-Line-Options

# 启动

geth --identity "myeth" \
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
personal.newAccount(1)
miner.start()
eth.accounts
eth.blockNumber
eth.getBalance(eth.accounts[0])
eth.getBlock(37)


personal.unlockAccount(eth.accounts[0])
#转账
amount = web3.toWei(9,'ether')
eth.sendTransaction({from:eth.accounts[0],to:eth.accounts[1],value:amount})
eth.getTransaction("0x5a217d185fc3dcc745181b0505d43b556ebaa8e230f35db5c656a58079fde384")


#合约部署
--Coin.sol
abi=[{"constant":true,"inputs":[],"name":"minter","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"balances","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"receiver","type":"address"},{"name":"amount","type":"uint256"}],"name":"mint","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"receiver","type":"address"},{"name":"amount","type":"uint256"}],"name":"send","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"from","type":"address"},{"indexed":false,"name":"to","type":"address"},{"indexed":false,"name":"amount","type":"uint256"}],"name":"Sent","type":"event"}]
bin="0x608060405234801561001057600080fd5b50336000806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff160217905550610436806100606000396000f3fe608060405234801561001057600080fd5b506004361061004c5760003560e01c8063075461721461005157806327e235e31461009b57806340c10f19146100f3578063d0679d3414610141575b600080fd5b61005961018f565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b6100dd600480360360208110156100b157600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506101b4565b6040518082815260200191505060405180910390f35b61013f6004803603604081101561010957600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506101cc565b005b61018d6004803603604081101561015757600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610277565b005b6000809054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b60016020528060005260406000206000915090505481565b6000809054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161461022557610273565b80600160008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825401925050819055505b5050565b80600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000205410156102c3576103fd565b80600160003373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254039250508190555080600160008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825401925050819055507f3990db2d31862302a685e8086b5755072a6e2b5b780af1ee81ece35ee3cd3345338383604051808473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001828152602001935050505060405180910390a15b505056fea265627a7a7230582053f7ebdff7cbbd679fbf19b36b9803cef8d9a58cebc0536d16c632967af4577364736f6c634300050a0032"

myContract = eth.contract(abi)
contract = myContract.new({from:eth.accounts[0],data:bin,gas:1000000})

eth.getBlock(565)
eth.getTransaction("0xce5687723fa3093bfa72db16a964bb58940b179b35fcf9924d2a8c5c1a69cb01")



#solidity web IDE
http://remix.ethereum.org/#optimize=false&evmVersion=null
