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
	
select * from view_Trades_All a where a.action ='新建交易' and a.lending_date=str_to_date('12/25/2020', '%m/%d/%Y');

#--用户放款
select a.user as 用户,a.lending_date as 出借日期 ,sum(a.lending_amount) as 放款总额 ,sum(a.due_interest) as 到期利息 ,count(*) as 交易单数 from view_Trades_All a 
#where a.action ='新建交易' #and a.lending_date=str_to_date('12/25/2020', '%m/%d/%Y')
group by a.user , a.lending_date 
#having a.lending_date=str_to_date('12/25/2020', '%m/%d/%Y')
 order by a.lending_date desc, user asc;

select action ,date, sum(amount), sum(interest), sum(cnt)
from (
select  a.user, a.action, a.lend_from_acct, a.lending_date  as date, sum(a.lending_amount) as amount ,sum(a.due_interest) as interest,count(*) as cnt  from view_Trades_All a 
where a.rpmt_date is null
group by a.user,a.action, a.lend_from_acct, a.lending_date   
union
select  a.user, a.action, a.rpmt_to_acct,   a.rpmt_date     as date, sum(a.lending_amount) as amount ,sum(a.due_interest) as interest,count(*) as cnt from view_Trades_All a 
where a.rpmt_date is not null
group by a.user,a.action, a.rpmt_to_acct,    a.rpmt_date 
) as group_trade 
group by action ,date 
order by date desc;


#--银行卡放款
select '今日放款',a.lend_from_acct as 放款卡号,a.lending_date as 放款日期 , sum(a.lending_amount) as 放款总额 ,count(*) as 交易单数 from view_Trades_All a 
#where a.action ='新建交易' and a.lending_date=str_to_date('12/25/2020', '%m/%d/%Y')
group by a.lend_from_acct, a.lending_date  
order by a.lending_date desc, a.lend_from_acct asc;

#--银行卡 收款
select a.action, a.rpmt_to_acct as 收款卡号,a.rpmt_date as 收款日期 , sum(a.rpmt_amount) as 收款总额 ,count(*) as 交易单数 from view_Trades_All a 
#where a.action ='新建交易' and a.lending_date=str_to_date('12/25/2020', '%m/%d/%Y')
group by  a.action, a.rpmt_to_acct, a.rpmt_date  
order by a.rpmt_date desc, a.rpmt_to_acct asc;

#-- 逾期
select "无卡号" ,a.due_date as 收款日期 , sum(a.lending_amount) as 放款总额 ,count(*) as 交易单数 from view_Trades_All a 
where a.trade_state ='逾期中' or a.rpmt_total<(a.lending_amount+a.due_interest)
group by a.due_date
order by a.due_date desc;

#续期还款  部分还款

select "无卡号" ,a.due_date as 收款日期 , sum(a.lending_amount) as 放款总额 ,count(*) as 交易单数 from view_Trades_All a 
where  a.action ='续期还款' ora.action ='部分还款' 
group by a.due_date
order by a.due_date desc;



