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
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '********';
REVOKE ALL  ON *.*  FROM 'root'@'%';
flush PRIVILEGES;​

--创建数据库表  PETTYLOAN  DRMNY MICROLOAN
CREATE DATABASE IF NOT EXISTS PETTYLOAN;
DROP database db1;
Trades_00  Trades_01  Trades_02 Trades_03  Trades_04  Trades_05  Trades_06  Trades_08 Trades_09
--创建用户  sys dbadmin boss
CREATE USER dbadmin@'%' IDENTIFIED BY 'Cambodia0)';
GRANT ALL PRIVILEGES ON *.* TO 'dbadmin'@'%' IDENTIFIED BY 'Cambodia0)';
CREATE USER boss@'%' IDENTIFIED BY 'Cambodia0)';
GRANT ALL PRIVILEGES ON *.* TO 'boss'@'%' IDENTIFIED BY 'Cambodia0)';
SHOW GRANTS FOR boss;


CREATE USER user01@'%' IDENTIFIED BY 'Cambodia01';
CREATE USER user02@'%' IDENTIFIED BY 'Cambodia02';
GRANT SELECT,INSERT,UPDATE,DELETE ON PETTYLOAN.Trades_01 TO 'user01'@'%' IDENTIFIED BY 'Cambodia01';
GRANT CREATE         ON PETTYLOAN.*         TO 'user01'@'%' IDENTIFIED BY 'Cambodia01';

GRANT ALL PRIVILEGES ON PETTYLOAN.Trades_02 TO 'user02'@'%' IDENTIFIED BY 'Cambodia02';
commit;
DROP USER user1
--函数
str_to_date(a.i, '%m/%d/%Y')
select from date_format('2008-08-08', '%m/%d/%Y') ;
select now();
select str_to_date(a.g, '%m/%d/%Y') as date1,str_to_date(a.i, '%m/%d/%Y') as date2 from Cambodia12 a;
select current_timestamp, current_timestamp(

