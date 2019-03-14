USE icxp3_7;

CREATE TABLE categoria (
    id INT NOT NULL AUTO_INCREMENT,
	nombre_cat VARCHAR(20) NOT NULL,
    sueldo_base FLOAT NOT NULL,
    hora_extra FLOAT NOT NULL,
    PRIMARY KEY (id) );

CREATE TABLE sindicato (
    id INT NOT NULL AUTO_INCREMENT,
	nombre_sindicato VARCHAR(30) NOT NULL,
    cuota FLOAT NOT NULL,
    PRIMARY KEY (id) );

CREATE TABLE ciudad (
    id INT NOT NULL AUTO_INCREMENT,
	nombre_ciudad VARCHAR(40) NOT NULL,
    num_habitantes INT NOT NULL,
    PRIMARY KEY (id) );

CREATE TABLE empleado (
	codigo_empleado VARCHAR(8) NOT NULL,
    dni VARCHAR(10) NOT NULL,
    nss VARCHAR(20) NOT NULL,
    nombre VARCHAR (20) NOT NULL,
    apellido VARCHAR (20) NOT NULL,
    id_nombre_cat INT NOT NULL,
    id_central INT NULL,
    id_ciudad_res INT NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (id_nombre_cat) REFERENCES categoria (id),
    FOREIGN KEY (id_central) REFERENCES sindicato (id),
    FOREIGN KEY (id_ciudad_res) REFERENCES ciudad (id) );

CREATE TABLE titulo (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_titulo VARCHAR (30) NOT NULL,
    PRIMARY KEY (id));

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
    id INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    PRIMARY KEY (id) );

CREATE TABLE agencia (
    id INT NOT NULL AUTO_INCREMENT,
	id_ciudad INT NOT NULL,
    nombre_agencia varchar(40) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono INT,
    PRIMARY KEY (id, id_ciudad),
    FOREIGN KEY (id_ciudad) REFERENCES ciudad (id) );

CREATE TABLE titulacion (
    codigo_empleado VARCHAR(8) NOT NULL,
	id_titulo INT NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado (codigo_empleado),
    FOREIGN KEY (id_titulo) REFERENCES titulo (id) );

CREATE TABLE traslado (
	codigo_empleado VARCHAR(8) NOT NULL,
    id_fecha INT NOT NULL,
    id_ciudad INT NOT NULL,
    id_agencia INT NOT NULL,
    fecha_fin DATETIME NOT NULL,
    PRIMARY KEY(codigo_empleado),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado),
    FOREIGN KEY (id_fecha) REFERENCES fecha(id),
    FOREIGN KEY (id_agencia, id_ciudad) REFERENCES agencia(id, id_ciudad) );

CREATE TABLE tipoprestamo (
    id INT NOT NULL AUTO_INCREMENT,
	codigo_prestamo VARCHAR(10) NOT NULL,
    tipo_interes REAL NOT NULL,
    vigencia DATETIME NOT NULL,
    PRIMARY KEY (id) ); 

CREATE TABLE peticion (
	codigo_empleado VARCHAR(8) NOT NULL,
    id_codigo_prestamo INT NOT NULL,
    id_fecha INT NOT NULL, 
    UNIQUE (codigo_empleado, id_codigo_prestamo, fecha),
    PRIMARY KEY (codigo_empleado, id_codigo_prestamo, id_fecha),
    FOREIGN KEY (codigo_empleado) REFERENCES fijo(codigo_empleado),
    FOREIGN KEY (id_codigo_prestamo) REFERENCES tipoprestamo(id),
    FOREIGN KEY (id_fecha) REFERENCES fecha(id) );