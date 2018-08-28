--query conjunto de 3 paises limitrofes con triple join

select p1.nombre, p2.nombre, p3.nombre, p4.nombre, p5.nombre, p6.nombre from

(select f1.idPais1 as pais1, f2.idPais2 as pais2, f2.idPais1 as pais3, f2.idPais2 as pais4, f3.idPais1 as pais5,
 f3.idPais2 as pais6 from fronteras as f1
inner join fronteras as f2
on f1.idpais1 = f2.idpais2 or f2.idpais1 = f1.idpais2
inner join fronteras as f3
on f3.idpais1 = f1.idpais1 and f3.idpais2 = f2.idpais2) as fron

inner join paises as p1 on p1.idPais = fron.pais1 
inner join paises as p2 on p2.idPais = fron.pais2
inner join paises as p3 on p3.idPais = fron.pais3
inner join paises as p4 on p4.idPais = fron.pais4
inner join paises as p5 on p5.idPais = fron.pais5
inner join paises as p6 on p6.idPais = fron.pais6

;
