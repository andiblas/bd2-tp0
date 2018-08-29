create
or replace
function get_pop_variation_rate( idpais integer ) returns double precision as $$

select
	power(c1.poblacion::float / c2.poblacion::float, (1 / (c1.anio - c2.anio)::float)) as result1
from
	censos c1,
	censos c2
where
	c1.idPais = $1
	and c2.idPais = $1
	and c1.anio > c2.anio
order by
	c1.anio desc,
	c2.anio desc 
fetch first 1 rows only 

$$ language sql;