drop table Trades_00;
CREATE TABLE IF NOT EXISTS Trades_00(
	action             VARCHAR(10)  NOT NULL  COMMENT '交易操作'    ,
	trade_state        VARCHAR(10)  NOT NULL  COMMENT '交易状态'    ,
	cust_name          VARCHAR(64)  NOT NULL  COMMENT '客户姓名'    ,
	passport           VARCHAR(20)  NOT NULL  COMMENT '身份证/护照' ,
	out_bank_acct      VARCHAR(20)  NOT NULL  COMMENT '放款账号'    ,
	cust_bank_acct     VARCHAR(20)  NOT NULL  COMMENT '客户收款账户',
	lending_date       DATE         NOT NULL  COMMENT '借款日期',
	lending_amount     INT          NOT NULL  COMMENT '借款金额',
	due_date           DATE         NOT NULL  COMMENT '到期日',
	due_interest       INT          NOT NULL  COMMENT '应还利息', 
	repayment_date     DATE                   COMMENT '实际还款日期',
	repayment_amount   INT                    COMMENT '借款金额',
	repayment_total    INT                    COMMENT '借款金额',
	repayment_acct     VARCHAR(20)            COMMENT '还入账户',
	contact            VARCHAR(20)            COMMENT '联系方式',
	facebook_acct      VARCHAR(20)            COMMENT 'FB账号',
	comment1           VARCHAR(1024)          COMMENT '备注1',
	comment2           VARCHAR(1024)          COMMENT '备注2',
	last_upd_time      DATETIME               COMMENT '最近的更新时间',
	PRIMARY KEY ( passport,lending_date )
)ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT '交易表00';

CREATE INDEX TRADE_00_idx ON Trades_00 (repayment_date,cust_name);

CREATE  TABLE IF NOT EXISTS Trades_01 (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_02 (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_03 (LIKE Trades_00)
CREATE  TABLE IF NOT EXISTS Trades_04 (LIKE Trades_00)
CREATE  TABLE IF NOT EXISTS Trades_05 (LIKE Trades_00)
CREATE  TABLE IF NOT EXISTS Trades_06 (LIKE Trades_00)
CREATE  TABLE IF NOT EXISTS Trades_07 (LIKE Trades_00)
CREATE  TABLE IF NOT EXISTS Trades_08 (LIKE Trades_00)
CREATE  TABLE IF NOT EXISTS Trades_09 (LIKE Trades_00)

commit;
	
	
	
	
	
	
	
 	
