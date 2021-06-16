-- 1. +Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.

select * from client where LENGTH(FirstName) < 6;

-- 2. +Вибрати львівські відділення банку.+

select * from department where DepartmentCity = 'lviv';

-- 3. +Вибрати клієнтів з вищою освітою та посортувати по прізвищу.

select * from client where education = 'high';

-- 4. +Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.

SELECT * FROM application order by idApplication desc limit 5;

-- 5. +Вивести усіх клієнтів, чиє прізвище закінчується на OV чи OVA.

select * from client where LastName like '%iv' or LastName like '%yn';

-- 6. +Вивести клієнтів банку, які обслуговуються київськими відділеннями.

select * from client where Department_idDepartment IN (1, 4);

-- 7. +Вивести імена клієнтів та їхні номера телефону(age), погрупувавши їх за іменами.

select firstName, age from client order by firstName;

-- 8. +Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.

select * from client c JOIN application a ON c.idClient = a.Client_idClient where creditState = 'Not returned' and Sum > 5000 and currency = 'Gryvnia';

-- 9. +Порахувати кількість клієнтів усіх відділень та лише львівських відділень.

select count(idClient) AS 'К-сть клієнтів' From client;
select count(idClient) AS 'К-сть клієнтів Львівського відділення' From client where Department_idDepartment IN (2, 5);

-- 10. Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.

select Client_idClient, MAX(Sum) from application group by Client_idClient;


-- 11. Визначити кількість заявок на крдеит для кожного клієнта.

select
idClient,
CONCAT(FirstName ," ",LastName ) AS FullName,
count(Client_idClient) AS 'Заявки на кредит'
from application a
JOIN client c ON a.Client_idClient = c.idClient
group by Client_idClient;

-- 12. Визначити найбільший та найменший кредити.

select MAX(Sum), Min(Sum) FROM application;

-- 13. Порахувати кількість кредитів для клієнтів,які мають вищу освіту.

select count(Client_idClient) AS 'К-сть кредитів' from application a
JOIN client c ON a.Client_idClient = c.idClient where Education = 'high';

-- 14. Вивести дані про клієнта, в якого середня сума кредитів найвища.

select idClient, CONCAT(FirstName ," ",LastName ) AS FullName, (avg(Sum)) AS SUM from application a
JOIN client c ON a.Client_idClient = c.idClient
group by idClient
order by SUM desc
limit 1;


-- 15. Вивести відділення, яке видало в кредити найбільше грошей

SELECT idDepartment, DepartmentCity, SUM(Sum) AS SUM FROM department d
JOIN client c ON d.idDepartment = c.Department_idDepartment
JOIN application a ON c.idClient = a.Client_idClient
group by idDepartment
order by SUM desc
limit 1;

-- 16. Вивести відділення, яке видало найбільший кредит.

SELECT idDepartment, DepartmentCity, MAX(Sum) FROM department d
JOIN client c ON d.idDepartment = c.Department_idDepartment
JOIN application a ON c.idClient = a.Client_idClient
group by idDepartment
order by MAX(Sum) desc
limit 1;

-- 17. Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн.

UPDATE application
JOIN client c ON c.idClient= Client_idClient
SET Sum = '6000', Currency = 'Gryvnia' where c.Education = 'high';

-- select * from application;


-- 18. Усіх клієнтів київських відділень пересилити до Києва.

update client
JOIN department d ON d.idDepartment = Department_idDepartment
SET City = 'Kyiv'
where d.idDepartment IN (1,4);

-- select * from client where Department_idDepartment IN (1, 4);

-- 19. Видалити усі кредити, які є повернені.

delete from application where CreditState = 'Returned';


-- 20. Видалити кредити клієнтів, в яких друга літера прізвища є голосною.

delete application from application
JOIN client c ON c.idClient = Client_idClient
where LastName IN ('_u%','_o%', 'a%', 'i%');

-- Знайти львівські відділення, які видали кредитів на загальну суму більше ніж 5000

select Client_idClient,
CONCAT(FirstName ," ",LastName ) AS FullName,
DepartmentCity,
Sum
from department
JOIN client c ON c.Department_idDepartment = idDepartment
JOIN application a ON a.Client_idClient= c.idClient
where DepartmentCity = 'Lviv' and Sum>6000;


-- Знайти клієнтів, які повністю погасили кредити на суму більше ніж 5000





-- /* Знайти максимальний неповернений кредит.*/




-- /*Знайти клієнта, сума кредиту якого найменша*/




-- /*Знайти кредити, сума яких більша за середнє значення усіх кредитів*/



-- /*Знайти клієнтів, які є з того самого міста, що і клієнт, який взяв найбільшу кількість кредитів*/



-- #місто чувака який набрав найбільше кредитів



-- set sql_safe_updates = 0;
-- set sql_safe_updates = 1;