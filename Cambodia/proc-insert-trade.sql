

--procedure GreetWorld
CREATE PROCEDURE GreetWorld( ) SELECT CONCAT(@greeting,' World') as greeting;  
SET @greeting='Hello';  
CALL GreetWorld( );   
 
drop PROCEDURE GreetWorld;
	
	
	
select * from mysql.proc where db='DRMNY';
--
DROP PROCEDURE GreetWorld;	
show procedure status where db='DRMNY';

--变量名做表名
DECLARE temp1 varchar(30);
DECLARE temp2 int;
set temp1=m_tableName;
set temp2=m_maxCount;
set @sqlStr=CONCAT('select * from ',temp1,' limit ',temp2);
PREPARE stmt from @sqlStr;
EXECUTE stmt;

--变量名做表名 


--procedure insert into trade_01
DROP PROCEDURE proc_TradeInsert;	
delimiter $$
CREATE PROCEDURE proc_TradeInsert( in insertDate varchar(8) )
BEGIN
	select insertDate;
	set fromTbl= CONCAT('Cambodia','02');
	insert into TRADE_01 (action,trade_state,cust_name,passport,out_bank_acct,cust_bank_acct,lending_date,lending_amount,due_date,due_interest,repayment_date,repayment_amount,repayment_total,repayment_acct,contact,facebook_acct,comment1,comment2) 
	select 
		action          ,
		trade_state     ,
		cust_name       ,
		passport        ,
		out_bank_acct   ,
		cust_bank_acct  ,
		str_to_date(lending_date, '%m/%d/%Y') ,
		lending_amount  ,
		str_to_date(due_date, '%m/%d/%Y') ,
		due_interest    ,
		case when length(repayment_date)>5 then str_to_date(repayment_date, '%m/%d/%Y') 
			 else str_to_date('1/1/1970', '%m/%d/%Y')  end ,
		case when length(repayment_amount)>=1 then repayment_amount
			 else 0  end ,
		case when length(repayment_total)>=1 then repayment_total
			 else 0  end ,
		repayment_acct  ,
		contact         ,
		facebook_acct   ,
		comment1        ,
		comment2        
	from Cambodia01;
END$$
call proc_TradeInsert(20200101);
truncate TRADE_01;

















