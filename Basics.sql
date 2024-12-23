-- default DB 
use Northwind

-- select all the columns from table employees
select *
from Employees

-- specify which colomns to take from employees
select FirstName, LastName, City, Country
from [dbo].[Employees]

-- Exercise
select CustomerID, ContactName, City, Country
from Customers

-- Exercise
select [CompanyName],[CompanyName],[Address],[City],[Country]
from [dbo].[Suppliers]

-- multiply 2 different values in different columns and display the result in a new column
select ProductID, ProductName, UnitsInStock, UnitPrice, UnitsInStock * UnitPrice as 'TotalValue_PerItem'
from Products

-- normal
select City 
from employees

-- distinct - causing deletion of duplicates, and also doing alpha-bet sorting
select distinct City 
from Employees

-- functions
-- replace string
select FirstName,replace (FirstName, 'ST','Tomer')as Replaced
from Employees

-- replace every london value in city column to be GB_London
select city,replace (city, 'london','GB_London') as NewCity
from Employees

-- substring - go to the first char and count 4 chars total in the first names.
select firstname,SUBSTRING (FirstName,1,4) 'SubString'
from Employees

select HomePhone,substring(HomePhone,6,99) as 'Tel_No_extension'
from Employees

-- using ltrim to cut left blanks
select HomePhone,ltrim(substring(HomePhone,6,99)) as 'Tel_No_extension'
from Employees

-- show 5 farthest chars to the left and right of companyname
SELECT companyname,LEFT(CompanyName,5)'5left',right(companyname,5)'5right'
FROM Customers;

-- length - number of chars in homephone
select HomePhone,len(HomePhone) 'NumOfChars'
from Employees

-- shows all capital letters and all low letters of certain values
Select UPPER(firstname) 'CAPS',LOWER('ABCDname') 'Regular'
from Employees

-- shows the current date and time --getutcdate shows the universal date and time
select getdate() 'Getdate'

-- shows the universal date and time
select getutcdate () 'UTC'

select firstname,hiredate
from Employees

-- specify in each column its year, month and day
select employeeid,firstname,hiredate,
year (HireDate) 'YYYY',month (HireDate) 'MM',day(HireDate) 'DD'
from Employees

-- current date
select day(getdate()) DD, month(getdate())'MM', year (getdate()) as 'YYYY'

select orderid,orderdate,
year(orderdate) 'YYYY',month (orderdate) 'MM',day (OrderDate) 'DD'
from Orders

-- employee age
select FirstName,city,country,year (getdate()) - year (birthdate) 'Age'
from Employees

-- datediff - shows in years the birthdate (the age) of employees relative to today
select firstname,DATEDIFF(YEAR,birthdate,getdate()) 'Date_in_years' 
from Employees

-- concat - merge columns with concat into to the same column
select concat(firstname,' ',city)'name city'
from employees

select concat(firstname,' From ', city,Country) 'Name_city'
from employees

-- round the first number according to the second number digit
select round (125.8645,0)   'R 0'
select round (125.8645,1)   'R 1'
select round (125.8645,2)   'R 2'
select round (125.8645,3)   'R 3'
select round (125.8645,4)   'R 4'
select round (125.0000,-1) '-1'
select round (123.0000,-1) '-1'
select round (123.0000,-2) '-2'

-- floor - change to the nearest small number
select 123.9999,floor (123.9999) 'floor'
select floor (0.58888)
select floor (-125.99999)
select floor (-9999.9999)
-- ceiling - change to the nearst big number
select ceiling (0.5888)

-- more functions
select sqrt(16)'sqrt16',log(2000000.0)'log',sign(-10*1/8*5)'s',sign(10*10-10+10)'s',
power(4,4)'power',CURRENT_TIMESTAMP'time stamp',getdate()'getdate',
44 / 5 '44/5',44/5.0 'float', 44 % 5 'Remainder modulu'

-- format integer accordingly
SELECT FORMAT(123456789, '##-##-#####');

-- reverse string
SELECT REVERSE('1085abcd');

-- spaces
select space(5)+ ' ' +firstname as 'space'
from Employees

