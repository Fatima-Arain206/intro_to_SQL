CREATE TABLE dbo.ledger_TABLE_(
    transaction_id int primary key identity,
    accountnumber varchar(20) not null,
    transaction_type varchar(20) not null,
    amount decimal(10,2) not null
) WITH ( LEDGER = ON(
APPEND_ONLY=ON
)
);

