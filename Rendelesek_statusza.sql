select o.orderdate, o.amount, c."name", c.email, o2."name" as status from "Order" o 
inner join customer c on c.id = o.customerid 
inner join orderstate o2 on o2.id = o.orderstateid 