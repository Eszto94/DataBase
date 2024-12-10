create or replace procedure create_invoice(orderid bigint, createdby varchar(50))
language plpgsql
as $$
declare
	number bigint;
	invoicenumber varchar(20);
begin
	select max(id) from invoice into number;
	select concat(cast((number + 1) as varchar(15)), '_', cast(now() as varchar(4))) into invoicenumber;
	insert into invoice(invoicenumber, orderid, invoicestateid, createdby) values (invoicenumber, orderid, 1, createdby);
end;
$$;
