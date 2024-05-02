create database Ass_TechShop
use Ass_Techshop

-- droping 
drop table Inventory
drop table OrderDetails
drop table Orders
drop table Products
drop table Customers


-- Creating table for Customer
create table Customers(
CustomerID int not null primary key,
FirstName varchar(20) not null,
LastName varchar(20) not null,
Email varchar(20) not null,
Phone bigint not null,
Adress varchar(20) not null)

select * from Customers

-- create table for Products:
create table Products( 
ProductID int not null primary key,
ProductName varchaR(20) not null,
[Description] varchar(30) not null,
Price bigint not null)
select * from Products

--Create table for Orders
create table Orders(
OrderId int not null primary key,
CustomerId int not null ,
OrderDate date not null,
TotalAmount bigint not null,
Foreign key (CustomerID) references Customers(CustomerID))

select * from orders

-- create table for OrderDetails
create table OrderDetails(
OrderDetailID int primary key not null,
OrderID int not null,
ProductID int not null,
Quantity int not null,
Foreign key (OrderID) references Orders(OrderID)on  delete cascade ,
Foreign key (ProductID) references Products(ProductID))
select * from OrderDetails

-- create table Inventory 
create table Inventory (
InventoryID int not null primary key ,
ProductID int not null,
QuantityInStock int not null,
LastStockUpdate date not null,
Foreign key (ProductID) references Products(ProductID)) 
select * from Inventory

--Insert values in Customer Table 
insert into Customers values(1,'Kavin','p','kavin@gmail.com',7010565842,'Chennai'),
							(2,'Kishore','K','kishore@gmail.com',7010234869,'Banglore'),
							(3,'Priya','M','priya@gmail.com',9954876325,'Karur'),
							(4,'Pradhipa' , 'S', 'pradhipa@gmail.com',9600235647,'Selam'),
							(5,'Bhoopesh','T', 'bhoopesh@gmail.com',7063594125,'Madurai'),
							(6,'Shalini','M','shalimi@gmail.com',6352489745,'Thirunelveli'),
							(7,'Dharani' ,'T','dharni@gmail.com',6458926587,'Delhi'),
							(8,'Revanth','T','revanth@gmail.com',9963584275,'Mumbai'),
							(9,'Maha','P','maha@gmail.com',9600852547,'Rajastan'),
							(10,'Palani','N','palani@gmail.com',9952474425,'Singapoor')
select * from Customers

-- Insert values for products table
insert into Products values(1,'LAptop','Hp 15s Intel Core I3 12th Gen',41000),
							(2,'Computer','Lenovo IdeaPad 3 Intel Thin ',23000),
							(3,'Mobile','iQOO Z7 Pro 5G',24000),
							(4,'Apple','Apple iPhone 13 (128GB) ',52000),
							(5,'OnePlus','OnePlus Nord CE 2 Lite 5G',18000),
							(6,'Mouse','Hyper Pulsefire',6000),
							(7,'Keboard','Redragon Caraxes Pro K644 ',5000),
							(8,'Monitor','Dell 34 Curved Gaming Monitor',48000),
							(9,'Tablet','Samsung Galaxy Tab S6 Lite',26000),
							(10,'Protabel Monitor','ViewSonic 16 Inch',13000)
select *from Products

--insert values to Orders / od/ci/ dt/ pri
insert into Orders values   (1,5,'2024-04-28',24000),
							(2,7,'2024-04-20',48000),
							(3,9,'2024-04-23',41000),
							(4,8,'2024-04-30',18000),
							(5,1,'2024-04-01',15000),
							(6,4,'2024-04-14',26000),
							(7,1,'2024-04-14',96000),
							(8,10,'2024-04-19',18000),
							(9,1,'2024-04-07',26000),
							(10,5,'2024-04-05',123000)
select * from Orders

-- Insert values to OrderDetails odid/ od /pd/ q
insert into OrderDetails values (1,2,3,2),
								(2,4,5,1),
								(3,5,7,3),
								(4,6,9,1),
								(5,3,1,1),
								(6,1,6,4),
								(7,9,10,2),
								(8,8,5,1),
								(9,10,1,3),
								(10,7,3,4)
select * from OrderDetails

--insert values to Inventory table
insert into Inventory values(1,1,10,'2024-04-23'),
							(2,2,15,'2024-04-25'),
							(3,3,13,'2024-04-20'),
							(4,4,15,'2024-04-25'),
							(5,5,14,'2024-04-30'),
							(6,6,16,'2024-04-25'),
							(7,7,11,'2024-04-25'),
							(8,8,14,'2024-04-25'),
							(9,9,15,'2024-04-14'),
							(10,10,17,'2024-04-07')


