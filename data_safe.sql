DROP database IF EXISTS data_safe;
CREATE database IF NOT EXISTS data_safe;
use data_safe;

CREATE TABLE empleado (
	codigo_empleado INT NOT NULL,
    dni VARCHAR(10) NOT NULL,
    nss VARCHAR(20) NOT NULL,
    nombre VARCHAR (20) NOT NULL,
    apellido VARCHAR (20) NOT NULL,
    nombre_cat INT NOT NULL,
    central INT NULL,
    ciudad_res INT NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (nombre_cat) REFERENCES categoria (id),
    FOREIGN KEY (central) REFERENCES sindicato (id),
    FOREIGN KEY (ciudad_res) REFERENCES ciudad (id) );

CREATE TABLE titulo (
	id INT NOT NULL auto_increment,
    nombre_titulo VARCHAR (40) NOT NULL );

CREATE TABLE fijo (
	codigo_empleado INT NOT NULL,
    antiguedad DATETIME NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado) );

CREATE TABLE temporal (
	codigo_empleado INT NOT NULL,
    fecha_inicio_cont DATETIME NOT NULL,
    fecha_fin_cont DATETIME NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado) );

CREATE TABLE ciudad (
	nombre_ciudad VARCHAR(40) NOT NULL,
    num_habitantes INT NOT NULL,
    PRIMARY KEY (nombre_ciudad) );

CREATE TABLE fecha (
	id INT NOT NULL auto_increment,
    fecha DATETIME NOT NULL, PRIMARY KEY (id) );

CREATE TABLE agencia (
	nombre_ciudad VARCHAR(50) NOT NULL,
    nombre_agencia VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono INT,
    PRIMARY KEY (nombre_agencia),
    FOREIGN KEY (nombre_ciudad) REFERENCES ciudad (nombre_ciudad) );

CREATE TABLE titulacion (
	nombre_titulo VARCHAR(50) NOT NULL,
    codigo_empleado INT NOT NULL,
    FOREIGN KEY (nombre_titulo) REFERENCES titulo (nombre_titulo),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado (codigo_empleado) );

CREATE TABLE categoria (
	nombre_cat VARCHAR(50) NOT NULL,
    sueldo_base FLOAT NOT NULL,
    hora_extra FLOAT NOT NULL, PRIMARY KEY (nombre_cat) );

CREATE TABLE traslado (
	codigo_empleado INTEGER NOT NULL,
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado),
    fecha DATETIME NOT NULL,
    FOREIGN KEY (fecha) REFERENCES fecha(fecha),
    nombre_ciudad VARCHAR(30) NOT NULL,
    FOREIGN KEY (nombre_ciudad) REFERENCES agencia(nombre_ciudad),
    nombre_agencia VARCHAR(30) NOT NULL,
    FOREIGN KEY (nombre_agencia) REFERENCES agencia(nombre_agencia),
    PRIMARY KEY(codigo_empleado, fecha, nombre_ciudad, nombre_agencia),
    fecha_fin DATETIME NOT NULL );

CREATE TABLE sindicato (
	nombre_sindicato VARCHAR(30) PRIMARY KEY,
    cuota FLOAT );

CREATE TABLE peticion (
	codigo_usuario VARCHAR(50) NOT NULL,
    codigo_prestamo FLOAT NOT NULL,
    fecha DATE NOT NULL, PRIMARY KEY (codigo_usuario, codigo_prestamo, fecha),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado),
    FOREIGN KEY (codigo_prestamo) REFERENCES prestamo(codigo_prestamo),
    FOREIGN KEY (fecha) REFERENCES fecha );

CREATE TABLE tipoprestamo (
	codigo_prestamo VARCHAR(50) NOT NULL,
    tipo_interes REAL NOT NULL,
    vigencia DATE NOT NULL );