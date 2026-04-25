select * from employees;

select * from orders;

select * from customers;

select * from orderdetails;

select c.customerName , p.paymentDate , p.amount 
from customers c 
join payments p on c.customerNumber = p.customerNumber limit 10;

select c.customerName , p.paymentDate , p.amount from customers c join payments p on c.customerNumber = p.customerNumber;

select customerNumber , orderNumber , customerName from orders natural join customers;

select MAX(amount) as highest_payment , MIN(amount) as lowest_payment from payments;

select SUM(amount) as total from payments;

select AVG(amount) as avg  from payments; 

select count(shippedDate) from orders; -- does not count null values;

select  count(shippedDate) ,count(requiredDate) , count(orderNumber) from orders;  -- here we can see the difference

select count(*) from orders; -- total records are 326

select count(*) from orders where status = "In Process";

select MAX(shippedDate) from orders;

select count(*) from products;

desc products;

select distinct productline from products;

select productLine , count(*) as product_count from products group by productLine;

select * from products where productline ="Motorcycles";

select * from offices;

select officecode ,  Count(employeeNumber) as empCnt from employees group by officeCode;

select  e.officecode ,  o.city  , o.state ,  Count(e.employeeNumber)  as employeeCount from employees e join offices o on e.officecode = o.officecode group by officeCode;

select officecode ,  Count(employeeNumber) as empCnt from employees group by officeCode  having count(employeeNumber) > 4;

select officecode , city , Count(employeeNumber) as empCnt
from employees join offices using (officeCode) 
where officecode in (1,2,3) group by officeCode;

select officecode , city , Count(employeeNumber) as empCnt 
from employees join offices using (officeCode) 
where officecode in (1,2,3) group by officeCode 
having empCnt > 4;

select employees.officecode , city , Count(employeeNumber) as empCnt from employees join offices on employees.officeCode = offices.officecode where employees.officecode in (1,2,3) group by employees.officeCode having empCnt > 4;alter 

select c.country ,  count(*) as countryCount from customers c join orders o using (customerNumber) group by country having countrycount > 25;

select * from payments;

select  customerNumber ,  customerName ,sum(amount)  from payments join customers using (customerNumber) where paymentdate > "2004-02-02" group by customernumber;

select 
orderNumber , SUM(quantityOrdered * priceEach) as orderTotal 
from orderDetails 
group by orderNumber 
order by orderTotal desc;

select customerNumber , customerName , orderNumber , SUM(quantityOrdered * priceEach) as orderTotal 
from orderDetails join orders using (orderNumber) join customers using (customerNumber)
group by orderNumber 
order by orderTotal desc;

select customerNumber , employeeNumber ,  firstName , jobtitle ,customerName , orderNumber , SUM(quantityOrdered * priceEach) as orderTotal 
from orderDetails join orders using (orderNumber) join customers using (customerNumber)
join employees on customers.salesRepEmployeeNumber = employees.employeeNumber
group by orderNumber 
order by orderTotal desc;



select orders.customerNumber , 
	customerName, 
	count(*) as totalOrders ,
	employeeNumber as salesEmployee ,
	firstName as salesEmpName
from orders join customers using(customerNumber) 
join employees on salesRepEmployeeNumber = employeeNumber
group by orders.customerNumber;




select customerName , 
	employeeNumber,
	firstName as empName ,
	orderNumber
from orders
join customers
	using (customerNumber)
join employees 
	on customers.salesRepEmployeeNumber =  employees.employeeNumber;  


select 
	employeeNumber,
	firstName as empName ,
	count(*) as totalSalesbyEmp
from orders
join customers
	using (customerNumber)
join employees 
	on customers.salesRepEmployeeNumber =  employees.employeeNumber
group by employeenumber;  



select 
	customerNumber,
 	customerName ,
 	orders.orderNumber ,
 	priceEach,
 	quantityOrdered
 	from customers
join orders
 	using (customerNumber)
join orderdetails on orders.orderNumber = orderdetails.orderNumber;


select 
	customerNumber,
 	customerName ,
 	sum(priceEach * quantityOrdered) as totalPurchase
 	from customers
join orders
 	using (customerNumber)
join orderdetails on orders.orderNumber = orderdetails.orderNumber
where country = "USA"
group by customerNumber having totalPurchase > 80000;


select country , count(*) as totalOrders
from 
	customers 
join orders using (customerNumber) group by country;


select country , 
	orderDate, count(*) as totalOrders 
	from 
	customers 
join orders using (customerNumber) group by country , orderDate;



select * from products where productLine = "Vintage Cars";


select productLine from products where productName = "1917 Grand Touring Sedan";



select * from products 
where productLine = 
	(select productLine from 
	products where productName 
	= "1917 Grand Touring Sedan");


select MSRP from products where productName = "1936 Mercedes-Benz 500K Special Roadster"


select productName , productline from 
products where productLine regexp "car" 
and MSRP > 
(select MSRP from products where productName = "1936 Mercedes-Benz 500K Special Roadster"	);


select productName , productline from 
products where productLine regexp "car" 
and MSRP > 
(select avg(MSRP) from products where productName = "1936 Mercedes-Benz 500K Special Roadster"	);


select count(*) as notplacedAnyOrder from customers
where 
	customerNumber 
NOT IN 
	(select distinct customerNumber from orders);

select customers.customerName  as notplacedAnyOrder from customers
where 
	customerNumber 
NOT IN 
	(select distinct customerNumber from orders);


select distinct(c.customerName ), o.orderNumber 
from customers c left outer join orders o 
on c.customerNumber = o.customerNumber 
where o.customerNumber is null; 


select distinct(customerName ) , d.productCode
from customers c
join orders o
on c.customerNumber = o.customerNumber 
join orderdetails d  on o.orderNumber = d.orderNumber
where productCode ="S18_1749";

select customerNumber from orders
join orderDetails 
using (orderNumber) where productCode = "S18_1749";


select customerName from customers where customerNumber IN
 (select customerNumber from orders
join orderDetails 
using (orderNumber) where productCode = "S18_1749"
);

select max(MSRP) from products where productline like "%truck%";


select * from products where msrp > 
(select max(MSRP) from products where productline like "%truck%");


select customerNumber , count(*) 
as cnt from payments group by 
customerNumber having cnt >= 2;

select * from customers where customerNumber in 
(select customerNumber 
as cnt from payments group by 
customerNumber having cnt >= 2);


select * from customers where customerNumber = ANY
(select customerNumber 
as cnt from payments group by 
customerNumber having cnt >= 2);

select * from products p where msrp > 
(select  avg(msrp) from products where productline = p.productline);


select  distinct (customerNumber) , customerName from customers join payments using(customerNumber);



select avg(amount) from payments;



select (select avg(amount) from payments) as avgPay ,
amount - (select avgPay) as difference 
from payments;


select * from employees where jobtitle regexp "^sale";

select * from employees where jobtitle regexp "rep$";

select * from employees where firstName regexp "^[a-d]";

select * from employees where firstName regexp "^[abcdefgh]";

select * from customers order by customerName;

select * from customers order by city desc limit 5;

select * from orders where comments is null;

select * from orders where shippeddate is null;

select * from customers where state is not null;

select customerName from customers order by customerName limit 12,5;






-------------------------------------------------------------------------------------------

25/04/26
 show tables like "%party%";


select * from user_login where user_login_id="hotwax.user";


desc user_login_history;


show tables like "%login%";


 show tables like "%party%";



