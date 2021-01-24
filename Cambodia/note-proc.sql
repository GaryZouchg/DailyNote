

--procedure GreetWorld
CREATE PROCEDURE GreetWorld( ) SELECT CONCAT(@greeting,' World') as greeting;  
SET @greeting='Hello';  
 
drop PROCEDURE GreetWorld;
select * from mysql.proc where db='PETTYLOAN';
show procedure status    where db='PETTYLOAN';
show create procedure  proc_TradeInsert;
--变量名做表名
DECLARE temp1 varchar(30);
DECLARE temp2 int;
set temp1=m_tableName;
set temp2=m_maxCount;
set @sqlStr=CONCAT('select * from ',temp1,' limit ',temp2);
PREPARE stmt from @sqlStr;
EXECUTE stmt;

--procedure 查看和执行存储过程的权限； 
GRANT SELECT   ON mysql.proc                            TO 'user01'@'%' ;
GRANT EXECUTE  ON PROCEDURE PETTYLOAN.proc_TradeInsert  TO 'user01'@'%' ;
flush PRIVILEGES;

GRANT SELECT   ON mysql.proc                            TO 'user02'@'%' ;
GRANT EXECUTE  ON PROCEDURE PETTYLOAN.proc_TradeInsert  TO 'user02'@'%' ;
flush PRIVILEGES;


revoke all on *.* from user01@'%'
GRANT EXECUTE  ON PETTYLOAN.*                           TO 'user01'@'%';  --  excute  all procedure

--procedure invoke
sudo mysql -uroot
source /home/ubuntu/github/DailyNote/Cambodia/grant.sql
sudo mysql  -DPETTYLOAN</home/ubuntu/github/DailyNote/Cambodia/grant.sql


sed -i 's/2020/2021/g' /home/ubuntu/github/DailyNote/Cambodia/grant.sql
sed -i 's/user01/user02/g' /home/ubuntu/github/DailyNote/Cambodia/grant.sql











