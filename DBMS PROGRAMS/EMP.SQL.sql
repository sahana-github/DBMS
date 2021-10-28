create table emp
(
ssn varchar(6),
name varchar(20),
deptno int,
primary key(ssn));


create table assign
(
usn varchar(6),
projectno varchar(10),
foreign key(usn)references emp(ssn),
foreign key(projectno)references pro(projectno)
);



create table pro
(
projectno varchar(10),
projectarea varchar(10),
primary key(projectno));

INSERTION:

SQL> insert into emp values(&ssn,'&name',&deptno);
Enter value for ssn: 01
Enter value for name: abc
Enter value for deptno: 10
old   1: insert into emp values(&ssn,'&name',&deptno)
new   1: insert into emp values(01,'abc',10)

1 row created.





QUERIES:

1--> SQL> select count(ssn),deptno from emp group by deptno;

COUNT(SSN)     DEPTNO
---------- ----------
	 1	   30
	 1	   20
	 1	   40
	 1	   10



2--> SQL> select ssn from emp where ssn=(select usn from assign where projectno=(select projectno from pro  where projectarea='database'));

SSN
------
1

3--> SQL> update assignset projectno=200 where usn=3;

1 row updated.

SQL> select * from assign;

USN    PROJECTNO
------ ----------
1      100
2      200
3      200
1      200



PLSQL

BEGIN
  update emp set salary=(1.15*salary)
   where dept=10;
  dbms_output.put_line('number of rows updated are' || sql%rowcount);
END; 
/