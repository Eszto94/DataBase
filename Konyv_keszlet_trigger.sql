create or replace function book_piece_order_amount()
returns trigger as $$
begin 
  update book set piece = piece - 1 where id = TG_ARGV[1] and piece > 0;
  update "Order" set amount = amount + (select price from book where id = TG_ARGV[1])  where id = TG_ARGV[0];
end;
$$ language plpgsql;

create trigger insert_trigger
after insert on orderitem
for each row 
execute function book_piece_order_amount(orderid, bookid);