-- Task2:Select, Where, Between, AND, LIKE:
-- 1. Write an SQL query to retrieve the names and emails of all customers. 
Select concat( FirstName,' ',LastName), Email
from Customers

--2. Write an SQL query to list all orders with their order dates and corresponding customer names.

select  concat(FirstName,'  ',LastName),OrderDate
from Customers, Orders as Od
where Customers.CustomerID=Od.CustomerID

--3. Write an SQL query to insert a new customer record into the "Customers" table. Include
-- customer information such as name, email, and address.
insert into Customers Values(11,'RAj','Kumar','raj@gmail.com',6352478951,'Dubai')
Select * from Customers

--4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
--increasing them by 10%.
select * from Products
update Products
set Price=(Price*110)/100

--5. Write an SQL query to delete a specific order and its associated order details from the
--"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter
declare @Variable int
set @Variable= 5

delete from Orders where OrderId=@Variable

--6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
--order date, and any other necessary information.
insert into Orders values(11,5,'2024-04-13',30000)
Select * from Orders

--7. Write an SQL query to update the contact information (e.g., email and address) of a specific
--customer in the "Customers" table. Allow users to input the customer ID and new contact
--information.
declare @cid int set @cid = 4
Declare @Em Varchar(10) set @Em='sathis@gmail.com'
declare @Ph bigint set @Ph=5647852369
Declare @Add Varchar(10) set @Add='Japan'

select * from Customers 
update Customers
set  Email=@Em	, Phone =@ph,
 [Adress] = @Add	where CustomerId=@cid

--8.Write an SQL query to recalculate and update the total cost of each order in the "Orders"
--table based on the prices and quantities in the "OrderDetails" table.
Select * from Orders
update Orders
set TotalAmount=(TotalAmount*110)/100


--9. Write an SQL query to delete all orders and their associated order details for a specific 
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
declare @ctid int 
set @ctid =8

delete from Orders where CustomerId=@ctid

--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, 
--including product name, category, price, and any other relevant details.
alter table Products
add Category Varchar(50)

Select * from Products
update Products set Category ='Lap' where ProductId in (1,2,8)
update Products set Category ='Mobile' where ProductId in (3,4,5)
update Products set Category ='Acesserys' where ProductId in (6,7,9,10)

insert into Products values (12,'Speaker', 'Zebronics Zeb-Warrior 2.0',5000,'Acesserys')
--11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.

-- Creating status column and values to pending
Alter table Orders
add [Status] Varchar(10)
Check ( [Status]  in('Pending' , 'Shipped'))

Select * from Orders
update  Orders
set [Status]='Pending'

--update status pendint to shipped
declare @orid int
set @orid =3

Select * from Orders
update Orders
set [Status]='Shipped'where OrderId= @orid



--12. Write an SQL query to calculate and update the number of orders placed by each customer 
--in the "Customers" table based on the data in the "Orders" table.
alter table Customers
add [No.Orders] int 
constraint DK_default default 0
with values

select * from Customers
update Customers
set [No.Orders]=(select count(orderId) from Orders
					where Orders.CustomerId=Customers.CustomerID)



--Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:
--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
--customer name) for each order.

Select distinct o.OrderId,concat(s.FirstName,' ',s.LastName) as [Name],s.Email,s.Phone,s.Adress
from Customers s
join
Orders o
on s.CustomerID=o.CustomerId

--2. Write an SQL query to find the total revenue generated by each electronic gadget product.
--Include the product name and the total revenue.
select ProductName,sum(P.price * O.Quantity) as [Total Revenue]
from Products p
join 
OrderDetails o
on p.ProductID=O.ProductID
group by p.ProductName


--3. Write an SQL query to list all customers who have made at least one purchase. 
--Include their names and contact information.
Select concat (c.FirstName,' ', c.LastName)as [Name],c.Phone,c.Email,c.Adress
from Customers c
right join
Orders o
on c.CustomerID=o.CustomerId

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest
--total quantity ordered. Include the product name and the total quantity ordered.

select top 1   p.ProductName,sum(O.Quantity) as [Tatal Quantity Ordered]
from Products p
right join 
OrderDetails o
on p.ProductID=o.OrderDetailID
group by p.ProductID,p.ProductName
order by sum(o.Quantity) desc

