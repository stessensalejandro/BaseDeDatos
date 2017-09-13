


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