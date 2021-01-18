

--procedure GreetWorld
CREATE PROCEDURE GreetWorld( ) SELECT CONCAT(@greeting,' World') as greeting;  
SET @greeting='Hello';  
CALL GreetWorld( );   
 
drop PROCEDURE GreetWorld;
	
	
	
select * from mysql.proc where db='DRMNY';
--
DROP PROCEDURE GreetWorld;	
show procedure status where db='DRMNY';


--procedure insert into trade_01
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
	str_to_date(repayment_date, '%m/%d/%Y') ,
	repayment_amount,
	repayment_total ,
	repayment_acct  ,
	contact         ,
	facebook_acct   ,
	comment1        ,
	comment2        , 
from Cambodia01



















