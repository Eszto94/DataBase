do
$$
begin
   for counter in 1..15000 loop
   		INSERT INTO "Order" (customerid, orderdate, deliveryaddressid, amount, orderstateid, createdby)
		VALUES (rnd(1, 3000), 
			to_date(concat(cast(rnd(2010, 2024) as varchar(4)), substring(concat('0', cast(rnd(1, 12) as varchar(2))), 1, 2), substring(concat('0', cast(rnd(1, 28) as varchar(2))), 1, 2)), 'YYYYMMDD'),
			rnd(2, 20000), 0, rnd(1, 5), 'Kiss János');
		for itemcr in 1..rnd(1, 8) loop
			INSERT INTO orderitem (orderid, bookid, createdby)
			VALUES (counter, rnd(1, 10000), 'Kiss János');
		end loop;
   end loop;
end;
$$;