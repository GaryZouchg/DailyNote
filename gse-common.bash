

mkdir -p ~/GSE/testnet_node
cp ~/github/gsenetwork/testnet_config ~/GSE/testnet_node/
cp ~/github/gsenetwork/build/programs/gsenode  ~/GSE/testnet_node/


0dec7696fc4b4b4b36460b0e7b1565686f2ead122ea9b71dcbf34ad6254377a0
./gsenode -c testnet_config -r -p





阿里云
47.52.33.47

useradd -r -m -s /bin/bash me
usermod -aG sudo username


sudo apt-get install openssh-server
sudo apt-get install openssh-client

service ssh start
service sshd status

ssh me@47.52.33.47
ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key




//小飞机服务器
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log


47.52.33.47
2019
ouae2718
aes-256-cfb


Congratulations, Shadowsocks-Python server install completed!
Your Server IP        :  47.52.33.47 
Your Server Port      :  2019 
Your Password         :  ouae2718 
Your Encryption Method:  aes-256-cfb 

Your QR Code: (For Shadowsocks Windows, OSX, Android and iOS clients)
 ss://YWVzLTI1Ni1jZmI6bWVANDcuNTIuMzMuNDc6MjAxOQ== 
Your QR Code has been saved as a PNG file path:
 /home/me/shadowsocks_python_qr.png 


