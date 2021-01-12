  drop table trade_00;
  CREATE TABLE IF NOT EXISTS trade_00(
   action                VARCHAR(20) NOT NULL,
   cust_name             VARCHAR(64) NOT NULL,
   contact               VARCHAR(64) NOT NULL,
   facebook              VARCHAR(64) ,
   passport              VARCHAR(20) NOT NULL,
   cust_bank_account     VARCHAR(20) NOT NULL,
   lending_amount        int NOT NULL,
   interest              int NOT NULL,
   repayment_amount      int,
   recieve_bank_account  VARCHAR(20) ,
   lending_date          date,
   payment_due_date      date,
   actual_payment_date   date,
   trade_state           VARCHAR(20) NOT NULL,
   comment1              VARCHAR(1024),
   comment2              VARCHAR(1024),
   PRIMARY KEY ( passport,lending_date )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;