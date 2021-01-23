CREATE VIEW view_Trades_All AS
select * from(
    SELECT 
		'user01' AS user,
		action          ,
		trade_state     ,
		cust_name       ,
		passport        ,
		lend_from_acct  ,
		lend_to_acct    ,
		lending_date    ,
		lending_amount  ,
		due_date        ,
		due_interest    ,
		rpmt_from_acct  ,
		rpmt_to_acct    ,
		rpmt_date       ,
		rpmt_amount     ,
		rpmt_total      
    FROM
        Trades_01 t1
	UNION
    SELECT 
		'user02' AS user,
		action          ,
		trade_state     ,
		cust_name       ,
		passport        ,
		lend_from_acct  ,
		lend_to_acct    ,
		lending_date    ,
		lending_amount  ,
		due_date        ,
		due_interest    ,
		rpmt_from_acct  ,
		rpmt_to_acct    ,
		rpmt_date       ,
		rpmt_amount     ,
		rpmt_total      
    FROM
        Trades_02 t2
)
	ORDER BY lending_date DESC , due_date ASC ;  
	
	
	action         ,
	trade_state    ,
	cust_name      ,
	passport       ,
	lend_from_acct ,
	lend_to_acct   ,
	lending_date   ,
	lending_amount ,
	due_date       ,
	due_interest   , 
	rpmt_from_acct ,
	rpmt_to_acct   ,
	rpmt_date      ,
	rpmt_amount    ,
	rpmt_total     ,
