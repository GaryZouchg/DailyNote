
useradd -r -m -s /bin/bash me
usermod -aG wheel zou


scp ~/Downloads/jdk-8u221-linux-x64.tar.gz zou@139.155.135.91:/home/zou/
ssh zou@139.155.135.91


https://www.atlassian.com/software/confluence/download


安装java
tar -xzvf jdk-8u221-linux-x64.tar.gz 
sudo -i
cd /usr
mkdir java
cp -pr /home/zou/jdk1.8.0_221 /usr/java
ln -s /usr/java/jdk1.8.0_221/ /usr/java/jdk
vim /etc/profile
JAVA_HOME=/usr/java/jdk1.8.0_221
CLASSPATH=$JAVA_HOME/lib/
PATH=$PATH:$JAVA_HOME/bin
export PATH JAVA_HOME CLASSPATH

source /etc/profile
java -version
whereis java

安装mysql
cp /home/zou/mysql-5.7.26-linux-glibc2.12-x86_64.tar.gz  /usr/local/
tar -xzvf mysql-5.7.26-linux-glibc2.12-x86_64.tar.gz 

groupadd mysql
useradd -r -g mysql -s /bin/false mysql
cd /usr/local
tar zxvf /path/to/mysql-5.7.26-linux-glibc2.12-x86_64.tar.gz
ln -s mysql-5.7.26-linux-glibc2.12-x86_64 mysql
cd mysql
mkdir data
chown mysql:mysql data
chmod 750 data
bin/mysqld --initialize --user=mysql 
root dkelHWGwY3&t
bin/mysql_ssl_rsa_setup              
bin/mysqld_safe --user=mysql &

# Next command is optional
cp support-files/mysql.server /etc/init.d/mysql.server
export PATH=$PATH:/usr/local/mysql/bin

/usr/local/mysql5.7/bin/mysql -u root -p
alter user 'root'@'localhost' identified by 'Gse_2019';  
use mysql
update user set authentication_string=password('Gse_2019') where user='root';

CREATE DATABASE confluence CHARACTER SET utf8 COLLATE utf8_bin;
GRANT ALL PRIVILEGES ON confluence.* TO 'confluence1'@'localhost' IDENTIFIED BY 'Gse_2019';
GRANT ALL PRIVILEGES ON confluence.* TO 'confluence'@'localhost' IDENTIFIED BY 'Gse_2019';

flush privileges;



#

wget https://product-downloads.atlassian.com/software/confluence/downloads/atlassian-confluence-6.9.0-x64.bin
chmod +x atlassian-confluence-6.9.0-x64.bin
sudo ./ atlassian-confluence-6.9.0-x64.bin
http://localhost:8090
http://47.52.33.47:8090
http://139.155.135.91:8090

http://47.52.33.47:8090/uninstall
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz

cp *.jar /home/me/atlassian/confluence/confluence/WEB-INF/lib



AAABMA0ODAoPeNptkE1PAjEQhu/9FU286KEE6hoWkibi7h7Q/UBBvXipdXZpstuSfhDx11tYiWg4N
Jl03vedZ+biFT7wvW8xjTClUxpPoxgn6QrT4WiCUrDCyI2TWrFEq7r1oATgyyWYLZirtynOtrz1f
C9AiYFDkXIHbG8nwzGhNygYHReu5B2whpvdl/Zi3dw2HZftQOgOiZA8CAq5BeaMh/5j6bhxYFjNW
wvHkKwIpvMpvyQnIbkUoCysdhs4zE+qosiekvksR23fegFj9x6KQrRyoHjYMPvcSLM7WSQmNEKVa
biStp+ha61Rf4d5yu7GDyvyOKsoyapZQRZxOUHLrGThkXx0PRlHlA7RD03Q5/P0b+tAW/ruHUxVP
9sAxcjoaDiPs/BGrLmF//f+BlVBmSgwLQIUGzAqHGw15SO0F0k/nkTK4P+TOEcCFQCC+gWeKiT/S
q5gjSxHrcXf9PMGpA==X02fb

sudo apt-get remove docker docker-engine docker.io containerd runc

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


udo apt-key fingerprint 0EBFCD88


docker search mysql
docker pull mysql:5.7

sudo docker run  -p 3306:3306 \
            --name mymysql \
            -v $PWD/conf:/etc/mysql/conf.d \
            -v $PWD/logs:/logs \
            -v $PWD/data:/var/lib/mysql \
            -e MYSQL_ROOT_PASSWORD=123456 \
            -d mysql:5.7

e689c66e85f877c492c8ecde2f8a9a84f93f50860a977a90448b1da335b986c7

docker




docker run  --name mysql 
            -d -v /home/black/mysql/conf:/etc/mysql/conf.d 
            -v /home/black/mysql/data:/var/lib/mysql 
            -p 3306:3306 
            -dmysql:5.7.18