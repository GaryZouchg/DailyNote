

mkdir -p ~/GSE/testnet_node
cp ~/github/gsenetwork/testnet_config ~/GSE/testnet_node/
cp ~/github/gsenetwork/build/programs/gsenode  ~/GSE/testnet_node/


/Users/zou/github/DailyNote/gse_test_config
./gsenode -c /Users/zou/github/DailyNote/gse_test_config -r -p

rm -rf /Users/zou/github/gsenetwork/cmake-build-debug/programs/data

/Users/zou/github/gsenetwork-cli/build/cmd/gsecli 


first bp
62D77A3A935615BDFE63EA09A625945B9567D910571866B7DAB0FFC41920BF13 
EeAde54F500E67ddfEB62c268a8F0b5Fa0AE6aD1


B080AA05D36D660D7BCD8A31D39B4F107EBCACD2BFD5200A67DAD58699B068E2	e53FDEEa7212dc507B81ee90E1b400BB9327bF53

6829CCBDD058F44A733B77F4A2CCAF49AA6DF0BB0518AEDD2D3797BA2CE38EEA	6D61d53CCFB98e6C36F185847CE11C9812b0220A

3ADBBB954E947D2D102D0E904331A382DF1ABB1660F87A6D12D11A887281EB10	a4C3eb53A36EF5D7dfd3C08565C863bD5e63a788




testnet deploy
mkdir ~/GSE/NODE1
mkdir ~/GSE/NODE2
mkdir ~/GSE/NODE3
mkdir ~/GSE/NODE4
mkdir ~/GSE/NODE5
mkdir ~/GSE/NODE6
mkdir ~/GSE/NODE7

    "rpc": {
        "ip_port": "127.0.0.1:50505"
        "ip_port": "127.0.0.1:50506"
        "ip_port": "127.0.0.1:50507"
        "ip_port": "127.0.0.1:50508"
        "ip_port": "127.0.0.1:50509"
        "ip_port": "127.0.0.1:50510"
    },

    "local": {
        "local_ip_port": "127.0.0.1:60606"
62D77A3A935615BDFE63EA09A625945B9567D910571866B7DAB0FFC41920BF13	0xEeAde54F500E67ddfEB62c268a8F0b5Fa0AE6aD1
        "local_ip_port": "127.0.0.1:60607"
259F2149514F518B87FD780F8C79B65AA9DEEC3D4DCDB435748695C58084531A	0x9DfE16ab171d7558a8aF235fF25774eef415314C
        "local_ip_port": "127.0.0.1:60608"
37F17756E88725DA56CD69B46D9C31A1965815CD0F36AB180C1AFED7A070E2BB	0xe87aF2f914a5c6dDFFc045B56F69bEfa7a73382a
        "local_ip_port": "127.0.0.1:60609"
60B89A3CEEB64003CBCC1D9A50DD513ACBDA4951E5A3EB9D0D63CC7638F95783	0xc110F9C49025B52B7358f54d3E2fF12F60C890D1
        "local_ip_port": "127.0.0.1:60610"
A05237BC80BD11ADA802044E0438936112C135444451D04161E21C5428A87378	0xd9405142ec5b233f849a631095Cf77963Fdb774f
        "local_ip_port": "127.0.0.1:60611"
5BECCA818ED0C473BDE2F529355FA9CF47253A1C844BA7609FE8BC979669716C	0x29a23572675e2164cb0D8EB490c4773152377A0c
        "local_ip_port": "127.0.0.1:60612"
A48D6402948B6372D13DD0B1644A10BE8C5CDF43C9EF5D41972C60A4C9955A1A	0xCcdFEEAEDf1d3d16367593af0AfE3981d8C25Ab5
    },

    "net": {
        "node_list": [
			"127.0.0.1:60606"
            "127.0.0.1:60607",
            "127.0.0.1:60608",
            "127.0.0.1:60609"
            "127.0.0.1:60610"
            "127.0.0.1:60611"
            "127.0.0.1:60612"
        ],

cp testnet_config ./testnet_config1
cp testnet_config ./testnet_config2
cp testnet_config ./testnet_config3
cp testnet_config ./testnet_config4
cp testnet_config ./testnet_config5
cp testnet_config ./testnet_config6
cp testnet_config ./testnet_config7


cp gsenode testnet_config1 ./NODE1
cp gsenode testnet_config2 ./NODE2
cp gsenode testnet_config3 ./NODE3
cp gsenode testnet_config4 ./NODE4
cp gsenode testnet_config5 ./NODE5
cp gsenode testnet_config6 ./NODE6
cp gsenode testnet_config7 ./NODE7

cd ~/GSE/NODE1
./gsenode -c ~/GSE/testnet_config1 -r -p
cd ~/GSE/NODE2
./gsenode -c ~/GSE/testnet_config2 -r -p 
cd ~/GSE/NODE3
./gsenode -c ~/GSE/testnet_config3 -r -p
cd ~/GSE/NODE4
./gsenode -c ~/GSE/testnet_config4 -r -p
cd ~/GSE/NODE5
./gsenode -c ~/GSE/testnet_config5 -r -p
cd ~/GSE/NODE6
./gsenode -c ~/GSE/testnet_config6 -r -p
cd ~/GSE/NODE7
./gsenode -c ~/GSE/testnet_config7 -r -p





