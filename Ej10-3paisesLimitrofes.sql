--query conjunto de 3 paises limitrofes con triple join

select p1.nombre, p2.nombre, p3.nombre from

(select f1.idPais1 as pais1, f1.idPais2 as pais2, f2.idPais1 as pais3, f2.idPais2 as pais4, f3.idPais1 as pais5,
 f3.idPais2 as pais6 from fronteras as f1
inner join fronteras as f2
on f1.idpais1 = f2.idpais2 or f2.idpais1 = f1.idpais2
inner join fronteras as f3
on f3.idpais1 = f1.idpais1 and f3.idpais2 = f2.idpais2) as fron

inner join paises as p1 on p1.idPais = fron.pais1 
inner join paises as p2 on p2.idPais = fron.pais2
inner join paises as p3 on p3.idPais = fron.pais4

;



--query triple frontera con producto cartesiano


select p1.nombre, p2.nombre, p3.nombre from paises p1, paises p2, paises p3 
	WHERE EXISTS
				(select * from fronteras f1, fronteras f2 where 
	   				((f1.idPais1 = p1.idPais and f1.idPais2 = p2.idPais)
						or (f1.idPais2 = p1.idPais and f1.idPais1 = p2.idPais)) 
	  				and ((f2.idPais1 = p1.idPais and f2.idPais2 = p3.idPais) 
						or (f2.idPais2 = p1.idPais and f2.idPais1 = p3.idPais)))
	and EXISTS
				(select * from fronteras f3, fronteras f4 where 
	   				((f3.idPais1 = p1.idPais and f3.idPais2 = p2.idPais) 
							or (f3.idPais2 = p1.idPais and f3.idPais1 = p2.idPais)) 
	  				and ((f4.idPais1 = p2.idPais and f4.idPais2 = p3.idPais) 
							or (f4.idPais2 = p2.idPais and f4.idPais1 = p3.idPais)))
	and p1.idPais < p2.idPais
	and p2.idPais < p3.idPais																 
;
 
