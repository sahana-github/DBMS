1.boat

create table boat
(
bid varchar(6)not null,
bname varchar(20),
colour varchar(10),
primary key(bid)
);

Table created.

-->INSERT

insert into boat
values('01','abc','red');

1 row created.

insert into boat
values('02','xyz','pink');

1 row created.

##select * from boat;


BID    BNAME		    COLOUR
------ -------------------- ----------
01     abc		    red
02     xyz		    pink



2.sailor

create table sailor
(
sid varchar(6)not null,
sname varchar(20),
age varchar(3),
rating varchar(2),
primary key(sid)
);

Table created.

-->INSERT

insert into sailor
values('10','ram','30','5');

1 row created.

insert into sailor
values('20','ravi','25','4');

1 row created.

## select * from sailor;

SID    SNAME		    AGE RA
------ -------------------- --- --
10     ram		    30	5
20     ravi		    25	4


3.reserves

create table reserves
(
bid varchar(6),
sid varchar(6),
day varchar(10),
foreign key(bid)references boat(bid)on delete cascade,
foreign key(sid)references sailor(sid)on delete cascade
);

Table created.

-->INSERT

insert into reserves
values('01','20','monday');

1 row created.

insert into reserves
values('02','10','tuesday');

1 row created.

## select * from reserves;

BID    SID    DAY
------ ------ ----------
01     20     monday
02     10     tuesday




