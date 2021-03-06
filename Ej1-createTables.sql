DROP VIEW IF EXISTS view_poblacion;

DROP TABLE IF EXISTS fronteras;
DROP TABLE IF EXISTS censos;
DROP TABLE IF EXISTS paises;
DROP TABLE IF EXISTS continentes;

CREATE TABLE continentes(
	idContinente int not null,
	nombre varchar(30)
	);
	
CREATE TABLE paises(
	idPais int not null,
	nombre varchar(50),
	independencia date,
	idContinente int,
	forma_de_gobierno varchar(50),
	poblacion_estimada int
	);

CREATE TABLE censos(
	idPais int,
	anio int,
	poblacion int
	);
	
CREATE TABLE fronteras(
	idPais1 int,
	idPais2 int,
	extension_km int
	);

ALTER TABLE continentes add PRIMARY KEY (idContinente);

ALTER TABLE paises add PRIMARY KEY (idPais);
ALTER TABLE paises add FOREIGN KEY (idContinente) REFERENCES continentes(idContinente);

ALTER TABLE censos add PRIMARY KEY (idPais, anio);
ALTER TABLE censos add FOREIGN KEY (idPais) REFERENCES paises(idPais);

ALTER TABLE fronteras add PRIMARY KEY (idPais1, idPais2);
ALTER TABLE fronteras add FOREIGN KEY (idPais1) REFERENCES paises(idPais);
ALTER TABLE fronteras add FOREIGN KEY (idPais2) REFERENCES paises(idPais);