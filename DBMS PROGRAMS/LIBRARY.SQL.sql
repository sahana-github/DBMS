create table partt(
 pno number(10) primary key NOT NULL,
 pname varchar(20),
 colour varchar(20)
);


SQL> select * from partt;

       PNO PNAME		COLOUR
---------- -------------------- --------------------
	 1 abc			red
	 2 def			green
	 3 lmn			blue



create table warehouse(
 wno varchar(10) primary key NOT NULL,
 wname varchar(20),
 city varchar(10)
);

SQL> select * from warehouse;

WNO	   WNAME		CITY
---------- -------------------- ----------
10	   AA			kumta
20	   bb			mumbai
30	   cc			bangalore
40	   dd			udupi
50	   ee			karwar



create table shipment(
 pno number(10),
 wno varchar(10),
 quantity varchar(20),
 datee date, 
 primary key(pno,wno),
 foreign key(pno) references partt(pno)on delete cascade,
 foreign key(wno) references warehouse(wno)on delete cascade
);


SQL> select * from shipment;

       PNO WNO	      QUANTITY		   DATEE
---------- ---------- -------------------- ---------
	 1 20	      300		   28-FEB-13
	 2 30	      400		   30-JAN-13
	 3 10	      00		   31-MAR-13


insert into partt values(&pno,'&pname','&colour');

insert into warehouse values(&pno,'&wname','&city');


Q:

1:
select wname from warehouse
  2        where wno IN (select wno from shipment
  3                        where pno=(select pno from partt
  4                                     where INITCAP(colour)='Red'));

WNAME
--------------------
bb

2:
SQL> select pno,wname from shipment s join warehouse w 
  2   on(s.wno=w.wno);

       PNO WNAME
---------- --------------------
	 1 bb
	 2 cc
	 3 AA

3:


SQL> select count(pno),wno from shipment
  2   group by wno;

COUNT(PNO) WNO
---------- ----------
	 1 20
	 1 10
	 1 30