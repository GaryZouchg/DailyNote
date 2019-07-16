阿里云
47.52.33.47 网页进入控制台

创建用户
useradd -r -m -s /bin/bash me
usermod -aG sudo me

安装sshserver
sudo apt-get install openssh-server
sudo apt-get install openssh-client
service ssh start
service sshd status

生成秘钥对
ssh me@47.52.33.47
ssh-keygen -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -t rsa -b 2048  




//小飞机服务器
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

Congratulations, Shadowsocks-Python server install completed!
Your Server IP        :  47.52.33.47 
Your Server Port      :  2019 
Your Password         :  ouae2718 
Your Encryption Method:  aes-256-cfb 

Your QR Code: (For Shadowsocks Windows, OSX, Android and iOS clients)
 ss://YWVzLTI1Ni1jZmI6bWVANDcuNTIuMzMuNDc6MjAxOQ== 
Your QR Code has been saved as a PNG file path:
 /home/me/shadowsocks_python_qr.png 


ps -ef | grep ssserver
/usr/local/bin/ssserver -c /etc/shadowsocks-python/config.json -d start
