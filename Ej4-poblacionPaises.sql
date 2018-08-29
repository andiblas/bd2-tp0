--- ultimos censos por pais

drop view if exists view_poblacion;

create view view_poblacion as

select
	p.idcontinente, p.nombre, u.ultimo_censo, c.poblacion as poblacion_censo,
	(c.poblacion * power(get_pop_variation_rate(p.idpais), date_part('year', CURRENT_DATE) - u.ultimo_censo))::integer as poblacion_estimada_actual 
from
(select 
	p.idpais, max(c.anio) as ultimo_censo from censos as c
inner join 
	paises as p
on 
	c.idpais = p.idpais
group by 
	p.idpais) as u

inner join
	paises as p
on 
	p.idpais = u.idpais
inner join 
	censos as c
on 
	c.idpais = u.idpais and c.anio = u.ultimo_censo


--select * from view_poblacion;
