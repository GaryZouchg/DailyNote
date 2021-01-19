 DROP PROCEDURE proc_TradeInsert;	
DELIMITER $$
CREATE PROCEDURE proc_TradeInsert( in fromTbl varchar(32) )
BEGIN
	declare usr     varchar(32)     ;
	declare instTbl varchar(32)     ;
	declare exeSql  varchar(2048)   ;
    
    set  usr=( SELECT user());
    set  usr=( SELECT substring_index(usr,"@",1)  );
	SET  usr=  right(usr,2) ;
	SET  instTbl= CONCAT('Trades_',usr);
    
	SELECT   fromTbl,  instTbl;
    
    SET   exeSql=
    "	
    REPLACE INTO insert_table_ (action,trade_state,cust_name,passport,out_bank_acct,cust_bank_acct,lending_date,lending_amount,due_date,due_interest,repayment_date,repayment_amount,repayment_total,repayment_acct,contact,facebook_acct,comment1,comment2,last_upd_time) 
		(SELECT 	action,	trade_state,cust_name,passport,out_bank_acct,cust_bank_acct  ,
			str_to_date(lending_date, '%m/%d/%Y') ,		lending_amount  ,
			str_to_date(due_date,     '%m/%d/%Y') ,		due_interest    ,
			CASE WHEN LENGTH(repayment_date)>5    THEN str_to_date(repayment_date, '%m/%d/%Y') 
				 ELSE str_to_date('1/1/1970', '%m/%d/%Y')  END ,
			CASE WHEN LENGTH(repayment_amount)>=1 THEN repayment_amount
				 ELSE 0                                    END ,
			CASE WHEN LENGTH(repayment_total)>=1  THEN repayment_total
				 ELSE 0                                    END ,
			repayment_acct,contact,facebook_acct,comment1,comment2,now()        
		FROM from_table_  )
	";

    SET  exeSql  = replace(exeSql,'insert_table_', instTbl);
    SET  exeSql  = replace(exeSql,'from_table_',   fromTbl);
	SELECT  instTbl, fromTbl, exeSql ;
    
END$$


call proc_TradeInsert( 'Cambodia01' );
truncate TRADE_01;

