-- where(condition) - shows only the employees with an employeeID greater or equel to 5.
select *
from Employees
where EmployeeID >= 5

-- all products where price > 10 
select ProductID,ProductName,UnitPrice,UnitsInStock,ReorderLevel,
QuantityPerUnit 
from Products 
where Unitprice > 10

-- products details where stock >= 15 and price > 10 
select ProductID,ProductName,UnitPrice,UnitsInStock,ReorderLevel,QuantityPerUnit
from Products
where  UnitsInStock >= 15 and UnitPrice > 10

-- products details where stock >= 15 or price > 10 
select ProductID,ProductName,UnitPrice,UnitsInStock,[ReorderLevel],[QuantityPerUnit]
from Products
where  UnitsInStock >= 15 or UnitPrice > 10 

-- shows just the orderdate of orders from year 1996
select OrderID,OrderDate,year(OrderDate) 'Year',CustomerID
from Orders
where year (OrderDate) = 1996

-- between = <= and >=
select orderid,year(orderdate)
from Orders
where year (orderdate) between 1996 and 1998

--where can be long
select ProductID,UnitPrice,UnitsInStock,[ReorderLevel]
from   Products
where (UnitPrice < 100 and  ReorderLevel > 10) 
       and UnitsInStock != 50
	   OR Discontinued = 0

-- in - specific values in DB 
select ProductID,UnitPrice,UnitsInStock,ReorderLevel
from Products
where UnitPrice in (10,20,30,40) -- unitprice = 10 or unitprice = 20 or unitprice = 30 or unitprice = 40 instead

-- where on chars text
select CustomerID,CompanyName,ContactName,city,Country
from Customers
where city = 'london'

-- or vs in 
select EmployeeID,City,FirstName,BirthDate
from Employees
where   City = 'London'
		or  City='Redmond'
		or  City='Seattle'

select EmployeeID,City,FirstName,BirthDate
from Employees
where City  in ('London', 'Redmond','Seattle') 

-- like - shows everyone that have the v letter
-- starts with v
select CompanyName,Country
from customers
where country like 'V%'

-- any place G is, even 1st or end of the string
select Country
from Customers
where Country like '%G%' 

-- any place GE is,distinct, even 1st or end of the string
select distinct Country
from Customers
where Country like '%Ge%'

-- starts with n ends  with y
select city,Country
from Customers
where Country like 'n%y' 

-- city with 6 chars
select CompanyName,city,Country
from Customers
where city like '_e_l__'

-- ORDER BY - sorting according to parameter and the entire request is in asc or desc order
-- asc/desc, asc is default
select CompanyName,city,Country
from  Customers
where country like 'i%'
order by city asc    

-- sort inside sort , country and city
select customerid,companyname,country,city
from customers
order by Country asc,city asc 

-- join - taking values from 2 or more tables and shows them. multiplying the values in the number of colmns 77 * 9
select ProductID,productname,unitprice,unitsinstock,CategoryName,categories.CategoryID
from   Categories,Products

-- one way of dealing with the unnecessary multiplying of join is to find the PK in 1 table and the same FK in the 2 table and than match them in where
select ProductID,ProductName,CategoryName,[Description],categories.CategoryID
from  Categories,Products
where Categories.CategoryID = Products.CategoryID 
order by categories.CategoryID

-- second way dealing with the unnecessary multiplying of join is to find the PK in 1 table and the same FK in the 2 table and than writing join on in from and match them
select ProductID,ProductName,CategoryName,[Description],categories.CategoryID
from Products join Categories on Products.CategoryID = Categories.CategoryID

-- join in the where 
select ProductID,productname,C.CategoryID,CategoryName,
UnitPrice,UnitsInStock
from  Categories C,Products P
where C.CategoryID = P.CategoryID
      and CategoryName like '%meat%'
	  and UnitPrice >  5
order by UnitPrice desc

-- join orders and employees,display orderid, orderdate, employeeid,
-- firstname,city, order by employeeid

-- first way
select OrderID, OrderDate, Employees.EmployeeID, FirstName, City
from Orders inner join Employees on Orders.EmployeeID = Employees.EmployeeID
order by EmployeeID

