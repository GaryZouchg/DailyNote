
#         1.启动钱包
#启动keosd
keosd --unlock-timeout 999999999  \
2>> ./keosd.log  &
tail -f -n 60 ./keosd.log
#--http-server-address 127.0.0.1:8900 
#--wallet-dir /home/achain/eosrun/wallet 
#default : --http-server-address 127.0.0.1:8900
#每个cleos命令都可以指定  --url  来指定不同


#创建钱包
cleos wallet create --to-console
#--wallet-url http://127.0.0.1:8900 \
#default :--url http://127.0.0.1:8888 
default
"PW5JnPq4jcNwzfoeLPZSD7MVzysbzPTs31Jr5cyZBt67gCB2ceaeQ"

#导入eosio私钥
cleos wallet import --private-key 5K463ynhZoCDDa4RDcr63cUwWLTnKqmdcoTKTHBjqoKfv4u5V7p

#         2.启动节点nodeos
rm -rf eosio
mkdir eosio
nodeos --max-irreversible-block-age -1 --contracts-console \
--genesis-json genesis.json \
--config-dir ./eosio \
--data-dir ./eosio \
--chain-state-db-size-mb 1024 \
--p2p-listen-endpoint 127.0.0.1:9000 \
--max-clients 40 \
--p2p-max-nodes-per-host 40 \
--enable-stale-production \
--producer-name eosio \
--private-key '["EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr","5K463ynhZoCDDa4RDcr63cUwWLTnKqmdcoTKTHBjqoKfv4u5V7p"]' \
--plugin eosio::http_plugin \
--plugin eosio::http_client_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::chain_plugin \
--plugin eosio::net_api_plugin \
--plugin eosio::net_plugin \
--plugin eosio::producer_plugin \
--plugin eosio::producer_api_plugin \
--plugin eosio::history_plugin \
--plugin eosio::history_api_plugin \
 2>>./eosio/eosio.log &
#--http-server-address 127.0.0.1:8888 \
#--delete-all-blocks   删除数据重新开始产块或同步
#--max-transaction-time 30   解决 transaction took too long  问题
#

#         3.创建系统账户
cleos create account eosio eosio.bpay EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr
cleos create account eosio eosio.msig EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr
cleos create account eosio eosio.names EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr
cleos create account eosio eosio.ram EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr
cleos create account eosio eosio.ramfee EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr
cleos create account eosio eosio.saving EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr
cleos create account eosio eosio.stake EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr
cleos create account eosio eosio.token EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr
cleos create account eosio eosio.vpay EOS8Znrtgwt8TfpmbVpTKvA2oB8Nqey625CLN8bCN3TEbgx86Dsvr
#这9个账户和eosio 共用一对公私钥  也可以认为是 eosio的servant 通过 cleos get servants eosio  



#         4.安装系统合约token msig 
cleos set contract eosio.token ~/github/eos/build/contracts/eosio.token/
cleos set contract eosio.msig  ~/github/eos/build/contracts/eosio.msig/


#         5.创建发行token
cleos push action eosio.token create '["eosio", "10000000000.0000 SYS"]' -p eosio.token
cleos push action eosio.token issue '["eosio", "1000015000.0650 SYS", "memo"]' -p eosio

#         6.安装系统合约 system
cleos set contract eosio ~/github/eos/build/contracts/eosio.system/
cleos  push action eosio setpriv '["eosio.msig", 1]' -p eosio@active

