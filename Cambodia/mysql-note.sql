sudo apt mysql-server
sudo apt-get upgrade mysql-server

mysqld --console

nmap -Pn -p3306 140.143.138.127
 
mysqladmin -uroot shutdown

mysql -u root -p
show variables like 'secu%';
show variables like 'char%';

mysqladmin -u root -p create TESTDB

sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
secure_file_priv ="/"
bind-address            = 0.0.0.0

character-set-database=utf8
character-set-server=utf8

show variables like 'char%';





 grant all privileges on *.* to 'root'@'%' identified by 'Ouae0902';
flush privileges;​









