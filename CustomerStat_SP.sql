create or replace procedure customer_stat(out oname varchar(100), out oemail varchar(50), out ophonenumber varchar(20), out oamountsum int, out ocount int)
language plpgsql
as $$
declare
	maxcount bigint;
begin 
	create temp table tcustomer (customerid bigint, count int, amountsum int);
	
	insert into tcustomer select customerid, count(customerid), sum(amount) from "Order" group by customerid;

	select max(count) into maxcount from tcustomer;

	select c.name, c.email, c.phonenumber, t.amountsum, t.count
    into oname, oemail, ophonenumber, oamountsum, ocount 
	from customer c
	inner join tcustomer t on c.id = t.customerid
	where t.count > maxcount * 0.7;

	drop table tcustomer;	
end;
$$;