#         7.通过调用合约创建账户
#需要用到的秘钥对通过make key 命令获得
{
    "producers": [
        {"name":"producera", "pvt":"5KLGj1HGRWbk5xNmoKfrcrQHXvcVJBPdAckoiJgFftXSJjLPp7b", "pub":"EOS8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz"},
        {"name":"producerb", "pvt":"5K6qk1KaCYYWX86UhAfUsbMwhGPUqrqHrZEQDjs9ekP5j6LgHUu", "pub":"EOS7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC"},
        {"name":"producerc", "pvt":"5JCStvbRgUZ6hjyfUiUaxt5iU3HP6zC1kwx3W7SweaEGvs4EPfQ", "pub":"EOS5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6"},
        {"name":"producerd", "pvt":"5JJjaKnAb9KM2vkkJDgrYXoeUEdGgWtB5WK1a38wrmKnS3KtkS6", "pub":"EOS5y3Tm1czTCia3o3JidVKmC78J9gRQU8qHjmRjFxTyhh2vxvF5d"},
        {"name":"producere", "pvt":"5K7hmHA2U3nNpwGx6AffWsHyvsSMJvVKVmSgxnSYAjAvjUfzd5j", "pub":"EOS5yR5GNn363W3cnet5PE6xWZxa2hDAhmJN5RrB1e3fmJmVNnDRJ"}
    ],
    "users": [
        {"name":"user1", "pvt":"5JtUScZK2XEp3g9gh7F8bwtPTRAkASmNrrftmx4AxDKD5K4zDnr", "pub":"EOS69X3383RzBZj41k73CSjUNXM5MYGpnDxyPnWUKPEtYQmTBWz4D"},
        {"name":"user2", "pvt":"5JUNYmkJ5wVmtVY8x9A1KKzYe9UWLZ4Fq1hzGZxfwfzJB8jkw6u", "pub":"EOS7yBtksm8Kkg85r4in4uCbfN77uRwe82apM8jjbhFVDgEgz3w8S"},
        {"name":"user3", "pvt":"5K6LU8aVpBq9vJsnpCvaHCcyYwzPPKXfDdyefYyAMMs3Qy42fUr", "pub":"EOS7WnhaKwHpbSidYuh2DF1qAExTRUtPEdZCaZqt75cKcixuQUtdA"},
        {"name":"user4", "pvt":"5KdRpt1juJfbPEryZsQYxyNxSTkXTdqEiL4Yx9cAjdgApt4ANce", "pub":"EOS7Bn1YDeZ18w2N9DU4KAJxZDt6hk3L7eUwFRAc1hb5bp6xJwxNV"},
        {"name":"user5", "pvt":"5JRMbcnc35NkvxKTZUnoe3W4ENQCjhMUFwjN5jQmAqN9D7N6y3N", "pub":"EOS6cNcTC6WTFkKV4C8DoxcTXdDTDKvj3vgZEVDGVFckK1eTNJQtf"}
    ]
}
#创建普通用户
cleos system newaccount --transfer eosio user1 EOS69X3383RzBZj41k73CSjUNXM5MYGpnDxyPnWUKPEtYQmTBWz4D \
--stake-net "22882205.5606 SYS" --stake-cpu "22882205.5605 SYS" --buy-ram "0.1000 SYS"   
cleos system newaccount --transfer eosio user2 EOS7yBtksm8Kkg85r4in4uCbfN77uRwe82apM8jjbhFVDgEgz3w8S \
--stake-net "22882205.5606 SYS" --stake-cpu "22882205.5605 SYS" --buy-ram "0.1000 SYS"   
cleos system newaccount --transfer eosio user3 EOS7WnhaKwHpbSidYuh2DF1qAExTRUtPEdZCaZqt75cKcixuQUtdA \
--stake-net "22882205.5606 SYS" --stake-cpu "22882205.5605 SYS" --buy-ram "0.1000 SYS"   
cleos system newaccount --transfer eosio user4 EOS7Bn1YDeZ18w2N9DU4KAJxZDt6hk3L7eUwFRAc1hb5bp6xJwxNV \
--stake-net "22882205.5606 SYS" --stake-cpu "22882205.5605 SYS" --buy-ram "0.1000 SYS"   
cleos system newaccount --transfer eosio user5 EOS6cNcTC6WTFkKV4C8DoxcTXdDTDKvj3vgZEVDGVFckK1eTNJQtf \
--stake-net "22882205.5606 SYS" --stake-cpu "22882205.5605 SYS" --buy-ram "0.1000 SYS"   
#创建普通用户作为代理
cleos system newaccount --transfer eosio producera EOS8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz \
--stake-net "494.9500 SYS" --stake-cpu "494.9500 SYS" --buy-ram "0.1000 SYS"   
cleos system newaccount --transfer eosio producerb EOS7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC \
--stake-net "494.9500 SYS" --stake-cpu "494.9500 SYS" --buy-ram "0.1000 SYS"   
cleos system newaccount --transfer eosio producerc EOS5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6 \
--stake-net "494.9500 SYS" --stake-cpu "494.9500 SYS" --buy-ram "0.1000 SYS"   
cleos system newaccount --transfer eosio producerd EOS5y3Tm1czTCia3o3JidVKmC78J9gRQU8qHjmRjFxTyhh2vxvF5d \
--stake-net "494.9500 SYS" --stake-cpu "494.9500 SYS" --buy-ram "0.1000 SYS"   
cleos system newaccount --transfer eosio producere EOS5yR5GNn363W3cnet5PE6xWZxa2hDAhmJN5RrB1e3fmJmVNnDRJ \
--stake-net "494.9500 SYS" --stake-cpu "494.9500 SYS" --buy-ram "0.1000 SYS"   
#注册产块账户
cleos wallet import --private-key 5KLGj1HGRWbk5xNmoKfrcrQHXvcVJBPdAckoiJgFftXSJjLPp7b
cleos wallet import --private-key 5K6qk1KaCYYWX86UhAfUsbMwhGPUqrqHrZEQDjs9ekP5j6LgHUu
cleos wallet import --private-key 5JCStvbRgUZ6hjyfUiUaxt5iU3HP6zC1kwx3W7SweaEGvs4EPfQ
cleos system regproducer producera EOS8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz https://producera.com/EOS8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz
cleos system regproducer producerb EOS7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC https://producerb.com/EOS7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC
cleos system regproducer producerc EOS5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6 https://producerc.com/EOS5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6
#转账
cleos transfer eosio user1 "721177993.9595 SYS"
#查看产块几点
cleos system listproducers

