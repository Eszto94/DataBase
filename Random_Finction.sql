CREATE OR REPLACE FUNCTION public.rnd(a integer, b integer)
 RETURNS integer
 LANGUAGE plpgsql
AS $function$
begin
	return floor(random() * (b - a) + a);
end;
$function$
;