create or replace procedure generate_invoice(invoiceid bigint, out oinvoicenumber varchar(20), out oorderdate timestamp, out oamount int, out oathor varchar(50), out otitle varchar(250), 
	out oprice int, out ocountry varchar(50), out ozipcode varchar(15), out ocity varchar(50), out oplacename varchar(50), out oplacetype varchar(20), out ohousenumber varchar(10),
	out oname varchar(100))
language plpgsql
as $$
begin
	select i.invoicenumber, o.orderdate, o.amount, b.author, b.title, b.price, a.country, a.zipcode, a.city, a.publicplacename, a.publicplacetype, a.housenumber, c.name  
	into oinvoicenumber, oorderdate, oamount, oathor, otitle, oprice, ocountry, ozipcode, ocity, oplacename, oplacetype, ohousenumber, oname
	from invoice i
	inner join "Order" o on i.orderid = o.id
	inner join orderitem oi on o.id = oi.orderid
	inner join book b on b.id = oi.bookid
	inner join address a on a.id = o.deliveryaddressid
	inner join customer c on c.id = o.customerid
	where i.id = invoiceid;
end;
$$;