-- second way
select orderid,orderdate,Employees.EmployeeID,firstname,city
from  employees,orders
where employees.employeeid = orders.employeeid
order by EmployeeID

-- cross join !!
select *
from Orders,[Order Details]  

-- Join more then 2 tables
-- orders shippers employees
select orderid,orderdate,CompanyName 'ShippedCompany',ShippedDate,FirstName 'EmpName'
from employees,orders,shippers
where employees.EmployeeID = orders.employeeid and orders.shipvia = shippers.shipperid

-- same
select orderid,orderdate,CompanyName 'ShippedCompany',ShippedDate,FirstName 'EmpName'
from employees join orders On employees.EmployeeID = orders.employeeid Join Shippers ON orders.shipvia = shippers.shipperid

-- Aggression
-- select funcs - max, min count(no nulls), sum, avg(sum / count)
select 	min(productname)'Min_name',
        max(productname)'Max_name',
		max(unitprice)  'MaxPrice',
		min(unitprice)  'MinPrice',
		sum(unitprice)  'Sum_Price',
        count(productid) 'count_id',
		avg(unitprice)  'AvgPrice'

from Products

-- example
select	count (*) 'CountPK',
		count(orderid) as 'count',
		sum  (orderid) as 'Sum_id',
		min  (orderid) as '1st_order',
		max  (orderid) as 'High_Order',
		avg  (orderid) as 'AVG orderid',
		count(shippeddate) as 'Count_shippeddate',
		count (*) - count(shippeddate) as 'not supplied',
		avg (freight) as 'avg freight'
from [Orders]

-- count in colum which is null like region
select count (*) 'AllEmps',count(region) 'With_Region',
count(*) - count(region)'Not USA'
from Employees

-- Group By - writes how much of the same we have in that category (if Distinct had Count)
select city, count(City) 'NumOf'
from Employees
group by city

select country,city,count(Country) 'NumOfEmps'
from   Employees
group by country,City
order by NumOfEmps desc 

-- Example When All The Sql Orders Are In Place - The Order They Run
/*4*/select Orders.EmployeeID,FirstName,count (Orders.employeeid) 'NumOfOrders'
/*1*/from  orders,Employees
/*2*/where orders.EmployeeID = Employees.EmployeeID
/*3*/group by Orders.EmployeeID,FirstName
/*5*/order by NumOfOrders desc

-- having - condition to show in group by just certain number of groupes
select country ,count(*) 'NumOfCustomers'
from   customers
group by country
      having count(*) between 6 and 12 
order by NumOfCustomers desc

-- outer join left/right/full - shows all the the columns with the id from the left/ right from the table and both if full. can show null parameters
select C.CustomerID, CompanyName, ContactName, OrderID
from Customers C Full outer join Orders O on C.CustomerID = O.CustomerID
where OrderID is null or C.CustomerID is null
order by OrderID

-- left outer join
SELECT C.CustomerID, companyname,ContactName, OrderID 
FROM Customers C left outer join Orders O
ON   C.CustomerID = O.CustomerID

-- full outer join
SELECT C.CustomerID, companyname,ContactName, OrderID 
FROM   Customers C FULL OUTER JOIN Orders O
       ON C.CustomerID = O.CustomerID
where orderid is null OR C.CustomerID is null
order by OrderID

-- sub query - query inside the main query that sends it result to the main query when it finishes first
select *
from Products
where UnitPrice = (select max (UnitPrice) From Products)

--all besides the expensive product   <> !=			   
SELECT *
	FROM Products
	WHERE UnitPrice != (SELECT max(UnitPrice) 
					    FROM Products)

-- employee details with max number of orders !!
select *
from Employees
where EmployeeID = ( 
					select top 1 employeeid
					from orders
					group by EmployeeID
					order by COUNT(*) desc)

-- sub queries 
select ProductID,ProductName,UnitPrice,SupplierID
from products
where unitprice in
(	select unitprice
	from products
	where unitprice > 
				     (select avg (unitprice) from products))

-- sub query in the SELECT 
select productid,productname,unitprice,QuantityPerUnit,
      (select AVG(unitprice) from Products) 'Avg price',
      (select max(unitprice) from products) 'Max Price'
