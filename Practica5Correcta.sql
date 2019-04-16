create database Biblioteca2
use Biblioteca2

create table Estudiante(
	IdAlumno int identity (1,1) not null,
	PRIMARY KEY (IdAlumno),
	Matricula int not null,
	IdCarrera int not null,
	Apellido_A varchar(50) not null,
	Apellido2_A varchar(50) not null,
	cStatus_A char(1) not null,
	Sexo char(1),
	Nombre_A varchar(50) not null,
	FOREIGN KEY (IdCarrera) REFERENCES Carrera (IdCarrera)
);



create table Libro(
	IdLibro int identity (1,1)NOT NULL,
	PRIMARY KEY (IdLibro),
	Titulo varchar(50),
	ISBN int,
	IdAutor int not null,
	IdEditorial int not null,
	cStatus_L char(1) not null,
	IdSector int not null,
	IdGenero int not null,
	FOREIGN KEY (IdAutor) REFERENCES Autor (IdAutor),
	FOREIGN KEY (IdEditorial) REFERENCES Editorial (IdEditorial),
	FOREIGN KEY (IdSector) REFERENCES Sector (IdSector),
	FOREIGN KEY (IdGenero) REFERENCES Genero (IdGenero)
);

create table Autor(
	IdAutor int identity (1,1) NOT NULL,
	PRIMARY KEY (IdAutor),
	Nombre_Autor varchar(50) not null,
	Apellido_Autor varchar(50) not null
);

create table Editorial(
	IdEditorial int identity (1,1) NOT NULL,
	PRIMARY KEY(IdEditorial),
	Empresa varchar(50) not null,

);

create table Sector(
	IdSector int identity (1,1) NOT NULL,
	PRIMARY KEY(IdSector),
	Seccion varchar(50)
);

create table Factura(
	IdFactura int primary key,
	fecha_Factura date not null,
	IdPrestamo int not null,
	IdAlumno int not null,
	CONSTRAINT fk_Prestamo FOREIGN KEY (IdPrestamo) REFERENCES Prestamo (IdPrestamo),
	CONSTRAINT fk_Alumno FOREIGN KEY (IdAlumno) REFERENCES Alumno (IdAlumno)

);

create table Prestamo(
	IdPrestamo int identity (1,1) NOT NULL,
	PRIMARY KEY(IdPrestamo),
	Fecha_Prestamo date not null,
	Fecha_Exp date not null,
	Entrega date not null,
	IdAlumno int not null,
	IdLibro int not null,
	CONSTRAINT fk_Alumno FOREIGN KEY (IdAlumno) REFERENCES Estudiante (IdAlumno),
	CONSTRAINT fk_Libro FOREIGN KEY (IdLibro) REFERENCES Libro (IdLibro)
);

drop table Prestamo

create table Multa(
	IdMulta int identity (1,1) NOT NULL,
	PRIMARY KEY (IdMulta),
	Cargo money not null,
	IdLibro int not null,
	IdAlumno int not null,
	IdPrestamo int not null,
	FOREIGN KEY (IdPrestamo) REFERENCES Prestamo (IdPrestamo),
	FOREIGN KEY (IdLibro) REFERENCES Libro (IdLibro),
	FOREIGN KEY (IdAlumno) REFERENCES Estudiante (IdAlumno),
);

create table Carrera(
	IdCarrera int IDENTITY (1,1),
	PRIMARY KEY (IdCarrera),
	vCarrera varchar(50) not null
);

create table Genero(
	IdGenero int identity (1,1) not null,
	PRIMARY KEY(IdGenero),
	vGenero varchar(50) not null
);


select *from Carrera

INSERT INTO Carrera VALUES ('LCC');
INSERT INTO Carrera VALUES ('LMAD');
INSERT INTO Carrera VALUES ('LA');
INSERT INTO Carrera VALUES ('LSTI');
INSERT INTO Carrera VALUES ('LM');
INSERT INTO Carrera VALUES ('LF');

drop table Estudiante

SELECT *FROM Estudiante

