USE icxp3_7;

CREATE TABLE IF NOT EXISTS categoria (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_cat VARCHAR(20) NOT NULL,
    sueldo_base FLOAT NOT NULL,
    hora_extra FLOAT NOT NULL,
    PRIMARY KEY (id) );

CREATE TABLE IF NOT EXISTS sindicato (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_sindicato VARCHAR(30) NOT NULL,
    cuota FLOAT NOT NULL,
    PRIMARY KEY (id) );

CREATE TABLE IF NOT EXISTS ciudad (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_ciudad VARCHAR(40) NOT NULL,
    num_habitantes INT NOT NULL,
    PRIMARY KEY (id) );

CREATE TABLE IF NOT EXISTS empleado (
    codigo_empleado VARCHAR(8) NOT NULL,
    dni VARCHAR(10) NOT NULL,
    nss VARCHAR(20) NOT NULL,
    nombre VARCHAR (20) NOT NULL,
    apellido VARCHAR (20) NOT NULL,
    id_nombre_cat INT NOT NULL,
    id_central INT NULL,
    id_ciudad_res INT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (id_nombre_cat) REFERENCES categoria (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_central) REFERENCES sindicato (id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_ciudad_res) REFERENCES ciudad (id) ON UPDATE CASCADE ON DELETE SET NULL);

CREATE TABLE IF NOT EXISTS titulo (
    id INT NOT NULL AUTO_INCREMENT,
    nombre_titulo VARCHAR (30) NOT NULL,
    PRIMARY KEY (id));

CREATE TABLE IF NOT EXISTS fijo (
    codigo_empleado VARCHAR(8) NOT NULL,
    antiguedad DATETIME NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS temporal (
    codigo_empleado VARCHAR(8) NOT NULL,
    fecha_inicio_cont DATETIME NOT NULL,
    fecha_fin_cont DATETIME NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS fecha (
    id INT NOT NULL AUTO_INCREMENT,
    fecha DATETIME NOT NULL,
    PRIMARY KEY (id) );

CREATE TABLE IF NOT EXISTS agencia (
    id INT NOT NULL AUTO_INCREMENT,
    id_ciudad INT NOT NULL,
    nombre_agencia varchar(40) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(12),
    PRIMARY KEY (id, id_ciudad),
    FOREIGN KEY (id_ciudad) REFERENCES ciudad (id) ON UPDATE CASCADE ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS titulacion (
    codigo_empleado VARCHAR(8) NOT NULL,
    id_titulo INT NOT NULL,
    PRIMARY KEY (codigo_empleado),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado (codigo_empleado) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_titulo) REFERENCES titulo (id) ON UPDATE CASCADE ON DELETE RESTRICT);

CREATE TABLE IF NOT EXISTS traslado (
    codigo_empleado VARCHAR(8) NOT NULL,
    id_fecha INT NOT NULL,
    id_ciudad INT NULL,
    id_agencia INT NULL,
    fecha_fin DATETIME NOT NULL,
    PRIMARY KEY(codigo_empleado),
    FOREIGN KEY (codigo_empleado) REFERENCES empleado(codigo_empleado) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_fecha) REFERENCES fecha(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_agencia, id_ciudad) REFERENCES agencia(id, id_ciudad) ON UPDATE CASCADE ON DELETE SET NULL);

CREATE TABLE IF NOT EXISTS tipoprestamo (
    id INT NOT NULL AUTO_INCREMENT,
    codigo_prestamo VARCHAR(10) NOT NULL,
    tipo_interes REAL NOT NULL,
    vigencia DATETIME NOT NULL,
    PRIMARY KEY (id) ); 

CREATE TABLE IF NOT EXISTS peticion (
    codigo_empleado VARCHAR(8) NOT NULL,
    id_codigo_prestamo INT NOT NULL,
    id_fecha INT NOT NULL, 
    si_no TINYINT(1) NOT NULL,
    UNIQUE (codigo_empleado, id_codigo_prestamo, id_fecha),
    PRIMARY KEY (codigo_empleado, id_codigo_prestamo, id_fecha),
    FOREIGN KEY (codigo_empleado) REFERENCES fijo(codigo_empleado) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_codigo_prestamo) REFERENCES tipoprestamo(id) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (id_fecha) REFERENCES fecha(id) ON UPDATE CASCADE ON DELETE RESTRICT);
