COPY continentes (idcontinente, nombre) FROM 'C:/tmp/continente.csv' DELIMITER ',' CSV HEADER;
COPY paises(idpais, nombre, independencia, idContinente, forma_de_gobierno, poblacion_estimada) FROM 'C:/tmp/pais.csv' DELIMITER ',' CSV HEADER;
COPY censos (idPais, anio, poblacion) FROM 'C:/tmp/censo.csv' DELIMITER ',' CSV HEADER;
COPY fronteras (idpais1, idpais2, extension_km) FROM 'C:/tmp/frontera.csv' DELIMITER ',' CSV HEADER;