ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem
5JAaSV9atydvYzEdBErjVCVAtx2SYdo3PykoHwrtYA57Xk3QKgQ
公網: 54.64.18.110     172.30.1.190
公網: 52.199.222.137   172.30.1.226
centos/centos  


#         1.启动钱包
#启动keosd
keosd --unlock-timeout 999999999  \
2>> ./keosd.log  &
tail -f -n 60 ./keosd.log
#--http-server-address 127.0.0.1:8900 
#--wallet-dir /home/achain/eosrun/wallet 
#default : --http-server-address 127.0.0.1:8900
cleos --url http://172.30.1.190:8888 get info
cleos --url http://54.64.18.110:8888 get info
#创建钱包
cleos wallet create --to-console
#--wallet-url http://127.0.0.1:8900 \
#default :--url http://127.0.0.1:8888 
default
"PW5KRnDUuZc4d6WuYuBJNVRskiJtkHMg9XtkiQm6ijxUDvFzaZzsg"

#导入actx私钥
cleos --url http://172.30.1.190:8888 wallet import --private-key 5JAaSV9atydvYzEdBErjVCVAtx2SYdo3PykoHwrtYA57Xk3QKgQ

#         2.启动节点nodeos
rm -rf actx
mkdir actx
nodeos --max-irreversible-block-age -1 --contracts-console \
--genesis-json genesis.json \
--config-dir ./actx \
--data-dir ./actx \
--chain-state-db-size-mb 1024 \
--p2p-listen-endpoint 172.30.1.190:9000 \
--http-server-address 172.30.1.190:8888 \
--max-clients 40 \
--p2p-max-nodes-per-host 40 \
--enable-stale-production \
--producer-name actx \
--private-key '["ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem","5JAaSV9atydvYzEdBErjVCVAtx2SYdo3PykoHwrtYA57Xk3QKgQ"]' \
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
 2>>./actx/actx.log &
#cp -p ~/code/Achainplus/tutorials/bios-boot-tutorial/genesis.json ./
#         3.创建系统账户
cleos --url http://172.30.1.190:8888 create account actx actx.bpay ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem
cleos --url http://172.30.1.190:8888 create account actx actx.msig ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem
cleos --url http://172.30.1.190:8888 create account actx actx.names ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem
cleos --url http://172.30.1.190:8888 create account actx actx.ram ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem
cleos --url http://172.30.1.190:8888 create account actx actx.ramfee ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem
cleos --url http://172.30.1.190:8888 create account actx actx.saving ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem
cleos --url http://172.30.1.190:8888 create account actx actx.stake ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem
cleos --url http://172.30.1.190:8888 create account actx actx.token ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem
cleos --url http://172.30.1.190:8888 create account actx actx.vpay ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem

#         4.安装系统合约token msig
cleos --url http://172.30.1.190:8888 set contract actx.token ~/code/Achainplus/build/contracts/actx.token/
cleos --url http://172.30.1.190:8888 set contract actx.msig ~/code/Achainplus/build/contracts/actx.msig/


#         5.创建发行token
cleos --url http://172.30.1.190:8888 push action actx.token create '["actx", "10000000000.0000 ACTX"]' -p actx.token
cleos --url http://172.30.1.190:8888 push action actx.token issue '["actx", "1000015000.0650 ACTX", "memo"]' -p actx

#         6.安装系统合约 system
cleos --url http://172.30.1.190:8888 set contract actx ~/code/Achainplus/build/contracts/actx.system/
cleos --url http://172.30.1.190:8888  push action actx setpriv '["actx.msig", 1]' -p actx@active

