USE icxp3_7;

CREATE TABLE categoria (
	nombre_cat VARCHAR(20) NOT NULL,
    sueldo_base FLOAT NOT NULL,
    hora_extra FLOAT NOT NULL, PRIMARY KEY (nombre_cat) );

CREATE TABLE sindicato (
	nombre_sindicato VARCHAR(30) PRIMARY KEY,
    cuota FLOAT );

CREATE TABLE ciudad (
	nombre_ciudad VARCHAR(40) NOT NULL,
    num_habitantes INT NOT NULL,
    PRIMARY KEY (nombre_ciudad) );

CREATE TABLE empleado (
	codigo_empleado VARCHAR(8) NOT NULL,
    dni VARCHAR(10) NOT NULL,
    nss VARCHAR(20) NOT NULL,
    nombre VARCHAR (20) NOT NULL,
    apellido VARCHAR (20) NOT NULL,
    nombre_cat VARCHAR(20) NOT NULL,
    central VARCHAR(30) NULL,
    ciudad_res VARCHAR(40) NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (nombre_cat) REFERENCES categoria (nombre_cat),
    FOREIGN KEY (central) REFERENCES sindicato (nombre_sindicato),
    FOREIGN KEY (ciudad_res) REFERENCES ciudad (nombre_ciudad) );

CREATE TABLE titulo (
    nombre_titulo VARCHAR (30) NOT NULL,
    PRIMARY KEY (nombre_titulo));

CREATE TABLE fijo (
	codigo_empleado VARCHAR(8) NOT NULL,
    antiguedad DATETIME NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado) );

CREATE TABLE temporal (
	codigo_empleado VARCHAR(8) NOT NULL,
    fecha_inicio_cont DATETIME NOT NULL,
    fecha_fin_cont DATETIME NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado) );

CREATE TABLE fecha (
    fecha DATETIME NOT NULL,
    PRIMARY KEY (fecha) );

CREATE TABLE agencia (
	nombre_ciudad VARCHAR(30) NOT NULL,
    nombre_agencia VARCHAR(30) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono INT,
    PRIMARY KEY (nombre_agencia),
    FOREIGN KEY (nombre_ciudad) REFERENCES ciudad (nombre_ciudad) );

CREATE TABLE titulacion (
	nombre_titulo VARCHAR(30) NOT NULL,
    codigo_empleado VARCHAR(8) NOT NULL,
    FOREIGN KEY (nombre_titulo) REFERENCES titulo (nombre_titulo),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado (codigo_empleado) );

CREATE TABLE traslado (
	codigo_empleado VARCHAR(8) NOT NULL,
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado),
    fecha DATETIME NOT NULL,
    FOREIGN KEY (fecha) REFERENCES fecha(fecha),
    nombre_ciudad VARCHAR(30) NOT NULL,
    FOREIGN KEY (nombre_ciudad) REFERENCES agencia(nombre_ciudad),
    nombre_agencia VARCHAR(30) NOT NULL,
    FOREIGN KEY (nombre_agencia) REFERENCES agencia(nombre_agencia),
    PRIMARY KEY(codigo_empleado, fecha, nombre_ciudad, nombre_agencia),
    fecha_fin DATETIME NOT NULL );

CREATE TABLE tipoprestamo (
	codigo_prestamo VARCHAR(10) NOT NULL,
    tipo_interes REAL NOT NULL,
    vigencia DATETIME NOT NULL,
    PRIMARY KEY (codigo_prestamo) ); 

CREATE TABLE peticion (
	codigo_empleado VARCHAR(8) NOT NULL,
    codigo_prestamo VARCHAR(10) NOT NULL,
    fecha DATETIME NOT NULL, 
    UNIQUE (codigo_empleado, codigo_prestamo, fecha),
    PRIMARY KEY (codigo_empleado, codigo_prestamo, fecha),
    FOREIGN KEY (codigo_empleado) REFERENCES fijo(codigo_empleado),
    FOREIGN KEY (codigo_prestamo) REFERENCES tipoprestamo(codigo_prestamo),
    FOREIGN KEY (fecha) REFERENCES fecha(fecha) );