#         8.启动其他产块节点
rm -rf producera
mkdir producera

nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./producera    \
--data-dir ./producera    \
--chain-state-db-size-mb 1024    \
--http-server-address 127.0.0.1:8001    \
--p2p-listen-endpoint 127.0.0.1:9001    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name producera    \
--private-key '["EOS8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz","5KLGj1HGRWbk5xNmoKfrcrQHXvcVJBPdAckoiJgFftXSJjLPp7b"]'    \
--plugin eosio::http_plugin \
--plugin eosio::http_client_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::chain_plugin \
--plugin eosio::net_api_plugin \
--plugin eosio::net_plugin \
--plugin eosio::producer_plugin \
--plugin eosio::producer_api_plugin \
--plugin eosio::history_plugin \
--plugin eosio::history_api_plugin \
--p2p-peer-address localhost:9000 \
 2>>./producera/producera.log &


rm -rf producerb
mkdir producerb
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./producerb    \
--data-dir ./producerb    \
--chain-state-db-size-mb 1024    \
--http-server-address 127.0.0.1:8002    \
--p2p-listen-endpoint 127.0.0.1:9002    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name producerb    \
--private-key '["EOS7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC","5K6qk1KaCYYWX86UhAfUsbMwhGPUqrqHrZEQDjs9ekP5j6LgHUu"]'    \
--plugin eosio::http_plugin \
--plugin eosio::http_client_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::chain_plugin \
--plugin eosio::net_api_plugin \
--plugin eosio::net_plugin \
--plugin eosio::producer_plugin \
--plugin eosio::producer_api_plugin \
--plugin eosio::history_plugin \
--plugin eosio::history_api_plugin \
--p2p-peer-address localhost:9000 \
--p2p-peer-address localhost:9001 \
 2>>./producerb/producerb.log &

