select c."name", c.email, c.phonenumber, o.orderdate, b.author, b.title, b.price from customer c 
inner join "Order" o on c.id = o.customerid 
inner join orderitem o2 on o.id = o2.orderid 
inner join book b on b.id = o2.bookid 