#         7.通过调用合约创建账户
#需要用到的秘钥对
{
    "producers": [
        {"name":"producera", "pvt":"5KLGj1HGRWbk5xNmoKfrcrQHXvcVJBPdAckoiJgFftXSJjLPp7b", "pub":"ACTX8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz"},
        {"name":"producerb", "pvt":"5K6qk1KaCYYWX86UhAfUsbMwhGPUqrqHrZEQDjs9ekP5j6LgHUu", "pub":"ACTX7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC"},
        {"name":"producerc", "pvt":"5JCStvbRgUZ6hjyfUiUaxt5iU3HP6zC1kwx3W7SweaEGvs4EPfQ", "pub":"ACTX5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6"},
        {"name":"producerd", "pvt":"5JJjaKnAb9KM2vkkJDgrYXoeUEdGgWtB5WK1a38wrmKnS3KtkS6", "pub":"ACTX5y3Tm1czTCia3o3JidVKmC78J9gRQU8qHjmRjFxTyhh2vxvF5d"},
        {"name":"producere", "pvt":"5K7hmHA2U3nNpwGx6AffWsHyvsSMJvVKVmSgxnSYAjAvjUfzd5j", "pub":"ACTX5yR5GNn363W3cnet5PE6xWZxa2hDAhmJN5RrB1e3fmJmVNnDRJ"}
    ],
		"producers": [
        {"name":"bp111", "pvt":"5KjqJzgJaFMDeG86WWC8k2aJxdVErgHPQHHhLiYrxG1cmh52NU6", "pub":"ACTX5PT3Lg564qJnmKfGEpU5g3F8wu91VKnamXrYydmzDG6wLpyvhy"},
        {"name":"bp222", "pvt":"5K9mcSMb3YQWXhQqJXFKvE3pgLRBhexJM5yuAyyaZJbrUHeTEE5", "pub":"ACTX57UewCboTUWLi6erUb22N3AVkJNsuqj5A7hVyxBXBFsYncjH9m"},
        {"name":"bp333", "pvt":"5Jwro6icZHbWyrUfigiNk9r2qjVbQsod3kej99gaBdfxzG2tMdJ", "pub":"ACTX7NSm3GYewfUeGZCsujEBdgDW6wVP9WHb5XuhkUnRRJ6A7r97de"},
        {"name":"bp444", "pvt":"5KAn7P9Qgx65eJurU9owet5vqKys5BfFrXHmiKGL8Ko9XJtxqaA", "pub":"ACTX8YMzQW2vLsapQJhhJBn2e4VeUD59on3EUJvE4cuXEjkX8bveNs"},
        {"name":"bp555", "pvt":"5KUKmaTzvASUGAXwMJWxJHuGfcunnrP4bBLLnDZxaLKodPFra9Z", "pub":"ACTX7RvTi1bTPDmYnRCLyCfcaEwB4G4smuLxBkdyGHDX6tfwQVEY3w"}

		"users": [
        {"name":"user1", "pvt":"5JtUScZK2XEp3g9gh7F8bwtPTRAkASmNrrftmx4AxDKD5K4zDnr", "pub":"ACTX69X3383RzBZj41k73CSjUNXM5MYGpnDxyPnWUKPEtYQmTBWz4D"},
        {"name":"user2", "pvt":"5JUNYmkJ5wVmtVY8x9A1KKzYe9UWLZ4Fq1hzGZxfwfzJB8jkw6u", "pub":"ACTX7yBtksm8Kkg85r4in4uCbfN77uRwe82apM8jjbhFVDgEgz3w8S"},
        {"name":"user3", "pvt":"5K6LU8aVpBq9vJsnpCvaHCcyYwzPPKXfDdyefYyAMMs3Qy42fUr", "pub":"ACTX7WnhaKwHpbSidYuh2DF1qAExTRUtPEdZCaZqt75cKcixuQUtdA"},
        {"name":"user4", "pvt":"5KdRpt1juJfbPEryZsQYxyNxSTkXTdqEiL4Yx9cAjdgApt4ANce", "pub":"ACTX7Bn1YDeZ18w2N9DU4KAJxZDt6hk3L7eUwFRAc1hb5bp6xJwxNV"},
        {"name":"user5", "pvt":"5JRMbcnc35NkvxKTZUnoe3W4ENQCjhMUFwjN5jQmAqN9D7N6y3N", "pub":"ACTX6cNcTC6WTFkKV4C8DoxcTXdDTDKvj3vgZEVDGVFckK1eTNJQtf"}
    ]
}
#创建普通用户
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx user1 ACTX69X3383RzBZj41k73CSjUNXM5MYGpnDxyPnWUKPEtYQmTBWz4D \
--stake-net "22882205.5606 ACTX" --stake-cpu "22882205.5605 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx user2 ACTX7yBtksm8Kkg85r4in4uCbfN77uRwe82apM8jjbhFVDgEgz3w8S \
--stake-net "22882205.5606 ACTX" --stake-cpu "22882205.5605 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx user3 ACTX7WnhaKwHpbSidYuh2DF1qAExTRUtPEdZCaZqt75cKcixuQUtdA \
--stake-net "22882205.5606 ACTX" --stake-cpu "22882205.5605 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx user4 ACTX7Bn1YDeZ18w2N9DU4KAJxZDt6hk3L7eUwFRAc1hb5bp6xJwxNV \
--stake-net "22882205.5606 ACTX" --stake-cpu "22882205.5605 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx user5 ACTX6cNcTC6WTFkKV4C8DoxcTXdDTDKvj3vgZEVDGVFckK1eTNJQtf \
--stake-net "22882205.5606 ACTX" --stake-cpu "22882205.5605 ACTX" --buy-ram "0.1000 ACTX"   
#创建普通用户作为代理
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx producera ACTX8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz \
--stake-net "494.9500 ACTX" --stake-cpu "494.9500 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx producerb ACTX7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC \
--stake-net "494.9500 ACTX" --stake-cpu "494.9500 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx producerc ACTX5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6 \
--stake-net "494.9500 ACTX" --stake-cpu "494.9500 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx producerd ACTX5y3Tm1czTCia3o3JidVKmC78J9gRQU8qHjmRjFxTyhh2vxvF5d \
--stake-net "494.9500 ACTX" --stake-cpu "494.9500 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx producere ACTX5yR5GNn363W3cnet5PE6xWZxa2hDAhmJN5RrB1e3fmJmVNnDRJ \
--stake-net "494.9500 ACTX" --stake-cpu "494.9500 ACTX" --buy-ram "0.1000 ACTX"   
#bp111
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx bp111 ACTX5PT3Lg564qJnmKfGEpU5g3F8wu91VKnamXrYydmzDG6wLpyvhy --stake-net "494.9500 ACTX" --stake-cpu "494.9500 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx bp222 ACTX57UewCboTUWLi6erUb22N3AVkJNsuqj5A7hVyxBXBFsYncjH9m --stake-net "494.9500 ACTX" --stake-cpu "494.9500 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx bp333 ACTX7NSm3GYewfUeGZCsujEBdgDW6wVP9WHb5XuhkUnRRJ6A7r97de --stake-net "494.9500 ACTX" --stake-cpu "494.9500 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx bp444 ACTX8YMzQW2vLsapQJhhJBn2e4VeUD59on3EUJvE4cuXEjkX8bveNs --stake-net "494.9500 ACTX" --stake-cpu "494.9500 ACTX" --buy-ram "0.1000 ACTX"   
cleos --url http://172.30.1.190:8888 system newaccount --transfer actx bp555 ACTX7RvTi1bTPDmYnRCLyCfcaEwB4G4smuLxBkdyGHDX6tfwQVEY3w --stake-net "494.9500 ACTX" --stake-cpu "494.9500 ACTX" --buy-ram "0.1000 ACTX"   

#注册产块账户
#producer
cleos --url http://172.30.1.190:8888 wallet import --private-key 5KLGj1HGRWbk5xNmoKfrcrQHXvcVJBPdAckoiJgFftXSJjLPp7b
cleos --url http://172.30.1.190:8888 wallet import --private-key 5K6qk1KaCYYWX86UhAfUsbMwhGPUqrqHrZEQDjs9ekP5j6LgHUu
cleos --url http://172.30.1.190:8888 wallet import --private-key 5JCStvbRgUZ6hjyfUiUaxt5iU3HP6zC1kwx3W7SweaEGvs4EPfQ
cleos --url http://172.30.1.190:8888 wallet import --private-key 5JJjaKnAb9KM2vkkJDgrYXoeUEdGgWtB5WK1a38wrmKnS3KtkS6
cleos --url http://172.30.1.190:8888 wallet import --private-key 5K7hmHA2U3nNpwGx6AffWsHyvsSMJvVKVmSgxnSYAjAvjUfzd5j

cleos --url http://172.30.1.190:8888 system regproducer producera ACTX8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz https://producera.com/ACTX8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz
cleos --url http://172.30.1.190:8888 system regproducer producerb ACTX7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC https://producerb.com/ACTX7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC
cleos --url http://172.30.1.190:8888 system regproducer producerc ACTX5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6 https://producerc.com/ACTX5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6
cleos --url http://172.30.1.190:8888 system regproducer producerd ACTX5y3Tm1czTCia3o3JidVKmC78J9gRQU8qHjmRjFxTyhh2vxvF5d https://producerd.com/ACTX5y3Tm1czTCia3o3JidVKmC78J9gRQU8qHjmRjFxTyhh2vxvF5d
cleos --url http://172.30.1.190:8888 system regproducer producere ACTX5yR5GNn363W3cnet5PE6xWZxa2hDAhmJN5RrB1e3fmJmVNnDRJ https://producere.com/ACTX5yR5GNn363W3cnet5PE6xWZxa2hDAhmJN5RrB1e3fmJmVNnDRJ
#bp111
cleos --url http://172.30.1.190:8888 wallet import --private-key 5KjqJzgJaFMDeG86WWC8k2aJxdVErgHPQHHhLiYrxG1cmh52NU6
cleos --url http://172.30.1.190:8888 wallet import --private-key 5K9mcSMb3YQWXhQqJXFKvE3pgLRBhexJM5yuAyyaZJbrUHeTEE5
cleos --url http://172.30.1.190:8888 wallet import --private-key 5Jwro6icZHbWyrUfigiNk9r2qjVbQsod3kej99gaBdfxzG2tMdJ
cleos --url http://172.30.1.190:8888 wallet import --private-key 5KAn7P9Qgx65eJurU9owet5vqKys5BfFrXHmiKGL8Ko9XJtxqaA
cleos --url http://172.30.1.190:8888 wallet import --private-key 5KUKmaTzvASUGAXwMJWxJHuGfcunnrP4bBLLnDZxaLKodPFra9Z

cleos --url http://172.30.1.190:8888 system regproducer bp111 ACTX5PT3Lg564qJnmKfGEpU5g3F8wu91VKnamXrYydmzDG6wLpyvhy https://bp111.com/ACTX5PT3Lg564qJnmKfGEpU5g3F8wu91VKnamXrYydmzDG6wLpyvhy
cleos --url http://172.30.1.190:8888 system regproducer bp222 ACTX57UewCboTUWLi6erUb22N3AVkJNsuqj5A7hVyxBXBFsYncjH9m https://bp222.com/ACTX57UewCboTUWLi6erUb22N3AVkJNsuqj5A7hVyxBXBFsYncjH9m
cleos --url http://172.30.1.190:8888 system regproducer bp333 ACTX7NSm3GYewfUeGZCsujEBdgDW6wVP9WHb5XuhkUnRRJ6A7r97de https://bp333.com/ACTX7NSm3GYewfUeGZCsujEBdgDW6wVP9WHb5XuhkUnRRJ6A7r97de
cleos --url http://172.30.1.190:8888 system regproducer bp444 ACTX8YMzQW2vLsapQJhhJBn2e4VeUD59on3EUJvE4cuXEjkX8bveNs https://bp444.com/ACTX8YMzQW2vLsapQJhhJBn2e4VeUD59on3EUJvE4cuXEjkX8bveNs
cleos --url http://172.30.1.190:8888 system regproducer bp555 ACTX7RvTi1bTPDmYnRCLyCfcaEwB4G4smuLxBkdyGHDX6tfwQVEY3w https://bp555.com/ACTX7RvTi1bTPDmYnRCLyCfcaEwB4G4smuLxBkdyGHDX6tfwQVEY3w

#转账
cleos --url http://172.30.1.190:8888 transfer actx user1 "10000.0000 ACTX"
#查看产块几点
cleos --url http://172.30.1.190:8888 system listproducers

#         9.给节点投票
#user
cleos --url http://172.30.1.190:8888 wallet import --private-key 5JtUScZK2XEp3g9gh7F8bwtPTRAkASmNrrftmx4AxDKD5K4zDnr
cleos --url http://172.30.1.190:8888 wallet import --private-key 5JUNYmkJ5wVmtVY8x9A1KKzYe9UWLZ4Fq1hzGZxfwfzJB8jkw6u
cleos --url http://172.30.1.190:8888 wallet import --private-key 5K6LU8aVpBq9vJsnpCvaHCcyYwzPPKXfDdyefYyAMMs3Qy42fUr
cleos --url http://172.30.1.190:8888 wallet import --private-key 5KdRpt1juJfbPEryZsQYxyNxSTkXTdqEiL4Yx9cAjdgApt4ANce
cleos --url http://172.30.1.190:8888 wallet import --private-key 5JRMbcnc35NkvxKTZUnoe3W4ENQCjhMUFwjN5jQmAqN9D7N6y3N

cleos --url http://172.30.1.190:8888  system voteproducer prods  user1  producera producerb producerc producerd producere bp111
cleos --url http://172.30.1.190:8888  system voteproducer prods  user2  producera producerb producerc producerd producere bp222
cleos --url http://172.30.1.190:8888  system voteproducer prods  user3  producera producerb producerc producerd producere bp333
cleos --url http://172.30.1.190:8888  system voteproducer prods  user4  producera producerb producerc producerd producere bp444
cleos --url http://172.30.1.190:8888  system voteproducer prods  user5  producera producerb producerc producerd producere bp555
cleos --url http://172.30.1.190:8888  system listproducers


#         10.领取产块奖励
#查看bp
cleos --url http://172.30.1.190:8888  get table actx actx producers
#领取奖励
cleos --url http://172.30.1.190:8888  system claimrewards -j producera

#         11.给代理投票
#注册代理
cleos --url http://172.30.1.190:8888 system regproxy producera
#给产块代理投票
cleos --url http://172.30.1.190:8888 system voteproducer proxy user1 producera

#         12.resign
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx.prods", "permission": "active"}}]}}' -p actx@owner
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx.prods", "permission": "active"}}]}}' -p actx@active
cleos --url http://172.30.1.190:8888 get account actx
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.bpay", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.bpay@owner
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.bpay", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.bpay@active
cleos --url http://172.30.1.190:8888 get account actx.bpay
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.msig", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.msig@owner
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.msig", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.msig@active
cleos --url http://172.30.1.190:8888 get account actx.msig
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.names", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.names@owner
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.names", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.names@active
cleos --url http://172.30.1.190:8888 get account actx.names
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.ram", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.ram@owner
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.ram", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.ram@active
cleos --url http://172.30.1.190:8888 get account actx.ram
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.ramfee", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.ramfee@owner
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.ramfee", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.ramfee@active
cleos --url http://172.30.1.190:8888 get account actx.ramfee
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.saving", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.saving@owner
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.saving", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.saving@active
cleos --url http://172.30.1.190:8888 get account actx.saving
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.stake", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.stake@owner
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.stake", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.stake@active
cleos --url http://172.30.1.190:8888 get account actx.stake
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.token", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.token@owner
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.token", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.token@active
cleos --url http://172.30.1.190:8888 get account actx.token
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.vpay", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.vpay@owner
cleos --url http://172.30.1.190:8888 push action actx updateauth '{"account": "actx.vpay", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "actx", "permission": "active"}}]}}' -p actx.vpay@active
cleos --url http://172.30.1.190:8888 get account actx.vpay




cleos --url http://172.30.1.190:8888 net peers
cleos --url http://172.30.1.190:8888 --url http://127.0.0.1:8001 net peers
cleos --url http://172.30.1.190:8888 --url http://127.0.0.1:8001 get info 




notice while in in sync, fork head num = 16019 target LIB = 16018 next_expected = 16019
info  2018-11-21T09:30:28.360 thread-0  net_plugin.cpp:1524           verify_catchup       ] got a catch_up notice while in head catchup, fork head num = 16019 target LIB = 16018 next_expected = 16019
info  2018-11-21T09:30:28.361 thread-0  producer_plugin.cpp:337       on_incoming_block    ] Received block 1ae1449c9ef257af... #16019 @ 2018-11-21T09:30:28.000 signed by actx [trxs: 0, lib: 16018, conf: 0, latency: 361 ms]
info  2018-11-21T09:30:28.361 thread-0  net_plugin.cpp:1524           verify_catchup       ] got a catch_up notice while in in sync, fork head num = 16019 target LIB = 16018 next_expected = 16019





