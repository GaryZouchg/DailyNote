DROP VIEW IF EXISTS view_Trades_All;	
CREATE VIEW view_Trades_All AS
    SELECT 
        *
    FROM
    (
		(
			(
				SELECT 
					'user01' AS user,action,trade_state,cust_name,passport,lend_from_acct,lend_to_acct,lending_date,lending_amount,due_date,due_interest,
					rpmt_from_acct,rpmt_to_acct,rpmt_date,rpmt_amount,rpmt_total,update_time
				FROM      Trades_01
				ORDER BY lending_date DESC , due_date ASC
			) 
			UNION 
			(
				SELECT 
					'user02' AS user,action,trade_state,cust_name,passport,lend_from_acct,lend_to_acct,lending_date,lending_amount,due_date,due_interest,
					rpmt_from_acct,rpmt_to_acct,rpmt_date,rpmt_amount,rpmt_total,update_time
				FROM  Trades_02
				ORDER BY lending_date DESC , due_date ASC
			)
		) AS Trades_All 
	);
	

