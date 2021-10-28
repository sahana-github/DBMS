program 1

setserveroutputon
begin
update employee1
setsalary=(1.15*salary)wheredeptno=10;
dbms_output.put_line('numberofrowsupdatedare'||sql%rowcount);
end;
/
---------------------------------------------------------------------------
program 2
begin
	update supply
	set quantity=quantity+(quantity*0.05);
	dbms_output.put_line("Rows updated="||sql%ROWCOUNT);
end;
/

------------------------------------------------------------------------------
program 3
declare 
	n number:=&n;
	j number:=&2;
	counter number:=0;
begin
	while(J<=n/2) loop
	if mod(n,j)=0 then
	dbms_output.put_line(n||'is not a prime no');
	counter=1;
	exit;
	else j:=j+1;
	end if;
	end loop;
	if counter=0 then 
	dbms_output.put_line(n||'is a prime no');
	end if
end;
/ 	




-------------------------------------------------------------------------

program 4

createtableemployee1(ssnvarchar(20),namechar(20),deptnonumber(10),salary
int,primarykey(ssn));
insertintoemployee1values(1,'pra',10,1000);
insertintoemployee1values(2,'aaa',20,2000);
insertintoemployee1values(3,'bbb',10,4000);
insertintoemployee1values(4,'cc',30,10000);
insertintoemployee1values(5,'bgg',10,2000);
select*from employee1;
setserveroutputon
declare
cursorcurisselect*from employee1;
rowsemployee1%rowtype;
tint;
begin
opencur;
t:=&t1;
loop
fetchcurintorows;
exitwhencur%notfound;
ifrows.deptno=t
then
dbms_output.put_line('thessnandnamesare'||rows.ssn||','||rows.name);
endif;
endloop;
closecur;
end;
/

------------------------------------------------------------------
program 5

declare
anumber;
bnumber;
cnumber;
nnumber;
inumber;
begin
n:=8;
a:=0;
b:=1;
dbms_output.put_line(a);
dbms_output.put_line(b);
foriin1..n-2
loop
c:=a+b;
dbms_output.put_line(c);
a:=b;
b:=c;
endloop;
end;
/