from Products

-- union all - display all data from 2 different tables
select ContactName,country,City
from Customers
union all
select ContactName,country,City
from Suppliers

-- union - like union all but eliminate duplications
select City,Country
from Customers
UNION
select city,Country
from Suppliers

-- intersect - shows something that appears in both tables
select city,Country
from Customers
intersect
select city,Country
from Suppliers

select country,City
from Employees
intersect
select country,city
from Suppliers
intersect
select country,city
from customers

-- except - shows something that exist in the first table but not in the second (-). in this case shows the countries we have customers but not suppliers
SELECT Country FROM Customers
EXCEPT
SELECT Country from Suppliers

-- Changes In The Data Base
-- insert into - adding values to new row in the clomns of a table. in this case adding to categoryid and CategoryName columns, values, inside categories table
select * 
from Categories
insert into Categories (categoryid,CategoryName)
				values (10,'Demo Category')

-- adding to all columns of a table
select * 
from Categories
 Insert  into Categories
 values ('NBA Players','mj,kd',NULL)

  -- insert new item into products
select * 
from products
insert into products (ProductName,supplierid,categoryid,
					  QuantityPerUnit,UnitPrice,Discontinued)
               values('basketball',1,44,null,0.99,0)

 -- Insert more then 1 row 
select * 
from Categories
Insert into Categories
       (CategoryName,[Description]) 
values ('cat_1','demo category for You'),
       ('cat_2','demo category for Me')

-- update - update an existing row. in this case updating row 44 inside column categoryname inside categories table
select * 
from Categories
update categories
set    categoryname = 'Sport_Sela',description = 'NEW_shesh besh products'
where  CategoryID = 44

-- delete - delete existing row. in this case deleting row inside categoryID columns, number 40 from categories table
select * from Categories
delete from Categories
where CategoryID > 40 

delete from Categories
where CategoryID in (20,30,40,50)

-- Delete with rollback option (no action done) 
BEGIN TRANSACTION 
	DELETE FROM Categories
	WHERE CategoryName = 'blue' 
--	if OK 
COMMIT
-- else  
ROLLBACK 

-- Creating Tables
create table Car_Demo_2023 (
Car_id		int primary key, -- PK (identity +1 automatic)		
Shield_Num	char (25) not null unique, -- Just 1 in the whole DB
GradeSafe	int not null check(gradesafe >= 20 and gradesafe <= 100), -- can input specific value only
Notes		char(255),
CarDate		datetime check (year(cardate) between 2010 and year(getdate())),
OnRoad_date date,                         --- dd/mm/yyyy
Color		char(10)default 'Blue', -- degault value if not set
Price		decimal(10,2),                 -- total 10 digits 99999999.99
Employeeid	int references  employees (employeeid)       ); -- connection to different DB (FK)

select * from Car_Demo_2023

insert into Car_Demo_2023 values
('10-88-88','plate_4',88,'notes','2022-10-28','2022-12-12','color blue',null,2),
('10-88-45','plate_5',44,'notes','2022-10-25','2022-12-12','Yellow',null,1),
('10-88-46','plate_6',88,'notes','2022-10-10','2022-12-12','yellow',null,3),
('10-88-48','plate_8',44,'notes','2019-10-10','2019-12-12','color blue',null,4),
('10-88-49','plate_9',88,'notes','2019-10-10',getdate(),default,4444,5),
('10-88-50','plate_10',44,'notes',getdate(),'2019-12-12','color blue',125858.41,4);

-- delete a whole table
drop table Car_Demo_2023; 

-- Change data fields in table
-- alter column change column attributes like changing color to char(50)
alter table  car_demo_2021
alter column color char(50)

-- alter table add - adding column country
alter table car_demo_2021
add CountryOfOrigin char(20)

-- alter table drop - deletes column countryoforigin
alter table car_demo_2021
drop column countryoforigin;

-- creating index - allow quick search like for PK but for city
create index color on [dbo].[Customers](city)

-- deleting index 
drop index Customers.color


-- Creating view - looking at data and not changing it
GO

CREATE VIEW V_ORD2EMP 
AS
select FirstName,City,country
from   Employees

Go