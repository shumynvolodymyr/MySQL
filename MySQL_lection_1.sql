 select * from students;
 select name, age from students;
 select * from students where age = 15;
 select * from students where name = 'roman';
 select * from students where name like '%a';
 select * from students where name like 'a%';
 select * from students where name like '%a%';
 select * from students where name like '___a';

select * from students order by age;
select * from students order by name desc;

select * from students where gender = 'male' order by age desc;

select * from students where length(name)=4;

select * from students where age <= 18;
select * from students where age >= 18;
select * from students where age != 18;

select * from students where age between 20 and 30;
select * from students where age >= 20 and gender like 'f%';
select * from students where age >= 20 or gender like 'f%';

select * from students where age = 18 or ( name like 'o%' and gender like 'f%');
select * from students where age between 20 and 30 and name like 'o%';

select * from students where age in (20,25,30);
select * from students where name in ('roman','mary');

select max(age) from students;
select min(age) from students;
select count(age) from students;
select avg(age) from students;
select sum(age) from students;

select max(age), gender from students group by gender;


select
avg(rating) as avgRat,
count(rating) as countRat,
student_id from ratings group by student_id;


select distinct gender from students;

select * from students limit 3 offset 0;
select * from students limit 3 offset 3;

update students set name = 'Britney Spears' where age > 40 limit 11;

delete from students where id =10;

select * from students;