use mydb;
create table if not exists employee
(
emp_id int primary key auto_increment,
emp_name varchar(50) not null, checksalary int not null, p_id int, foreign key(p_id) references project (proj_id)
);
create table if not exists project 
(
proj_id int primary key auto_increment,
proj_name varchar(50) not null,
 client_name varchar(50) not null,
 foreign key(proj_id) references employee(p_id)
);

insert into employee values(1, "Abhijit", 2000, 1), (2, "Bijoy", 3000, 1), (3, "Tharun", 4000, 2), (4, "Rahul", 4500, 3), (5, "Namratha", 5000, 2);
insert into project values  (4, "Merc","Damn!");
insert into project values(1, "Amazon", "Sam"), (2, "OCI", "Ram"), (3, "Benz", "Pam");

select * from employee;
select * from project;

select checksalary from employee group by checksalary having count(checksalary)>=1 order by checksalary;
DROP TABLE Employees;

CREATE TABLE Employees (
id int auto_increment PRIMARY KEY,
name VARCHAR(15) not null ,
salary int not null );

INSERT INTO Employees (name , salary ) VALUES
('rahul' ,50000),
('Carine' , 25000),
('Catherine' , 35000),
('Abhijit' , 15000),
('Ankit', 50000),
('bijoy' , 15000),
('tom' , 35000),
('olaf' , 25000);

select salary, count(salary) from Employees where salary>25000 group by salary having count(salary)>=2 order by salary;

alter table Employees add age int not null default 10;
select * from Employees;

alter table Employees modify column age varchar(20) not null default "ten";
insert into Employees values(10, 'Subendu', 30000, 'Thirty');

select * from employees;
alter table Employees drop column age;
drop database abhij_test;
drop database classicmodels;
select * from Employees;
use assignmentone;
select * from books;



-- STORED PROCEDURES 
use mydb;

select * from Employees;

 -- DELIMITER $ 
 -- create procedure mynewprocedure()
-- begin
-- select * from Employees;
-- end$
CALL mynewprocedure();

DELIMITER $
create procedure sqlinprocedure(IN passedSalary int)
begin
select name, salary from employees where salary = passedSalary;

end $

call sqlinprocedure(30000);


delimiter $$
create procedure myoutprocedure(out sums int)
begin
select sum(salary) into sums from Employees;

end $$
delimiter ;

call myoutprocedure(@total);
select @total;




delimiter $$
create procedure myinoutprocedure(INOUT sums int)

begin
set sums = sums+ 1;

end$$


set @total =1;
call myinoutprocedure(@total);
call myinoutprocedure(@total);
call myinoutprocedure(@total);
select @total;
delimiter ;

CREATE TABLE deletedemployee(del_name varchar(50), del_salary int, deletion_time timestamp);

delimiter $
create trigger tg before delete on 
employees for each row

begin

insert into deletedemployee
values (old.name, old.salary );


end $
delimiter ;


delete from employees where salary = 30000;

select * from employees;













































