
# Creo de la Base de Datos
CREATE DATABASE parquimetros;


# selecciono la base de datos sobre la cual voy a hacer modificaciones
use parquimetros;



#-------------------------------------------------------------------------
# Creación Tablas para las entidades

CREATE TABLE Conductores(
	dni INT UNSIGNED NOT NULL,
	nombre VARCHAR(40) NOT NULL,
	apellido VARCHAR(40) NOT NULL,
	direccion VARCHAR(40) NOT NULL,
	telefono INT UNSIGNED NOT NULL,
	registro VARCHAR(40) NOT NULL,
	CONSTRAINT PK_CONDUCTORES PRIMARY KEY(dni)
) ENGINE=InnoDB;



CREATE TABLE Automoviles(
	patente VARCHAR(6) NOT NULL,
	marca VARCHAR(40) NOT NULL,
	modelo VARCHAR(40) NOT NULL,
	color VARCHAR(40) NOT NULL,
	dni INT UNSIGNED NOT NULL,
	PRIMARY KEY(patente)
) ENGINE=InnoDB;


CREATE TABLE Tipos_tarjeta(
	tipo VARCHAR(40) NOT NULL,
	descuento decimal(3,2) NOT NULL,
	CONSTRAINT PK_Tipos_Tarjeta PRIMARY KEY(tipo)
) ENGINE=InnoDB;

CREATE TABLE Inspectores(
	legajo INT UNSIGNED NOT NULL,
	dni    INT UNSIGNED NOT NULL,
	nombre VARCHAR(40)  NOT NULL,
	apellido VARCHAR(40) NOT NULL,
	PRIMARY KEY(legajo)
) ENGINE=InnoDB;


CREATE TABLE Ubicaciones(
	calle VARCHAR(40) NOT NULL,
	altura   INT UNSIGNED NOT NULL,
	tarifa FLOAT(3,2)  NOT NULL,
    PRIMARY KEY(calle,altura)
) ENGINE=InnoDB;



CREATE TABLE Tarjeta(
	id_tarjeta INT UNSIGNED NOT NULL,
	saldo FLOAT(3,2) NOT NULL,
	tipo VARCHAR(40) NOT NULL,
	patente VARCHAR(6) NOT NULL,
	
	PRIMARY KEY(id_tarjeta),
	
	FOREIGN KEY (patente) REFERENCES Automoviles(patente),
	
	FOREIGN KEY (tipo) REFERENCES Tipos_tarjeta(tipo)
	
) ENGINE=InnoDB;



 CREATE TABLE Asociado_con(
	id_asociado_con INT UNSIGNED NOT NULL,
	legajo INT UNSIGNED NOT NULL,
	calle VARCHAR(40) NOT NULL,
	altura INT UNSIGNED NOT NULL,
	dia VARCHAR(2) NOT NULL,
	turno  ENUM ('M','F')	NOT NULL,
	
	PRIMARY KEY(id_asociado_con),
	
	FOREIGN KEY(legajo) REFERENCES Inspectores(legajo),
	 
	FOREIGN KEY(calle,altura) REFERENCES Ubicaciones(calle,altura)
) ENGINE=InnoDB;



 
CREATE TABLE Parquimetros(
	id_parq INT UNSIGNED NOT NULL,
	numero INT UNSIGNED NOT NULL,
	calle VARCHAR(40) NOT NULL,
	altura INT UNSIGNED NOT NULL,
	PRIMARY KEY(id_parq),
	FOREIGN KEY(calle,altura) REFERENCES Ubicaciones(calle,altura)
	
) ENGINE=InnoDB;


 
CREATE TABLE Estacionamientos(
	id_tarjeta INT UNSIGNED NOT NULL,
	id_parq INT UNSIGNED NOT NULL,
	fecha_ent DATE NOT NULL,
	hora_ent TIME NOT NULL,
	fecha_sal DATE ,
	hora_sal TIME ,
	PRIMARY KEY(id_parq,fecha_ent,hora_ent),
	CONSTRAINT FK_estacionamientos_tarjeta
	FOREIGN KEY(id_tarjeta) REFERENCES Tarjeta(id_tarjeta),
	CONSTRAINT FK_estacionamientos_parquimetro
	FOREIGN KEY(id_parq) REFERENCES Parquimetros(id_parq)
) ENGINE=InnoDB;





