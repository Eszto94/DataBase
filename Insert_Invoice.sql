do
$$
begin
   for counter in 1..15000 loop
   		INSERT INTO Invoice (invoicenumber, orderid, invoicestateid, createdby)
		VALUES (concat('NPG_', cast(counter as varchar(5))), counter, rnd(1, 3), 'Kiss János');
   end loop;
end;
$$;