DROP PROCEDURE IF EXISTS proc_TradeInsert;	
DELIMITER $$
CREATE PROCEDURE proc_TradeInsert( in strDate varchar(32) )
BEGIN
	declare usr           varchar(32)     ;	
	declare usrSuffix     varchar(32)     ;
	declare instTbl       varchar(32)     ;
	declare fromTbl       varchar(32)     ;
	declare exeSql        varchar(2048)   ;
    
    set  usr=( SELECT user());
    set  usr=( SELECT substring_index(usr,"@",1)  );
	#SET  usrSuffix=  right(usr,2) ;
	SET  instTbl= CONCAT('Trades_',right(usr,2));
	SET  fromTbl= CONCAT(usr      ,'_');
	SET  fromTbl= CONCAT(fromTbl  ,strDate);
    
	#action,trade_state,cust_name,passport,lend_from_acct,lend_to_acct,lending_date,lending_amount,due_date,due_interest,rpmt_from_acct,rpmt_to_acct,rpmt_date,rpmt_amount,rpmt_total,contact,facebook_acct,comment1,comment2,update_time   
    SET   exeSql=
    "	
    REPLACE INTO insert_table_ (action,trade_state,cust_name,passport,lend_from_acct,lend_to_acct,lending_date,lending_amount,due_date,due_interest,rpmt_from_acct,rpmt_to_acct,rpmt_date,rpmt_amount,rpmt_total,contact,facebook_acct,comment1,comment2,update_time) 
		(SELECT 	
			action,trade_state,cust_name,passport,lend_from_acct,lend_to_acct,
			str_to_date(lending_date, '%m/%d/%Y') ,		lending_amount  ,
			str_to_date(due_date,     '%m/%d/%Y') ,		due_interest    ,
			rpmt_from_acct,rpmt_to_acct,
			CASE WHEN LENGTH(rpmt_date)>5 THEN str_to_date(rpmt_date, '%m/%d/%Y') 
				 ELSE null  END ,
			CASE WHEN LENGTH(rpmt_amount)>=1   THEN rpmt_amount
				 ELSE null  END ,
			CASE WHEN LENGTH(rpmt_total)>=1    THEN rpmt_total
				 ELSE null  END ,
			contact,facebook_acct,comment1,comment2,now()        
		FROM from_table_  )	";

    SET  exeSql  = replace(exeSql,'insert_table_', instTbl);
    SET  exeSql  = replace(exeSql,'from_table_',   fromTbl);
	SET  exeSql  = CONCAT(exeSql,';');	

	SELECT  instTbl, fromTbl, exeSql ;
	
	set @stmtSql = exeSql;
	PREPARE stmt FROM @stmtSql;   
    EXECUTE stmt              ;         
    DEALLOCATE PREPARE stmt   ;
	   
END$$


call proc_TradeInsert( '20201225' );
truncate Trades_01;

