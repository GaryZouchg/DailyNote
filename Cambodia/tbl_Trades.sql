DROP TABLE Trades_00;
CREATE TABLE IF NOT EXISTS Trades_00(
	action             VARCHAR(10)  NOT NULL  COMMENT '交易操作'    ,
	trade_state        VARCHAR(10)  NOT NULL  COMMENT '交易状态'    ,
	cust_name          VARCHAR(64)  NOT NULL  COMMENT '客户姓名'    ,
	passport           VARCHAR(20)  NOT NULL  COMMENT '身份证/护照' ,
	lend_from_acct     VARCHAR(20)  NOT NULL  COMMENT '放款账号'    ,
	lend_to_acct       VARCHAR(20)  NOT NULL  COMMENT '客户收款账户',
	lending_date       DATE         NOT NULL  COMMENT '借款日期'    ,
	lending_amount     INT          NOT NULL  COMMENT '借款金额'    ,
	due_date           DATE         NOT NULL  COMMENT '到期日'      ,
	due_interest       INT          NOT NULL  COMMENT '应还利息'    , 
	rpmt_from_acct     VARCHAR(20)            COMMENT '客户还款账户',
	rpmt_to_acct       VARCHAR(20)            COMMENT '还入账户'    ,
	rpmt_date          DATE                   COMMENT '实际还款日期',
	rpmt_amount        INT                    COMMENT '借款金额'    ,
	rpmt_total         INT                    COMMENT '借款金额'    ,
	contact            VARCHAR(20)            COMMENT '联系方式'    ,
	facebook_acct      VARCHAR(20)            COMMENT 'FB账号'      ,
	comment1           VARCHAR(1024)          COMMENT '备注1'       ,
	comment2           VARCHAR(1024)          COMMENT '备注2'       ,
	update_time        DATETIME               COMMENT '更新时间'    ,
	PRIMARY KEY ( passport,lending_date )
)ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT '交易表00';

CREATE INDEX TRADE_00_idx ON Trades_00 (rpmt_date,cust_name);

DROP TABLE Trades_in;
DROP TABLE Trades_01;
DROP TABLE Trades_02;
DROP TABLE Trades_03;
DROP TABLE Trades_04;
DROP TABLE Trades_05;
DROP TABLE Trades_06;
DROP TABLE Trades_07;
DROP TABLE Trades_08;
DROP TABLE Trades_09;


CREATE  TABLE IF NOT EXISTS Trades_in (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_01 (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_02 (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_03 (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_04 (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_05 (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_06 (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_07 (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_08 (LIKE Trades_00);
CREATE  TABLE IF NOT EXISTS Trades_09 (LIKE Trades_00);


CREATE INDEX TRADE_in_idx ON Trades_in (rpmt_date,cust_name);
CREATE INDEX TRADE_01_idx ON Trades_01 (rpmt_date,cust_name);
CREATE INDEX TRADE_02_idx ON Trades_02 (rpmt_date,cust_name);
CREATE INDEX TRADE_03_idx ON Trades_03 (rpmt_date,cust_name);
CREATE INDEX TRADE_04_idx ON Trades_04 (rpmt_date,cust_name);
CREATE INDEX TRADE_05_idx ON Trades_05 (rpmt_date,cust_name);
CREATE INDEX TRADE_06_idx ON Trades_06 (rpmt_date,cust_name);
CREATE INDEX TRADE_07_idx ON Trades_07 (rpmt_date,cust_name);
CREATE INDEX TRADE_08_idx ON Trades_08 (rpmt_date,cust_name);
CREATE INDEX TRADE_09_idx ON Trades_09 (rpmt_date,cust_name);

commit;
	
	
	
	
	
	
	
 	
