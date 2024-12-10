do
$$
begin
   for counter in 1..3000 loop
   		INSERT INTO customer (name, email, phonenumber, password, billingaddressid, regionid, createdby)
		VALUES (concat('Név_', cast(counter as varchar(4))), concat('nev_', cast(counter as varchar(4)), 'gmail.com'), concat('+36 30 234-', cast(counter as varchar(4))),
			concat('password_', cast(counter as varchar(4))), rnd(1, 20000), rnd(1, 5), 'Kiss János');		
   end loop;
end;
$$;