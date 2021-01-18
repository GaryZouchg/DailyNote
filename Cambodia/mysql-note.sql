--ubuntu18   mysql5.7
sudo apt mysql-server
sudo apt-get upgrade mysql-server
sudo apt-get install nmap
nmap -Pn -p3306 140.143.138.127

--启动mysql
service mysql status/start/restart/stop 
mysqladmin -uroot shutdown
mysqladmin -u root -p create TESTDB

--配置mysql
mysql -u root -p
show variables like 'secu%';
show variables like 'char%';
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
secure_file_priv ="/"
bind-address            = 0.0.0.0
character_set_database=utf8
character_set_server=utf8

mysql -u root -p
grant all privileges on *.* to 'root'@'%' identified by '********';
flush privileges;​

--创建数据库表
CREATE DATABASE IF NOT EXISTS DRMNY;
TRADE_00  TRADE_01  TRADE_02
--创建用户
CREATE USER dbadmin@'%' IDENTIFIED BY 'Cambodia0';
grant all privileges on *.* to 'dbadmin'@'%' identified by 'Cambodia0';
SHOW GRANTS FOR dbadmin;


CREATE USER user1@'%' IDENTIFIED BY 'Cambodia1';
grant all privileges on DRMNY.TRADE_01 to 'user1'@'%' identified by 'Cambodia1';
CREATE USER user2@'%' IDENTIFIED BY 'Cambodia2';
grant all privileges on DRMNY.TRADE_02 to 'user2'@'%' identified by 'Cambodia2';
commit;

--函数
str_to_date(a.i, '%m/%d/%Y')
select from date_format('2008-08-08', '%m/%d/%Y') ;
select now();
select str_to_date(a.g, '%m/%d/%Y') as date1,str_to_date(a.i, '%m/%d/%Y') as date2 from Cambodia12 a;
select current_timestamp, current_timestamp(