insert into Estudiante values(1234567,1,'Martinez','Garcia','1','M','Victor Hugo');
insert into Estudiante values(1234967,1,'Martinez','Gutierrez','0','M','Hugo');
insert into Estudiante values(1244467,1,'Garcia','Gutierrez','1','M','Victor');
insert into Estudiante values(1234568,1,'Aguilar','Acevedo','1','M','MANUEL');
insert into Estudiante values(1234569,2,'Acevedo','Aguilar','0','F','MARGARITA');
insert into Estudiante values(1234570,3,'Aguilar','Garcia','1','F','MARÍA DEL CARMEN');
insert into Estudiante values(1234571,4,'Canto','Garcia','1','M','FERNANDO');
insert into Estudiante values(1234572,5,'Martinez','Canto','1','M','ROBERTO ');
insert into Estudiante values(1234573,6,'Martinez','Garcia','1','M','CARLOS');
insert into Estudiante values(1234574,1,'Acosta','Garcia','1','M','EDUARDO ');
insert into Estudiante values(1234575,2,'Alvarro','Acosta','0','M','RAFAEL');
insert into Estudiante values(1234576,3,'Martinez','Alvarado','1','M','DAVID ');
insert into Estudiante values(1234577,4,'Alvarado','Garcia','1','F','JOSEFINA');
insert into Estudiante values(1234578,5,'Altamirano','Alvarro','1','M','FRANCISCO JAVIER');
insert into Estudiante values(1234579,6,'Altamirano','Mendoza','1','M','MARIO');
insert into Estudiante values(1234580,1,'Medellín','Mendoza','1','M','ARMANDO');
insert into Estudiante values(1234581,2,'Medellín','Villanueva','1','F','MARTHA');
insert into Estudiante values(1234582,3,'Martinez','Villanueva','1','F','ELIZABETH ');
insert into Estudiante values(1234583,4,'Andrade','Anzures','1','F','GLORIA');
insert into Estudiante values(1234584,5,'Andrade','Arredondo','1','F','GABRIELA');
insert into Estudiante values(1234585,6,'Martinez','Arredondo','0','M','ANGEL');
insert into Estudiante values(1234586,1,'Arredondo','Garcia','1','M','SILVIA');
insert into Estudiante values(1234587,2,'Lopez','Arredondo','1','M','GABRIEL');
insert into Estudiante values(1234588,3,'Arnaud','Garcia','1','M','PABLO');
insert into Estudiante values(1234589,4,'Martinez','Arnaud','1','M','RUBEN');
insert into Estudiante values(1234590,5,'Garcia','Garcia','1','M','FELIPE');
insert into Estudiante values(1234591,6,'Garza','Miller','1','M','JAIME ');
insert into Estudiante values(1234592,1,'Miller','Light','1','M','JULIO CESAR');
insert into Estudiante values(1234593,2,'Garza','Garcia','0','M','DIEGO');
insert into Estudiante values(1234594,3,'Martinez','Miller','1','F','ARACELI');
insert into Estudiante values(1234595,4,'Araujo','Guerrero','1','F','ANDREA');
insert into Estudiante values(1234596,5,'Guerrero','Rodriguez','1','F','ISABEL');
insert into Estudiante values(1234597,6,'Peñuela','Araujo','1','F','MARÍA TERESA');
insert into Estudiante values(1234598,1,'Duran','Araujo','1','F','ADRIANA');
insert into Estudiante values(1234599,2,'Martinez','Duran','1','F','LUCIA');
insert into Estudiante values(1234600,3,'Duran','Garcia','1','F','DIANA');
insert into Estudiante values(1234601,4,'Araujo','Garcia','1','F','LEONA');
insert into Estudiante values(1234602,5,'Martinez','Araujo','0','F','CAITLYN');
insert into Estudiante values(1234603,6,'Rodriguez','Peñuela','1','M','GUSTAVO');
insert into Estudiante values(1234604,1,'Peñuela','Garcia','0','M','JUAN ');
insert into Estudiante values(1234605,2,'Martinez','Rodriguez','1','F','GUADALUPE');
insert into Estudiante values(1234606,3,'Martinez','Arbea','1','F','JUANA ');
insert into Estudiante values(1234607,4,'Arbea','Garcia','1','M','GERARDO');
insert into Estudiante values(1234608,5,'Aquiles','Brinco','1','M','JESUS');
insert into Estudiante values(1234609,6,'Martinez','Aquiles','1','M','UZIEL');
insert into Estudiante values(1234610,1,'Aquiles','Garcia','1','M','BRUCE');

Select *from Editorial

insert into Editorial values('Gedisa');
insert into Editorial values('Inde');
insert into Editorial values('Routledge');
insert into Editorial values('Oxford University Press');
insert into Editorial values('Siglo XXI');
insert into Editorial values('Wilson Editorial');
insert into Editorial values('CSIC');
insert into Editorial values('McGraw-Hill');
insert into Editorial values('Trotta');
insert into Editorial values('Arco Libros');

insert into Editorial values('Trea');
insert into Editorial values('Los Libros de la Catarata');
insert into Editorial values('Universidad de Alcalá');
insert into Editorial values('Istmo');
insert into Editorial values('Routledge');
insert into Editorial values('Fundación BBVA');
insert into Editorial values('Visor');
insert into Editorial values('John Benjamins Publishing');
insert into Editorial values('Universidad de Oviedo');
insert into Editorial values('Akal');

