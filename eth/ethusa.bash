rpc    JSON-RPC socket path: /Users/zou/.ethereum/geth.ipc
JSONRPC Admin Session Key: I/sKfuOJx7Q=


到北京快15年了吧
15年 人老了  孩子大了  存款多了  房子有了
但是 衣食住行,你的工作，还有你的细想 15年都没变


#----------------私有链部署--------------------#
# 初始化  
./geth --identity "myeth" \
     --rpc \
     --rpccorsdomain "*" \
     --rpcapi "db,eth,net,web3" \
     --networkid 100 init "~/github/DailyNote/mygenesis.json" 

#     --datadir "" \

# 启动

geth  --identity "myeth" 
      --rpccorsdomain "*" 
      --networkid 100 console

 #    --datadir "C:\MyChains\T1"



