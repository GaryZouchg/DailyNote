

--procedure GreetWorld
CREATE PROCEDURE GreetWorld( ) SELECT CONCAT(@greeting,' World') as greeting;  
SET @greeting='Hello';  
 
drop PROCEDURE GreetWorld;
select * from mysql.proc where db='DRMNY';
show procedure status where db='DRMNY';
show create procedure  proc_TradeInsert;
--变量名做表名
DECLARE temp1 varchar(30);
DECLARE temp2 int;
set temp1=m_tableName;
set temp2=m_maxCount;
set @sqlStr=CONCAT('select * from ',temp1,' limit ',temp2);
PREPARE stmt from @sqlStr;
EXECUTE stmt;

--procedure 权限管理； 
GRANT ALL   ON *.*                           TO user1@'%'  IDENTIFIED BY 'Cambodia1';
	--要重新连接
GRANT SELECT   ON mysql.proc                        TO 'user1'@'%';
GRANT EXECUTE  ON PROCEDURE DRMNY.proc_TradeInsert  TO 'user1'@'%';
flush PRIVILEGES;

revoke all on *.* from user1@'%'
GRANT EXECUTE  ON DRMNY.*                           TO 'user1'@'%';  --  excute  all procedure

--procedure invoke















