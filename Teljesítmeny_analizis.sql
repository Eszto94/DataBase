explain analyze select c.name, c.email, o.orderdate, b.author, b.title, b.price from customer c 
inner join "Order" o on c.id = o.customerid 
inner join orderitem oi on o.id = oi.orderid 
inner join book b on b.id = oi.id 
where o.orderdate = (select max(orderdate) from "Order" where customerid = c.id)