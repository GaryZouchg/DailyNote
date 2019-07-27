
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



#confluence install

wget https://product-downloads.atlassian.com/software/confluence/downloads/atlassian-confluence-6.9.0-x64.bin
chmod +x atlassian-confluence-6.9.0-x64.bin
sudo ./ atlassian-confluence-6.9.0-x64.bin
http://localhost:8090
http://47.52.33.47:8090
http://139.155.135.91:8090

wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz
http://47.52.33.47:8090/setup/setupdbtype-start.action
cp *.jar /opt/atlassian/confluence/confluence/WEB-INF/lib

remove confluence
 /opt/atlassian/confluence/uninstall
 rm -rf /var/atlassian/confluence

https://raw.githubusercontent.com/Huangdongrong/soft-and-jar-repository/master/confluenceInstall.rar



#docker mysql
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


https://hub.docker.com/_/mysql
sudo docker run -p 3306:3306 \
            --name mysql \
            -v /home/me/mysql/conf:/etc/mysql/conf.d \
            -v /home/me/mysql/data:/var/lib/mysql \
            -e MYSQL_ROOT_PASSWORD=123456 \
            -d mysql:5.7\
            --character-set-server=utf8 \
            --collation-server=utf8_bin




set character_set_database=utf8;
set character_set_server=utf8;


select @@global.tx_isolation,@@tx_isolation;

mysql> set global transaction isolation level read committed; //全局的

mysql> set session transaction isolation level read committed; //当前会话


重启
docker ps 
docker kill CONTAINER-ID
docker start  CONTAINER_ID 
sudo vim /etc/mysql/conf.d/mysql.cnf


backup file 
139.155.143.215 /root/wikibk/wiki.db.tar.gz  /root/wikibk/attachments.tar.gz
scp root@139.155.143.215:/root/wikibk/wiki.db.tar.gz ./
scp root@139.155.143.215:/root/wikibk/attachments.tar.gz ./

https://note.youdao.com/ynoteshare1/index.html?id=f6a3df6469cd803cbfde103202e53a89&type=note



#连接数据库
mysql -h 47.52.33.47 -u root -p123456
#创建数据库，然后去前端配置数据库
create database confluence;



#创建同名表
use confluence;

CREATE TABLE TABLE_NAME(a int)ENGINE=InnoDB;





