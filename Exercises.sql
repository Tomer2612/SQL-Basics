use northwind

--1
select FirstName, LastName, HomePhone
from Employees
where Country != 'Uk'

--2
select *
from Products
where  UnitPrice > 10 and UnitsInStock > 2

--3
select FirstName, LastName, HomePhone
from Employees
where year(HireDate) in (1992,1993)

--4
select ProductName, CompanyName, UnitsInStock
from Suppliers join Products on Suppliers.SupplierID = Products.SupplierID
where UnitsInStock >= 15 and ProductName like 'B%' or ProductName like 'C%' or ProductName like 'M%' 


--5
select *
from Products join Categories on Products.CategoryID = Categories.CategoryID
where CategoryName = ' Meat/Poultry ' Or CategoryName = 'Dairy Products'
order by ProductName

--6
select CategoryName, ProductName, UnitsInStock * UnitPrice as 'Profit'
from Products join Categories on Products.CategoryID = Categories.CategoryID
order by 'Profit' desc

--7
select FirstName, LastName, CategoryName
from Employees, Orders, [Order Details], Products, Categories
where Employees.EmployeeID = Orders.EmployeeID and Orders.OrderID = [Order Details].OrderID and [Order Details].ProductID = Products.ProductID and Products.CategoryID = Categories.CategoryID
group by Categories.CategoryName, FirstName, LastName
Order by Categories.CategoryName

--8
select FirstName, LastName, HomePhone, BirthDate
from Employees 
where year(getdate()) - year(BirthDate) >= 35
order by LastName desc

--9
select FirstName, LastName, ProductName, Quantity
from Employees, Orders, [Order Details], Products
where Employees.EmployeeID = Orders.EmployeeID and Orders.OrderID = [Order Details].OrderID and [Order Details].ProductID = Products.ProductID
order by FirstName, Quantity desc

--10
select ContactName, ProductName, Quantity, [Order Details].UnitPrice, Quantity * [Order Details].UnitPrice as 'TotalPrice',day(OrderDate) - day(ShippedDate) as 'GapInOrderDate' 
from Customers, Orders, [Order Details], Products
where Customers.CustomerID = Orders.CustomerID and Orders.OrderID = [Order Details].OrderID and [Order Details].ProductID = Products.ProductID
order by [Order Details].OrderID

--11
select ContactName, UnitPrice * Quantity as 'PayedTotal' 
from Customers, Orders, [Order Details]
where Customers.CustomerID = Orders.CustomerID and Orders.OrderID = [Order Details].OrderID

--12
select Products.ProductID, ProductName
from Products join [Order Details] on Products.ProductID = [Order Details].ProductID
where Quantity > 0.1 * UnitsInStock

--13
select COUNT(EmployeeID) 'Employees',Country, AVG(DATEDIFF(Year,BirthDate,GETDATE()))'Average Age'
from Employees
group by Country

--14
select Sum(UnitPrice * 0.05) 'Price',COUNT(CompanyName) * 0.95 'Discount'
from [Order Details] od
join Orders o on o.OrderID=od.OrderID
join Customers C on c.CustomerID = o.CustomerID
where DATEDIFF(DAY,OrderDate,ShippedDate)>5 and City = 'london'

--15
select Products.ProductID, ProductName, UnitsInStock, Products.UnitPrice, Products.UnitPrice * UnitsInStock as 'TotalValue'
from Products, [Order Details]
where Products.ProductID = [Order Details].ProductID
group by Products.ProductID, ProductName, UnitsInStock, Products.UnitPrice having sum(Quantity) > 500

--16
select FirstName, LastName, sum([Order Details].Quantity *([Order Details].UnitPrice * (1 - Discount))) as 'Orders Price That Havent Shipped Yet'
from Employees, Orders, [Order Details]
where Employees.EmployeeID = Orders.EmployeeID and Orders.OrderID = [Order Details].OrderID and ShippedDate is null
group by Employees.EmployeeID, Employees.FirstName, Employees.LastName
order by 'Orders Price That Havent Shipped Yet' desc

--17
select year(o.OrderDate) as 'Year Of The Order', c.CategoryName, sum(od.Quantity) * avg(p.UnitPrice) as 'Revenue'
from Categories c 
join Products p on c.CategoryID = p.CategoryID
join [Order Details] od on p.ProductID = od.ProductID
join Orders o on od.OrderID = o.OrderID
group by YEAR(OrderDate), c.CategoryName
order by 'Revenue'

--18
select top 1 ProductName, sum(od.Quantity) as 'Number Of Orders'
from Products p
join [Order Details] od on p.ProductID = od.ProductID
group by ProductName
order by 'Number Of Orders' desc

--19
select top 1 ProductName, sum(od.Quantity) * avg(p.UnitPrice) as 'Income'
from Products p
join [Order Details] od on p.ProductID = od.ProductID
group by ProductName
order by 'Income' desc

--20 
select p.ProductID, p.ProductName, p.CategoryID, p.UnitPrice, c.CategoryName, avg(p2.UnitPrice) as 'Avarge Price By Category'
from Products p
join Categories c on p.CategoryID = c.CategoryID 
join Products p2 on p.CategoryID = p2.CategoryID
group by p.ProductID, p.ProductName, p.CategoryID, p.UnitPrice, c.CategoryName having p.UnitPrice > avg(p2.UnitPrice)
order by p.UnitPrice desc

--21
select City, avg(subQuery.[Income Avarage]) as 'Yearly Income Avarage'
from (
  select c.City, year(o.OrderDate) as 'Year Of The Order', sum(od.Quantity) * avg(od.UnitPrice) as 'Income Avarage' 
  from Customers c
  join Orders o on c.CustomerID = o.CustomerID
  join [Order Details] od on o.OrderID = od.OrderID
  group by c.City, year(o.OrderDate)) as subQuery
group by City
order by City

--22
select YEAR(OrderDate) as 'order year',MONTH(OrderDate) as 'order month',AVG(Quantity*UnitPrice) as 'avg sales'
from [Order Details] od
join Orders o on od.OrderID=o.OrderID
group by YEAR(OrderDate),MONTH(OrderDate)


--23
select p.ProductID,p.ProductName,MAX(od.Quantity*od.UnitPrice) as 'LargestOrderAmount'
from Products p
join [Order Details] od on p.ProductID=od.ProductID
join Orders o on od.OrderID=o.OrderID
group by p.ProductID,p.ProductName,o.OrderID
having MAX(od.Quantity*od.UnitPrice)=SUM(od.Quantity*od.UnitPrice)

                                                                                                           
--24
With V as (
select Sum(od.Quantity) 'Max Purchase', Year(o.OrderDate)'Years', c.CustomerID 'ID'
from Orders o join [Order Details] od on o.OrderID = od.OrderID join Customers c on c.CustomerID = o.CustomerID
group by Year(o.OrderDate), c.CustomerID
)

select tbl.[max], tbl.Years, V.ID
from V join (select Max([Max Purchase]) as 'max', Years from V group by Years) as tbl on v.Years = tbl.Years and v.[Max Purchase] = tbl.[max]