select *from Sector

insert into Sector values('Estanteria 1');
insert into Sector values('Estanteria 2');
insert into Sector values('Estanteria 3');
insert into Sector values('Estanteria 4');
insert into Sector values('Estanteria 5');
insert into Sector values('Estanteria 6');
insert into Sector values('Estanteria 7');
insert into Sector values('Estanteria 8');
insert into Sector values('Estanteria 9');
insert into Sector values('Estanteria 10');

select *from Genero

insert into Genero values('Terror');
insert into Genero values('Psicologico');
insert into Genero values('Ciencia Ficcion');
insert into Genero values('Fantasia');
insert into Genero values('Romance');
insert into Genero values('Juvenil');
insert into Genero values('Erotico');
insert into Genero values('Biografico');
insert into Genero values('Educativo');
insert into Genero values('Cocina');
insert into Genero values('Comedia');

Select *from Autor

insert into Autor values ('Stephen','King');
insert into Autor values ('Dross','Rootzank');
insert into Autor values ('Juanito','Banana');
insert into Autor Values ('Uziel','Peñuela');
insert into Autor Values ('Victor','Martinez');
insert into Autor Values ('Dan','Brown');
insert into Autor values ('Octavio','Paz');
insert into Autor values ('Gael','Marquez');
insert into Autor values ('Joseph','Conrad');
insert into Autor values ('John','Wick');

insert into Autor values ('Hugo','Garcia');
insert into Autor values ('Uziel','Martinez');
insert into Autor values ('Victor','Garza');
insert into Autor values ('Bruce','Araujo');
insert into Autor values ('Steve','King');
insert into Autor values ('Malcom','Wilkerson');
insert into Autor values ('Reese','Wilkerson');
insert into Autor values ('Hall','Wilkerson');
insert into Autor values ('Wilson','Wilkerson');
insert into Autor values ('Veigar','Dreyar');

select *from Libro

insert into Libro values('50 Sombras de Wilson',1234567890,13,13,'1',10,7);
insert into Libro values('Focus',1234567891,1,1,'1',1,5);
insert into Libro values('Avengers',1234567892,2,3,0,'1',3);
insert into Libro values('Luna de Pluton',1234567893,1,2,'1',4,5);
insert into Libro values('Mas Barato por Docena',1234567894,1,1,'1',1,11);
insert into Libro values('Calculo',1234567895,2,3,'1',1,9);
insert into Libro values('El diario de Britget',1234567896,3,5,'0',1,11);
insert into Libro values('Proyecto Esposa',1234567897,14,5,'1',1,11);
insert into Libro values('La vuelta al mundo en 80 dias',1234567810,6,6,'1',1,11);
insert into Libro values('Emocion dura y pura',1234567811,16,1,'1',3,5);
insert into Libro values('La Española',1334567890,18,1,'1',3,5);
insert into Libro values('Nuestra Noche',1434567890,19,4,'1',3,5);
insert into Libro values('Antes de ti',5234567890,20,3,'1',3,5);
insert into Libro values('La Sombra del viento',6234567890,10,11,'1',3,5);
insert into Libro values('El Señor de los anillos',2234567890,10,17,'0',4,4);
insert into Libro values('El señor de los anillos: Two Towers',3234567890,10,17,'1',4,4);
insert into Libro values('El Hobbit',1334567890,10,17,'1',4,4);
insert into Libro values('Harry Potter y el Caliz de Fuego',1434567890,5,4,'1',4,4);
insert into Libro values('Las Cronicas de Narnia',1534567890,7,6,'1',4,5);
insert into Libro values('El Jugador',1634567890,8,9,'1',5,5);
insert into Libro values('El Juego de Ender',1734567890,9,3,'1',5,5);
insert into Libro values('Snow Crash',1834567890,13,2,'1',5,5);
insert into Libro values('Ubik',1234507890,16,8,'1',5,5);
insert into Libro values('Anatema',1234067890,17,20,'0',5,5);

select *from Prestamo

insert into Prestamo values('1-04-2019','5-05-2019','2-02-2019', 5, 6);
insert into Prestamo values('3-01-2019','8-05-2019','4-01-2019', 5, 10);
insert into Prestamo values('4-03-2019','9-03-2019','5-03-2019', 3, 3);
insert into Prestamo values('3-02-2019','8-02-2019','9-02-2019', 4, 4);
insert into Prestamo values('4-04-2019','8-04-2019','9-04-2019', 6, 6);


select *from Multa
insert into Multa values(50,6,5,1);
insert into Multa values(50,10,35,2);