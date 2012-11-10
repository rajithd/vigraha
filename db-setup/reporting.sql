create table event_alias (
alias_name varchar(20),
event_count int,
month_name varchar(30)
);

insert into event_alias values('Voice Call',1200,'January');
insert into event_alias values('SMS',1000,'April');
insert into event_alias values('LBS',200,'March');
insert into event_alias values('USSD',100,'November');
insert into event_alias values('GPRS',800,'December');
