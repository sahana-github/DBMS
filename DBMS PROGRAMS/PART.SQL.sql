create table part(
 pno number(10) primary key,
 pname varchar(20),
 colour varchar(20)
);


SQL> select * from part;

       PNO PNAME		COLOUR
---------- -------------------- --------------------
	 1 plug 		pink
	 2 bolt 		blue




create table supplier(
 sno number(10) primary key,
 sname varchar(20),
 address varchar(20)
);


SQL> select * from supplier;

       SNO SNAME		ADDRESS
---------- -------------------- --------------------
	10 Anoop		udupi
	15 Bharath		Mangalore
	20 Ram			Banglore


create table supply(
 pno number(10),
 sno number(10),
 quantity varchar(20),
 primary key(pno,sno),
 foreign key(pno) references part(pno)on delete cascade,
 foreign key(sno) references supplier(sno)on delete cascade
);


SQL> select * from supply;

       PNO	  SNO QUANTITY
---------- ---------- --------------------
	 1	   10 50
	 2	   10 30
	 1	   15 70
	 1	   20 55
	 2	   20 65



insert into part values(&pno,'&pname','&colour');
insert into supplier values(&sno,'&sname','&address');
insert into supply values(&pno,&sno,'&quality');



Q:

1)
SQL> select pno from supply
      where sno IN(select sno from supplier 
                      where INITCAP(sname)='Ram');

       PNO
----------
	 1
	 2


2)

SQL> select sname,pname from supplier,supply,part
  2     where INITCAP(pname)='Bolt' AND supply.sno=supplier.sno AND part.pno=supply.pno;

SNAME		     PNAME
-------------------- --------------------
Anoop		     bolt
Ram		     bolt


3)
SQL> select * from part;

       PNO PNAME		COLOUR
---------- -------------------- --------------------
	 1 plug 		pink
	 2 bolt 		blue

SQL> delete from part where INITCAP(colour)='Pink';

1 row deleted.

SQL> select * from part;

       PNO PNAME		COLOUR
---------- -------------------- --------------------
	 2 bolt 