rm -rf producerc
mkdir producerc
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./producerc    \
--data-dir ./producerc    \
--chain-state-db-size-mb 1024    \
--http-server-address 127.0.0.1:8003    \
--p2p-listen-endpoint 127.0.0.1:9003    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name producerc    \
--private-key '["EOS5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6","5JCStvbRgUZ6hjyfUiUaxt5iU3HP6zC1kwx3W7SweaEGvs4EPfQ"]'    \
--plugin eosio::http_plugin \
--plugin eosio::http_client_plugin \
--plugin eosio::chain_api_plugin \
--plugin eosio::chain_plugin \
--plugin eosio::net_api_plugin \
--plugin eosio::net_plugin \
--plugin eosio::producer_plugin \
--plugin eosio::producer_api_plugin \
--plugin eosio::history_plugin \
--plugin eosio::history_api_plugin \
--p2p-peer-address localhost:9000 \
--p2p-peer-address localhost:9001 \
--p2p-peer-address localhost:9002 \
 2>>./producerc/producerc.log &

#         9.给节点投票
cleos  system voteproducer prods user1  producera producerb producerc
cleos  system voteproducer prods user2  producera producerb producerc
cleos  system voteproducer prods user3  producera producerb producerc
cleos  system voteproducer prods user4  producera producerb producerc
cleos  system voteproducer prods user5  producera producerb producerc
#一次最多个30个代理投票
1111 stake 和 voete

cleos  system listproducers


#         10.领取产块奖励
#查看bp
cleos  get table eosio eosio producers
#领取奖励
cleos  system claimrewards -j producera

#         11.给代理投票
#注册代理
cleos system regproxy producera
#给产块代理投票
cleos system voteproducer proxy user1 producera producerb producerc

#         12.resign
cleos push action eosio updateauth '{"account": "eosio", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio.prods", "permission": "active"}}]}}' -p eosio@owner
cleos push action eosio updateauth '{"account": "eosio", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio.prods", "permission": "active"}}]}}' -p eosio@active
cleos get account eosio
cleos push action eosio updateauth '{"account": "eosio.bpay", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.bpay@owner
cleos push action eosio updateauth '{"account": "eosio.bpay", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.bpay@active
cleos get account eosio.bpay
cleos push action eosio updateauth '{"account": "eosio.msig", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.msig@owner
cleos push action eosio updateauth '{"account": "eosio.msig", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.msig@active
cleos get account eosio.msig
cleos push action eosio updateauth '{"account": "eosio.names", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.names@owner
cleos push action eosio updateauth '{"account": "eosio.names", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.names@active
cleos get account eosio.names
cleos push action eosio updateauth '{"account": "eosio.ram", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.ram@owner
cleos push action eosio updateauth '{"account": "eosio.ram", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.ram@active
cleos get account eosio.ram
cleos push action eosio updateauth '{"account": "eosio.ramfee", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.ramfee@owner
cleos push action eosio updateauth '{"account": "eosio.ramfee", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.ramfee@active
cleos get account eosio.ramfee
cleos push action eosio updateauth '{"account": "eosio.saving", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.saving@owner
cleos push action eosio updateauth '{"account": "eosio.saving", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.saving@active
cleos get account eosio.saving
cleos push action eosio updateauth '{"account": "eosio.stake", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.stake@owner
cleos push action eosio updateauth '{"account": "eosio.stake", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.stake@active
cleos get account eosio.stake
cleos push action eosio updateauth '{"account": "eosio.token", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.token@owner
cleos push action eosio updateauth '{"account": "eosio.token", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.token@active
cleos get account eosio.token
cleos push action eosio updateauth '{"account": "eosio.vpay", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.vpay@owner
cleos push action eosio updateauth '{"account": "eosio.vpay", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.vpay@active
cleos get account eosio.vpay




cleos net peers
cleos --url http://127.0.0.1:8001 net peers
cleos --url http://127.0.0.1:8001 get info 









