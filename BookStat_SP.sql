create or replace procedure book_stat(out oauthor varchar(50), out otitle varchar(250), out oprice int, out ocount int)
language plpgsql
as $$
declare 
	maxcount bigint;
begin
	create temp table torder (bookid bigint, count int);
	
	insert into torder(bookid, count) select bookid, count(bookid) from orderitem group by bookid;
	
	select max(count) into maxcount from torder;
	
	select b.author, b.title, b.price, t.count
	into oauthor, otitle, oprice, ocount
	from book b 
	inner join torder t on b.id = t.bookid
	where t.count > maxcount * 0.7;
	
	drop table torder;
end;
$$;
