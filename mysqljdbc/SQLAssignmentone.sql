create database if not exists Assignmentone;
use Assignmentone;

create table if not exists Tweets
(
Username varchar(15) not null,
Content varchar(150),
Favourites int not null
);

create table if not exists Pastries
(
name varchar(50) not null,
quantity int 
);
select * from Pastries;-- to display the structure
drop table Pastries; -- to delete the table

create table if not exists people
( first_name varchar (20),
last_name varchar(20),
age int );

insert into people values ("Abhijit", "Shubham", 25),("Rahul", "Gehlot", 23);
insert into people values ("Rakesh", "Ranjan", 26), ("Soumya", "Saloni", 25), ("Ayush", "Gupta", 26);

select * from people; -- will display 5 records

drop table people; 
select * from people;-- Gives the error Table 'assignmentone.people' doesn't exist

drop table if exists Employees;

create table Employees 
(
id int not null auto_increment,
first_name varchar(50) not null,
last_name varchar(50) not null,
middle_name varchar(50),
age int not null,
current_status varchar(20) not null default "Employed",
primary key(id)
);



-- query from the assignment sheet
CREATE TABLE cats (
cat_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100),
breed VARCHAR(100),
age INT,
PRIMARY KEY (cat_id)
);

INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4), ('Cindy', 'Maine Coon', 10),
('Dumbledore', 'Maine Coon', 11), ('Egg', 'Persian', 4), ('Misty',
'Tabby', 13), ('George Michael', 'Ragdoll', 9), ('Jackson', 'Sphynx',
7);



-- query for all the cats IDs

select cat_id from cats;

-- sql query to print name and breed

select name, breed from cats;

--  sql to select just Tabby cats

select name, age from cats where breed = "Tabby";

-- sql query for cat Id same as age

select cat_id, age from cats where cat_id = age;


-- SQL2.PDF SOLUTION
select * from cats;


update cats
set name = 'Jack'
where name = 'Jackson';

	update cats
set breed = 'British Shorthair'
where name = 'Ringo';

update cats
set age = 12
where breed = 'Maine Coon';

delete from cats where age = 4;
delete from cats where age = cat_id;

select * from cats;

truncate cats; -- deletes data from the table but keeps the structure.

select* from cats;

-- query from the SQL2.PDF assignment


CREATE TABLE books  
( 
book_id INT NOT NULL AUTO_INCREMENT, 
title VARCHAR(100), 
author_fname VARCHAR(100), 
author_lname VARCHAR(100), 
released_year INT, 
stock_quantity INT, 
pages INT, 
PRIMARY KEY(book_id) 
);
INSERT INTO books (title, author_fname, author_lname,  released_year, stock_quantity, pages) 
VALUES 
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291), ('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304), ('American Gods', 'Neil', 'Gaiman', 2001, 12, 465), ('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97,  198), 
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012,  154, 352), 
('The Circle', 'Dave', 'Eggers', 2013, 26, 504), ('The Amazing Adventures of Kavalier & Clay', 'Michael',  'Chabon', 2000, 68, 634), 
('Just Kids', 'Patti', 'Smith', 2010, 55, 304), ('A Heartbreaking Work of Staggering Genius', 'Dave',  'Eggers', 2001, 104, 437), 
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208), ('What We Talk About When We Talk About Love: Stories',  'Raymond', 'Carver', 1981, 23, 176), 
("Where I'm Calling From: Selected Stories", 'Raymond',  'Carver', 1989, 12, 526), 
('White Noise', 'Don', 'DeLillo', 1985, 49, 320), ('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181), ('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172,  329), 
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92,  343);


--


select title from books where title like '%stories%';

select title, max(pages) from books;

select concat (title,released_year) as Summary from books order by released_year desc limit 3;

select title, author_lname from books where author_lname like '% %';


select title, released_year, stock_quantity from books order by stock_quantity limit 3;


select stock_quantity, released_year from books group by released_year; -- number of books released per year

select sum(stock_quantity) from books;   -- total number of books


select released_year as year, count(title) as books, avg(pages) as avg_pages from books group by released_year order by released_year asc;


-- CODE FROM SQL2.PDF

CREATE TABLE students ( 
 id INT AUTO_INCREMENT PRIMARY KEY, 
 first_name VARCHAR(100) 
); 
CREATE TABLE papers ( 
 title VARCHAR(100), 
 grade INT, 
 student_id INT, 
 FOREIGN KEY (student_id)  
 REFERENCES students(id) 
 ON DELETE CASCADE 
); 
INSERT INTO students (first_name) VALUES  
('Caleb'),  
('Samantha'),  
('Raj'),  
('Carlos'),  
('Lisa'); 
INSERT INTO papers (student_id, title, grade ) VALUES (1, 'My First Book Report', 60), 
(1, 'My Second Book Report', 75), 
(2, 'Russian Lit Through The Ages', 94), 
(2, 'De Montaigne and The Art of The Essay', 98), 
(4, 'Borges and Magical Realism', 89); 
 

--

SELECT distinct first_name,title ,grade FROM students s, papers p WHERE s.id=p.student_id ORDER BY grade DESC ;




SELECT distinct first_name,title ,grade FROM students s, papers p where s.id = p.student_id order by grade desc;



select s.first_name, avg(p.grade) from students s left join papers p  on s.id = p.student_id group by s.first_name ;

select distinct s.first_name, ifnull(title , 'missing') as title,ifnull(grade, '0') as grade from students s left join papers p   on s.id = p.student_id;


select first_name, ifnull(title , 'missing') as title,ifnull(grade, '0') as grade from students s left join papers p on s.id = p.student_id;

select s.first_name, avg(p.grade) as average, if(avg(p.grade) >75, 'PASSING', 'FAILING')  as passing_status 
 from students s left join papers p on s.id = p.student_id  group by s.first_name order by grade desc;








 
 
 
 
 
 











 




