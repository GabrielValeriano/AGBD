CREATE TABLE "Empleados" (
	"empleado_id"	INTEGER NOT NULL,
	"Nombre"	VARCHAR(20) ,
	"Apellido"	VARCHAR(20) ,
	"@gmail"	VARCHAR(20) ,
	"Trabajo"	VARCHAR(20) NOT NULL,
	"sucursal_id"	INTEGER NOT NULL,
	PRIMARY KEY("empleado_id" AUTOINCREMENT),
	FOREIGN KEY ("sucursal_id") REFERENCES Sucursales ("sucursal_id"),
);

CREATE TABLE "Jefes" (
	"Jefe_id"	INTEGER NOT NULL,
	"Nombre"	VARCHAR(20) NOT NULL,
	"Apellido"	VARCHAR(20) NOT NULL,
	"@gmail"	VARCHAR(20) NOT NULL,
	"Cargo"	 VARCHAR(20) NOT NULL,
	"empleado_id"	INTEGER NOT NULL;
	PRIMARY KEY("Jefe_id" AUTOINCREMENT),
	FOREIGN KEY ("empleado_id") REFERENCES Empleados ("empleado_id"),
);

CREATE TABLE "Sucursales" (
	"sucursal_id"	INTEGER NOT NULL,
	"Nombre"	VARCHAR(20) NOT NULL,
	"Direccion"	VARCHAR(20) NOT NULL,
	PRIMARY KEY("sucursal_id" AUTOINCREMENT),
);


CREATE TABLE "Ventas" (
	"ventas_id"	INTEGER NOT NULL,
	"cantidad_id"	INTEGER NOT NULL,
	"sucursal_id"	INTEGER NOT NULL,
	PRIMARY KEY("ventas_id" AUTOINCREMENT),
	FOREIGN KEY ("cantidad_id") REFERENCES Cantidades ("cantidad_id"),
	FOREIGN KEY ("sucursal_id") REFERENCES Sucursales ("sucursal_id"),
);

CREATE TABLE "Productos" (
	"producto_id"	INTEGER NOT NULL,
	"cantidad_id"	INTEGER NOT NULL,
	"Producto"	VARCHAR(30) NOT NULL,
	PRIMARY KEY("producto_id" AUTOINCREMENT),
	FOREIGN KEY ("cantidad_id") REFERENCES Cantidades ("cantidad_id"),
);

CREATE TABLE "Cantidades" (
	"cantidad_id"	INTEGER NOT NULL,
	"cantidad"	INTEGER NOT NULL,
	PRIMARY KEY("cantidad_id" AUTOINCREMENT),
);

CREATE TABLE "Ganancias" (
	"ganancia_id"	INTEGER NOT NULL,
	"ganancia_mes"	INTEGER NOT NULL,
	"sucursal_id"	INTEGER NOT NULL,
	PRIMARY KEY("ganancia_id" AUTOINCREMENT),
	FOREIGN KEY ("sucursal_id") REFERENCES Sucursales ("sucursal_id"),
);

CREATE TABLE "MetodoPago" (
	"pago_id"	INTEGER NOT NULL,
	"pago"	INTEGER NOT NULL,
	"ventas_id"	INTEGER NOT NULL,
	PRIMARY KEY("pago_id" AUTOINCREMENT),
	FOREIGN KEY ("ventas_id") REFERENCES Ventas ("ventas_id"),
);

BEGIN TRANSACTION;
INSERT INTO "Sucursales" VALUES (1,'Stronge Victory','La Plata-calle Av 189'),
 (2,'Stronge Victory','Capital-9 de Julio 1842'),
 (3,'Stronge Victory Vintage','Flores-Av.Nazca 1440');
INSERT INTO "Jefes" VALUES (1,'Gabriel','Valeriano','gabriel01@gmail.com','Director General'),
 (2,'Miguel','Diaz','Miguel02@gmail.com','CMO(Chief Marketing Officer)'),
 (3,'Joel','kari','Joel03@gmail.com','COO(Chief Operating Officer)'),
 (4,'Thiago','Gomez','Thiago04@gmail.com','CFO(Chief Financial Officer)');
INSERT INTO "Empleados" VALUES (1,'Briseida','Camacho','Briseida11@gmail.com','Diseñadora de Moda',2,NULL),
 (2,'Sol','Perez','Sol12@gmail.com','Comunnity Manager',2,NULL),
 (3,'Federico','Villace','Federico13@gmail.com','Desarrollador Web',1,NULL),
 (4,'Tomas','Mayorca','Tomas14@gmail.com','Analista de Datos',1,NULL),
 (5,'Jose','Torres','Jose15@gmail.com','Encargado',1,NULL),
 (6,'Luis','Flores','Luis16@gmail.com','Encargado',2,NULL),
 (7,'Alejandra','Montero','Alejandra17@gmail.com','Encargado',3,NULL),
 (8,'Belen','Ramirez','Belen18@gmail.com','Vendedora',1,NULL),
 (9,'Agustin','Lomas','Agustin19@gmail.com','Vendedor',2,NULL),
 (10,'Gustavo','Garcia','Gustavo20@gmail.com','Vendedor',3,NULL),
 (11,'Malena','Blanco','Malena21@gmail.com','Cajera',1,NULL),
 (12,'Kevin','Kury','Kevin22@gmail.com','Cajero',2,NULL),
 (13,'Morena','Salomon','Morena23@gmail.com','Cajera',3,NULL);
INSERT INTO "Productos" VALUES (1,'Remera Oversied',15000),
 (2,'Buzo Boxy Fit',10000),
 (3,'Pantalon Baggy',15000),
 (4,'Remera Boxy Fit',15000),
 (5,'Bermudas Baggy',5000),
 (6,'Gorras Cerradas',20);
COMMIT;