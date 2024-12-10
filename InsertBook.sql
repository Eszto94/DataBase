do
$$
begin
   for counter in 1..10000 loop
	INSERT INTO book (author, title, publishedin, isbn, publisher, "language", price, piece, createdby)
	VALUES (concat('author_', cast(rnd(1, 1000) as varchar(4))), concat('title_', cast(rnd(1, 1000) as varchar(4))), rnd(1950, 2024), concat('ISBN: ', cast(counter as varchar(5))), 
		concat('publisher_', cast(rnd(1, 70) as varchar(2))), 'magyar', rnd(2500, 10000), rnd(1, 25), 'Kiss János');
   end loop;
end;
$$;