--5. Write an SQL query to retrieve a list of electronic gadgets along with their 
-- corresponding categories.
select ProductName,category
from Products

--6. Write an SQL query to calculate the average order value for each customer. Include the
--customer's name and their average order value.
select concat(c.FirstName,' ',c.LastName)as [Name],avg(TotalAmount)
from Orders o
join
Customers c
on o.CustomerId=c.CustomerID
group by concat(c.FirstName,' ',c.LastName)
-- Second option
select concat(c.FirstName,' ',c.LastName)as [Name],
(sum(o.TotalAmount)/ count(o.orderId)) as [Average Order Value]
from Customers c
join Orders o
on c.CustomerID=o.CustomerId
join
OrderDetails od
on o.OrderId=od.OrderID
group by concat(c.FirstName,' ',c.LastName)

--7. Write an SQL query to find the order with the highest total revenue. 
--Include the order ID,customer information, and the total revenue.
Select top 1 o.OrderId,c.FirstName,c.Email,c.Phone,o.TotalAmount
from Customers c
right join Orders o
on c.CustomerID=o.CustomerId
order by o.TotalAmount desc

--8. Write an SQL query to list electronic gadgets and the number of times each product 
--has been ordered.
select p.ProductName,count(od.OrderID) as [No.of times Ordered]
from Products p
join
OrderDetails od
on p.ProductID=od.ProductID
Group by p.ProductName

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product.
--Allow users to input the product name as a parameter.
declare @name varchar(10)
set @name ='Tablet'

Select concat(c.FirstName,' ',c.LastName)
from Customers c
join Orders o
on c.customerID=o.CustomerId
join OrderDetails od
on o.OrderId=od.OrderID
join Products p
on od.ProductID= p.ProductID
where p.ProductName=@name


--10. Write an SQL query to calculate the total revenue generated by all orders placed 
--within a specific time period. Allow users to input the start and end dates as parameters.
declare @startd date
set @startd='2024-04-14'
declare @stopd date
set @stopd ='2024-04-23'
select sum(TotalAmount) as [Total Ravenue]
from Orders
where OrderDate between @startd and @stopd

--Task 4. Subquery and its type:
--1. Write an SQL query to find out which customers have not placed any orders.
select CONCAT(FirstName,' ',LastName) as [Name]
from Customers
where CustomerID not in (Select CustomerID from Orders )

--2. Write an SQL query to find the total number of products available for sale.
Select sum(QuantityInStock) as [products available for sale]
from Inventory

--3. Write an SQL query to calculate the total revenue generated by TechShop.
Select sum(TotalAmount) as [total Revenue]
from Orders

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.
declare @Ct varchar(20)
set @Ct ='Acesserys'

select avg(Quantity) as [Avg of Orders]
from OrderDetails
where ProductId in	(  select ProductID from Products where Category =@Ct)

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
--to input the customer ID as a parameter.
declare @cid1 int 
set @cid1=1
select sum(TotalAmount) as [Totla Revenue]
from Orders
where  CustomerId=@cid1

--6. Write an SQL query to find the customers who have placed the most orders. List their names
--and the number of orders they've placed.
Select top 1  CONCAT(c.FirstName,' ',c.LastName),count(o.OrderId)
from Customers c
right join
Orders o
on c.CustomerID=o.CustomerId
group by CONCAT(c.FirstName,' ',c.LastName)
order by sum(o.OrderId) desc


--7. Write an SQL query to find the most popular product category, which is the one with the highest
--total quantity ordered across all orders.
select * from Products
where ProductID in (select top 1  ProductID
from OrderDetails
group by ProductID 
order by sum(Quantity) desc)


--8. Write an SQL query to find the customer who has spent the most money (highest total revenue)
--on electronic gadgets. List their name and total spending.

select top 1 concat(c.firstname,' ',c.LastName) as [Name], sum(o.TotalAmount) as high_amount
from Customers c
join  Orders o
on o.CustomerID=c.CustomerID
group by concat(c.firstname,' ',c.LastName)
order by high_amount desc


--9. Write an SQL query to calculate the average order value (total revenue divided by the number of
--orders) for all customers.
Select AVG(TotalAmount) as [Total Revenue]
from Orders

--10. Write an SQL query to find the total number of orders placed by each customer and list their
--names along with the order count.
Select concat(FirstName,' ' ,LastName) as [Name], [No.Orders]
from Customers



