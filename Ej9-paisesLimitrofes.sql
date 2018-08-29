-- query paises limites ordenado por extension

select
	p1.nombre as nombre_pais1,
	p2.nombre as nombre_pais2,
	f.extension_km
from
	fronteras as f
inner join paises as p1 on
	f.idpais1 = p1.idpais
inner join paises as p2 on
	f.idpais2 = p2.idpais
order by
	f.extension_km desc