CREATE TABLE Accede(
	legajo INT UNSIGNED NOT NULL,
	id_parq INT UNSIGNED NOT NULL,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	PRIMARY KEY(id_parq,fecha,hora),
	FOREIGN KEY(legajo) REFERENCES Inspectores(legajo),
	FOREIGN KEY(id_parq) REFERENCES Parquimetros(id_parq)
) ENGINE=InnoDB;

 #inserte hasta acá  
 
 CREATE TABLE Multa(
	numero INT UNSIGNED NOT NULL,
	fecha DATE NOT NULL,
	hora TIME NOT NULL,
	patente VARCHAR(6) NOT NULL,
	id_asociado_con INT UNSIGNED NOT NULL,
	PRIMARY KEY(numero),
	FOREIGN KEY(patente) REFERENCES Automoviles(patente),
	FOREIGN KEY(id_asociado_con) REFERENCES Asociado_con(id_asociado_con)
) ENGINE=InnoDB;



 
CREATE VIEW 
estacionados AS 
SELECT Ubicaciones.calle,Ubicaciones.altura,Tarjeta.patente  FROM Parquimetros 	 
INNER JOIN Ubicaciones on (Parquimetros.calle=Ubicaciones.calle and Parquimetros.altura=Ubicaciones.altura )
INNER JOIN Estacionamientos on (Parquimetros.id_parq=Estacionamientos.id_parq)
INNER JOIN Tarjeta on (Tarjeta.id_tarjeta=Estacionamientos.id_tarjeta)
WHERE Estacionamientos.fecha_sal is NULL AND Estacionamientos.hora_sal is NULL;


INSERT INTO Conductores VALUES (125551890,'Mario','Gonzalez','mitre 333',15674343,'10');

INSERT INTO Conductores VALUES (145551890,'Juan','Perez','alvarado 333',15611143,'11');

INSERT INTO Conductores VALUES (1777771890,'Juan','Perez','alvarado 333',156741243,'12');


INSERT INTO Automoviles VALUES ('bde876','ford','96','rojo',31500000);

INSERT INTO Automoviles VALUES ('bre999','fiat','2003','azul',31500001);

INSERT INTO Automoviles VALUES ('are888','vw','2007','verde',31500002);


INSERT INTO Tipos_tarjeta VALUES ('a',0.15);

INSERT INTO Tipos_tarjeta VALUES ('b',0.10);


INSERT INTO Inspectores VALUES (1,32111456,'Alejandro','Perez');

INSERT INTO Inspectores VALUES (2,34111456,'Oscar','Alvarez');


INSERT INTO Ubicaciones VALUES ('santamarina',34,12.50);

INSERT INTO Ubicaciones VALUES ('santa fe',114,12.50);


INSERT INTO Tarjeta VALUES (1000,987.5,'a','bde876');

INSERT INTO Tarjeta VALUES (2000,187.5,'b','bre999');



INSERT INTO Asociado_con VALUES (100,1,'santamarina',34,'lu','T');

INSERT INTO Asociado_con VALUES (200,2,'santa fe',114,'ma','M');





INSERT INTO Parquimetros VALUES (1000,200,'santamarina',34);

INSERT INTO Parquimetros VALUES (1001,201,'santa fe',114); 


INSERT INTO Estacionamientos VALUES (1000,1000,'2017-01-29','17:15:10' ,NULL,NULL);

INSERT INTO Estacionamientos VALUES (2000,1001,'2017-01-29','10:15:10' ,NULL,NULL);

INSERT INTO Estacionamientos VALUES (2000,1001,'2017-01-29','17:15:10' ,'2017-01-29','18:30:10');



INSERT INTO Accede VALUES (1,1000,'2017-01-29','08:00:00');

INSERT INTO Accede VALUES (2,1001,'2017-01-29','12:00:00');

INSERT INTO Multa VALUES (10000,'2017-01-29','10:00:00','bde876',100);

INSERT INTO Multa VALUES (10001,'2017-01-29','11:15:00','bre999',200);

 #hasta acá anda



    #Doy permisos a venta
	
	#GRANT ALL PRIVILEGES ON parquimetros.* TO admin@localhost IDENTIFIED BY 'admin' WITH GRANT OPTION;
	#CREATE USER venta@localhost IDENTIFIED BY 'venta'; 
	#CREATE USER inspector@localhost IDENTIFIED BY 'inspector';
	#GRANT INSERT ON parquimetros.tarjeta TO venta@localhost;
	
	#Doy permisos a inspectores
		
	GRANT INSERT ON parquimetros.accede TO inspector@localhost;
	GRANT INSERT ON parquimetros.multa TO inspector@localhost;
	GRANT SELECT ON parquimetros.estacionados TO inspector@localhost;





