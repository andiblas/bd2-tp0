--funcion poblacion de continente especifico

drop function if exists get_pop_by_continent(integer);

create or replace function 
get_pop_by_continent(continente integer) returns bigint as
$$

select 
	sum(poblacion_estimada_actual) as total 
from 
	view_poblacion
where 
	idContinente = continente

$$
Language SQL;

--select get_pop_by_continent(5);