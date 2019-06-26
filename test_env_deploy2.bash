ACTX7cvL5oqAPJRe6vGz73sthbdnKHryf1RbmaYCax1E3k2KDh7bem
5JAaSV9atydvYzEdBErjVCVAtx2SYdo3PykoHwrtYA57Xk3QKgQ
公網: 54.64.18.110     172.30.1.190
公網: 52.199.222.137   172.30.1.226

yum install firewalld
systemctl  start  firewalld
systemctl  stop   firewalld
systemctl  status  firewalld

sudo firewall-cmd  --state
sudo firewall-cmd   --list-all
sudo firewall-cmd   --permanent   --zone=public   --add-port=8000-9999/tcp
sudo firewall-cmd   --permanent   --zone=public   --remove-port=100-500/tcp
sudo firewall-cmd --complete-reload
tcping: https://elifulkerson.com/projects/tcping.php



    "producers": [
        {"name":"producera", "pvt":"5KLGj1HGRWbk5xNmoKfrcrQHXvcVJBPdAckoiJgFftXSJjLPp7b", "pub":"ACTX8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz"},
        {"name":"producerb", "pvt":"5K6qk1KaCYYWX86UhAfUsbMwhGPUqrqHrZEQDjs9ekP5j6LgHUu", "pub":"ACTX7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC"},
        {"name":"producerc", "pvt":"5JCStvbRgUZ6hjyfUiUaxt5iU3HP6zC1kwx3W7SweaEGvs4EPfQ", "pub":"ACTX5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6"},
        {"name":"producerd", "pvt":"5JJjaKnAb9KM2vkkJDgrYXoeUEdGgWtB5WK1a38wrmKnS3KtkS6", "pub":"ACTX5y3Tm1czTCia3o3JidVKmC78J9gRQU8qHjmRjFxTyhh2vxvF5d"},
        {"name":"producere", "pvt":"5K7hmHA2U3nNpwGx6AffWsHyvsSMJvVKVmSgxnSYAjAvjUfzd5j", "pub":"ACTX5yR5GNn363W3cnet5PE6xWZxa2hDAhmJN5RrB1e3fmJmVNnDRJ"}

		"producers": [
        {"name":"bp111", "pvt":"5KjqJzgJaFMDeG86WWC8k2aJxdVErgHPQHHhLiYrxG1cmh52NU6", "pub":"ACTX5PT3Lg564qJnmKfGEpU5g3F8wu91VKnamXrYydmzDG6wLpyvhy"},
        {"name":"bp222", "pvt":"5K9mcSMb3YQWXhQqJXFKvE3pgLRBhexJM5yuAyyaZJbrUHeTEE5", "pub":"ACTX57UewCboTUWLi6erUb22N3AVkJNsuqj5A7hVyxBXBFsYncjH9m"},
        {"name":"bp333", "pvt":"5Jwro6icZHbWyrUfigiNk9r2qjVbQsod3kej99gaBdfxzG2tMdJ", "pub":"ACTX7NSm3GYewfUeGZCsujEBdgDW6wVP9WHb5XuhkUnRRJ6A7r97de"},
        {"name":"bp444", "pvt":"5KAn7P9Qgx65eJurU9owet5vqKys5BfFrXHmiKGL8Ko9XJtxqaA", "pub":"ACTX8YMzQW2vLsapQJhhJBn2e4VeUD59on3EUJvE4cuXEjkX8bveNs"},
        {"name":"bp555", "pvt":"5KUKmaTzvASUGAXwMJWxJHuGfcunnrP4bBLLnDZxaLKodPFra9Z", "pub":"ACTX7RvTi1bTPDmYnRCLyCfcaEwB4G4smuLxBkdyGHDX6tfwQVEY3w"}


rm -rf producera
mkdir producera
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./producera    \
--data-dir ./producera    \
--chain-state-db-size-mb 1024    \
--http-server-address 172.30.1.226:8001    \
--p2p-listen-endpoint 172.30.1.226:9001    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name producera    \
--private-key '["ACTX8imf2TDq6FKtLZ8mvXPWcd6EF2rQwo8zKdLNzsbU9EiMSt9Lwz","5KLGj1HGRWbk5xNmoKfrcrQHXvcVJBPdAckoiJgFftXSJjLPp7b"]'    \
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
--p2p-peer-address 54.64.18.110:9000 \
--p2p-peer-address 172.30.1.226:9002 \
 2>>./producera/producera.log &
tail -f ./producera/producera.log

cleos --url http://172.30.1.226:8001 net connect http://172.30.1.226:9002
cleos --url http://172.30.1.226:8001 net disconnect http://172.30.1.226:9002
cleos --url http://172.30.1.226:8001 net disconnect http://54.64.18.110:9002

cleos --url http://172.30.1.226:8001 net peers
cleos --url http://172.30.1.226:8001 net peers
agent-name = "eosio Agent" 


{"name":"producerb", "pvt":"5K6qk1KaCYYWX86UhAfUsbMwhGPUqrqHrZEQDjs9ekP5j6LgHUu", "pub":"ACTX7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC"}, 
rm -rf producerb
mkdir producerb
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./producerb    \
--data-dir ./producerb    \
--chain-state-db-size-mb 1024    \
--http-server-address 172.30.1.226:8002    \
--p2p-listen-endpoint 172.30.1.226:9002    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name producerb    \
--agent-name  "producerb Agent"  \
--private-key '["ACTX7Ef4kuyTbXbtSPP5Bgethvo6pbitpuEz2RMWhXb8LXxEgcR7MC","5K6qk1KaCYYWX86UhAfUsbMwhGPUqrqHrZEQDjs9ekP5j6LgHUu"]'    \
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
--p2p-peer-address 54.64.18.110:9000 \
--p2p-peer-address 172.30.1.226:9001 \
 2>>./producerb/producerb.log &
tail -f ./producerb/producerb.log
cleos --url http://172.30.1.226:8002 net peers
 
        {"name":"producerc", "pvt":"5JCStvbRgUZ6hjyfUiUaxt5iU3HP6zC1kwx3W7SweaEGvs4EPfQ", "pub":"ACTX5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6"},
rm -rf producerc
mkdir producerc
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./producerc    \
--data-dir ./producerc    \
--chain-state-db-size-mb 1024    \
--http-server-address 172.30.1.226:8003    \
--p2p-listen-endpoint 172.30.1.226:9003    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name producerc    \
--agent-name  "producerc Agent"  \
--private-key '["ACTX5n442Qz4yVc4LbdPCDnxNSseAiUCrNjRxAfPhUvM8tWS5svid6","5JCStvbRgUZ6hjyfUiUaxt5iU3HP6zC1kwx3W7SweaEGvs4EPfQ"]'    \
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
--p2p-peer-address 54.64.18.110:9000 \
--p2p-peer-address 172.30.1.226:9001 \
--p2p-peer-address 172.30.1.226:9002 \
 2>>./producerc/producerc.log &
tail -f ./producerc/producerc.log
cleos --url http://172.30.1.226:8003 net peers
 
        {"name":"producerd", "pvt":"5JJjaKnAb9KM2vkkJDgrYXoeUEdGgWtB5WK1a38wrmKnS3KtkS6", "pub":"ACTX5y3Tm1czTCia3o3JidVKmC78J9gRQU8qHjmRjFxTyhh2vxvF5d"},
rm -rf producerd
mkdir producerd
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./producerd    \
--data-dir ./producerd    \
--chain-state-db-size-mb 1024    \
--http-server-address 172.30.1.226:8004    \
--p2p-listen-endpoint 172.30.1.226:9004    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name producerd    \
--agent-name  "producerd Agent"  \
--private-key '["ACTX5y3Tm1czTCia3o3JidVKmC78J9gRQU8qHjmRjFxTyhh2vxvF5d","5JJjaKnAb9KM2vkkJDgrYXoeUEdGgWtB5WK1a38wrmKnS3KtkS6"]'    \
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
--p2p-peer-address 54.64.18.110:9000 \
--p2p-peer-address 172.30.1.226:9001 \
--p2p-peer-address 172.30.1.226:9002 \
--p2p-peer-address 172.30.1.226:9003 \
 2>>./producerd/producerd.log &
tail -f ./producerd/producerd.log
cleos --url http://172.30.1.226:8004 net peers
 
        {"name":"producere", "pvt":"5K7hmHA2U3nNpwGx6AffWsHyvsSMJvVKVmSgxnSYAjAvjUfzd5j", "pub":"ACTX5yR5GNn363W3cnet5PE6xWZxa2hDAhmJN5RrB1e3fmJmVNnDRJ"}
rm -rf producere
mkdir producere
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./producere    \
--data-dir ./producere    \
--chain-state-db-size-mb 1024    \
--http-server-address 172.30.1.226:8005    \
--p2p-listen-endpoint 172.30.1.226:9005    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name producere    \
--agent-name  "producere Agent"  \
--private-key '["ACTX5yR5GNn363W3cnet5PE6xWZxa2hDAhmJN5RrB1e3fmJmVNnDRJ","5K7hmHA2U3nNpwGx6AffWsHyvsSMJvVKVmSgxnSYAjAvjUfzd5j"]'    \
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
--p2p-peer-address 54.64.18.110:9000 \
--p2p-peer-address 172.30.1.226:9001 \
--p2p-peer-address 172.30.1.226:9002 \
--p2p-peer-address 172.30.1.226:9003 \
--p2p-peer-address 172.30.1.226:9004 \
 2>>./producere/producere.log &
tail -f ./producere/producere.log
cleos --url http://172.30.1.226:8005 net peers
 
  		"producers": [
        {"name":"bp111", "pvt":"5KjqJzgJaFMDeG86WWC8k2aJxdVErgHPQHHhLiYrxG1cmh52NU6", "pub":"ACTX5PT3Lg564qJnmKfGEpU5g3F8wu91VKnamXrYydmzDG6wLpyvhy"},
        {"name":"bp222", "pvt":"5K9mcSMb3YQWXhQqJXFKvE3pgLRBhexJM5yuAyyaZJbrUHeTEE5", "pub":"ACTX57UewCboTUWLi6erUb22N3AVkJNsuqj5A7hVyxBXBFsYncjH9m"},
        {"name":"bp333", "pvt":"5Jwro6icZHbWyrUfigiNk9r2qjVbQsod3kej99gaBdfxzG2tMdJ", "pub":"ACTX7NSm3GYewfUeGZCsujEBdgDW6wVP9WHb5XuhkUnRRJ6A7r97de"},
        {"name":"bp444", "pvt":"5KAn7P9Qgx65eJurU9owet5vqKys5BfFrXHmiKGL8Ko9XJtxqaA", "pub":"ACTX8YMzQW2vLsapQJhhJBn2e4VeUD59on3EUJvE4cuXEjkX8bveNs"},
        {"name":"bp555", "pvt":"5KUKmaTzvASUGAXwMJWxJHuGfcunnrP4bBLLnDZxaLKodPFra9Z", "pub":"ACTX7RvTi1bTPDmYnRCLyCfcaEwB4G4smuLxBkdyGHDX6tfwQVEY3w"}

        {"name":"bp111", "pvt":"5KjqJzgJaFMDeG86WWC8k2aJxdVErgHPQHHhLiYrxG1cmh52NU6", "pub":"ACTX5PT3Lg564qJnmKfGEpU5g3F8wu91VKnamXrYydmzDG6wLpyvhy"}
rm -rf bp111
mkdir bp111
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./bp111    \
--data-dir ./bp111    \
--chain-state-db-size-mb 1024    \
--http-server-address 172.30.1.190:8001    \
--p2p-listen-endpoint 172.30.1.190:9001    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name bp111    \
--agent-name  "bp111 Agent"  \
--private-key '["ACTX5PT3Lg564qJnmKfGEpU5g3F8wu91VKnamXrYydmzDG6wLpyvhy","5KjqJzgJaFMDeG86WWC8k2aJxdVErgHPQHHhLiYrxG1cmh52NU6"]'    \
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
--p2p-peer-address 172.30.1.190:9000 \
--p2p-peer-address 172.30.1.190:9002 \
--p2p-peer-address 52.199.222.137:9001 \
--p2p-peer-address 52.199.222.137:9002 \
--p2p-peer-address 52.199.222.137:9003 \
--p2p-peer-address 52.199.222.137:9004 \
--p2p-peer-address 52.199.222.137:9005 \
 2>>./bp111/bp111.log &
tail -f ./bp111/bp111.log
cleos --url http://172.30.1.190:8005 net peers
 
        {"name":"bp222", "pvt":"5K9mcSMb3YQWXhQqJXFKvE3pgLRBhexJM5yuAyyaZJbrUHeTEE5", "pub":"ACTX57UewCboTUWLi6erUb22N3AVkJNsuqj5A7hVyxBXBFsYncjH9m"},
rm -rf bp222
mkdir bp222
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./bp222    \
--data-dir ./bp222    \
--chain-state-db-size-mb 1024    \
--http-server-address 172.30.1.190:8002    \
--p2p-listen-endpoint 172.30.1.190:9002    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name bp222    \
--agent-name  "bp222 Agent"  \
--private-key '["ACTX57UewCboTUWLi6erUb22N3AVkJNsuqj5A7hVyxBXBFsYncjH9m","5K9mcSMb3YQWXhQqJXFKvE3pgLRBhexJM5yuAyyaZJbrUHeTEE5"]'    \
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
--p2p-peer-address 172.30.1.190:9000 \
--p2p-peer-address 172.30.1.190:9001 \
--p2p-peer-address 52.199.222.137:9001 \
--p2p-peer-address 52.199.222.137:9002 \
--p2p-peer-address 52.199.222.137:9003 \
--p2p-peer-address 52.199.222.137:9004 \
--p2p-peer-address 52.199.222.137:9005 \
 2>>./bp222/bp222.log &
tail -f ./bp222/bp222.log
cleos --url http://172.30.1.190:8002 net peers
 
		
        {"name":"bp333", "pvt":"5Jwro6icZHbWyrUfigiNk9r2qjVbQsod3kej99gaBdfxzG2tMdJ", "pub":"ACTX7NSm3GYewfUeGZCsujEBdgDW6wVP9WHb5XuhkUnRRJ6A7r97de"},
rm -rf bp333
mkdir bp333
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./bp333    \
--data-dir ./bp333    \
--chain-state-db-size-mb 1024    \
--http-server-address 172.30.1.190:8003    \
--p2p-listen-endpoint 172.30.1.190:9003    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name bp333    \
--agent-name  "bp333 Agent"  \
--private-key '["ACTX7NSm3GYewfUeGZCsujEBdgDW6wVP9WHb5XuhkUnRRJ6A7r97de","5Jwro6icZHbWyrUfigiNk9r2qjVbQsod3kej99gaBdfxzG2tMdJ"]'    \
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
--p2p-peer-address 172.30.1.190:9000 \
--p2p-peer-address 172.30.1.190:9001 \
--p2p-peer-address 172.30.1.190:9002 \
--p2p-peer-address 52.199.222.137:9004 \
--p2p-peer-address 52.199.222.137:9005 \
 2>>./bp333/bp333.log &
tail -f ./bp333/bp333.log
cleos --url http://172.30.1.190:8003 net peers
 
		
        {"name":"bp444", "pvt":"5KAn7P9Qgx65eJurU9owet5vqKys5BfFrXHmiKGL8Ko9XJtxqaA", "pub":"ACTX8YMzQW2vLsapQJhhJBn2e4VeUD59on3EUJvE4cuXEjkX8bveNs"},
rm -rf bp444
mkdir bp444
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./bp444    \
--data-dir ./bp444    \
--chain-state-db-size-mb 1024    \
--http-server-address 172.30.1.190:8004    \
--p2p-listen-endpoint 172.30.1.190:9004    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name bp444    \
--agent-name  "bp444 Agent"  \
--private-key '["ACTX8YMzQW2vLsapQJhhJBn2e4VeUD59on3EUJvE4cuXEjkX8bveNs","5KAn7P9Qgx65eJurU9owet5vqKys5BfFrXHmiKGL8Ko9XJtxqaA"]'    \
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
--p2p-peer-address 172.30.1.190:9000 \
--p2p-peer-address 172.30.1.190:9001 \
--p2p-peer-address 52.199.222.137:9001 \
--p2p-peer-address 52.199.222.137:9002 \
--p2p-peer-address 52.199.222.137:9003 \
--p2p-peer-address 52.199.222.137:9004 \
--p2p-peer-address 52.199.222.137:9005 \
 2>>./bp444/bp444.log &
tail -f ./bp444/bp444.log
cleos --url http://172.30.1.190:8004 net peers


        {"name":"bp555", "pvt":"5KUKmaTzvASUGAXwMJWxJHuGfcunnrP4bBLLnDZxaLKodPFra9Z", "pub":"ACTX7RvTi1bTPDmYnRCLyCfcaEwB4G4smuLxBkdyGHDX6tfwQVEY3w"}
rm -rf bp555
mkdir bp555
nodeos --max-irreversible-block-age -1    \
--contracts-console    \
--genesis-json ./genesis.json    \
--config-dir ./bp555    \
--data-dir ./bp555    \
--chain-state-db-size-mb 1024    \
--http-server-address 172.30.1.190:8005    \
--p2p-listen-endpoint 172.30.1.190:9005    \
--max-clients 40    \
--p2p-max-nodes-per-host 40    \
--enable-stale-production    \
--producer-name bp555    \
--agent-name  "bp555 Agent"  \
--private-key '["ACTX7RvTi1bTPDmYnRCLyCfcaEwB4G4smuLxBkdyGHDX6tfwQVEY3w","5KUKmaTzvASUGAXwMJWxJHuGfcunnrP4bBLLnDZxaLKodPFra9Z"]'    \
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
--p2p-peer-address 172.30.1.190:9000 \
--p2p-peer-address 172.30.1.190:9001 \
--p2p-peer-address 52.199.222.137:9001 \
--p2p-peer-address 52.199.222.137:9002 \
--p2p-peer-address 52.199.222.137:9003 \
--p2p-peer-address 52.199.222.137:9004 \
--p2p-peer-address 52.199.222.137:9005 \
 2>>./bp555/bp555.log &
tail -f ./bp555/bp555.log
cleos --url http://172.30.1.190:8005 net peers
		