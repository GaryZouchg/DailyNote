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
       --networkid 100 init "/home/me/github/DailyNote/eth/mygenesis.json" 
    #   --networkid 100 init "/home/me/github/DailyNote/eth/mygenesis.json" 
    #   --datadir "" \
https://github.com/ethereum/go-ethereum/wiki/Command-Line-Options

# 启动
geth   --identity "myeth" \
       --rpc \
       --rpccorsdomain "*" \
       --rpcapi "db,eth,net,web3,personal,admin,miner,shh,txpool,debug" \
       --"allow-insecure-unlock" \
       --networkid 100  &
     #--unlock '0x4c6cbd2b8428f3ea8257a325258c03b9e9daaf64' 
     #--password password2.txt"
#----------------测试链部署--------------------#
geth   --testnet \
       --rpc \
       --rpccorsdomain "*" \
       --rpcapi "db,eth,net,web3,personal,admin,miner,shh,txpool,debug" \
       --"allow-insecure-unlock" console

./geth attach
$ geth attach ipc:/some/custom/path
$ geth attach localhost:8545
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
miner.start(1)
eth.accounts
eth.blockNumber
eth.getBalance(eth.accounts[0])


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
contract = myContract.new({from:eth.accounts[0],data:bin,gas:200000}) 

#合约调用

//部署直接获取实例， 
c = web3.eth.contract(abi).new({data:bin, from:eth.accounts[0]});
//已部署的需要abi和合约地址
c = eth.contract(abi).at(eth.accounts[0])
c.mint(eth.accounts[0],10000,{from:eth.accounts[0],gas:200000})

// 生成操作码
c.mint.getData(eth.accounts[0],10000)
"0x40c10f1900000000000000000000000041e15905617eb0676dad83a805c14fa2d74133ac0000000000000000000000000000000000000000000000000000000000002710"

#solidity web IDE
http://remix.ethereum.org/#optimize=false&evmVersion=null

Ropsten Test NetWork
account1
44B25E5B743D289BD1F9256F5974BF58D9389780B203F57A1704EF70D242E44A
address: 0xcfb290bdbe0428d13c3408e62b3ae780811b7a70

account2
4853ACDF65F14B90362A717E3C51BD42DFACA75024A3F6BE43ACD28D5D162D39
0xAcdDB7083a2194B4500Bca92c8FC288adEdF3fE7

MetaMask Ether Faucet
address: 0x81b7e08f65bdf5648606c89998a9cc8164397647
balance: 96055172.43 ether

transactions
0xe9ae4ceab2140d1b05284cf4da58bb563a20c340fda6b6c76e6a6675b7bb7729
0xafed65a6a56c284f010463822cc68a087ce605330b5325fbbe7eedf212b55fb0


https://ropsten.etherscan.io/tx/0x85cf9ee7a770fdba6d95b6815b239f946b51f611fe244a568b6db99462043c89


