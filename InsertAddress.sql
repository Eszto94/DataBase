do
$$
begin
   for counter in 1..20000 loop
		INSERT INTO address (country, zipcode, city, publicplacetype, publicplacename, housenumber, createdby)
		VALUES('Magyarország', rnd(1011, 8999), concat('city_', cast(rnd(1, 1000) as varchar(4))), concat('placetype_', cast(rnd(1, 10) as varchar(2))),
			concat('placeName_', cast(rnd(1, 250) as varchar(3))), cast(rnd(1, 200) as varchar(3)), 'Kiss János');
   end loop;
end;
$$;