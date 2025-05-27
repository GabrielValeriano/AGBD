CREATE TABLE "Empleados" (
	"empleado_id"	NUMERIC NOT NULL,
	"Nombre"	TEXT,
	"Apellido"	TEXT,
	"@gmail"	TEXT,
	"Trabajo"	TEXT,
	"sucursal_id"	NUMERIC NOT NULL
);

CREATE TABLE "Jefes" (
	"Jefe_id"	NUMERIC NOT NULL,
	"Nombre"	TEXT NOT NULL,
	"Apellido"	TEXT NOT NULL,
	"@gmail"	TEXT NOT NULL,
	"Cargo"	TEXT NOT NULL,
	"empleado_id"	NUMERIC NOT NULL
);

CREATE TABLE "Sucursales" (
	"sucursales_id"	NUMERIC NOT NULL,
	"Nombre"	TEXT NOT NULL,
	"Direccion"	TEXT NOT NULL
);


CREATE TABLE "Ventas" (
	"ventas_id"	NUMERIC NOT NULL,
	"cantidad_id"	NUMERIC NOT NULL,
	"sucursal_id"	NUMERIC NOT NULL
);