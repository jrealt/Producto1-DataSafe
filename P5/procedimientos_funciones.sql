/* Realizar los siguientes procedimientos almacenados y Funciones. */
/* a. Un procedimiento almacenado que retorne el número de trabajadores
fijos que hay en la entidad bancaria. */
DELIMITER //
CREATE PROCEDURE empleadosFijos (OUT empleados INT)
BEGIN
    SELECT COUNT(*) INTO empleados FROM fijo;
END
//

CALL empleadosFijos (@numero_empleados_fijos);
SELECT @numero_empleados_fijos;

/* b. Una función que devuelva el doble del tipo de interés de los préstamos. */
DELIMITER //
CREATE FUNCTION dobleInteres (id INT) 
RETURNS double
DETERMINISTIC
BEGIN 
  SET @var = 0;
  SELECT tipo_interes*2 INTO @var FROM tipoprestamo WHERE tipoprestamo.id = id;
  RETURN @var;
END
//

SELECT dobleInteres(1);

/* c. Inventar una función relacionada con la seguridad en el banco. */
/* Valida un empleado según su código de empleado, dni y nss */
DELIMITER //
CREATE FUNCTION valida_empleado (codigo_empleado VARCHAR(8), dni VARCHAR(10), nss VARCHAR(20) ) RETURNS TINYINT(1) DETERMINISTIC
BEGIN
    declare validado TINYINT(1);
    IF (SELECT COUNT(e.codigo_empleado) FROM empleado AS e WHERE e.codigo_empleado LIKE codigo_empleado AND e.dni LIKE dni AND e.nss LIKE nss ) THEN
        SET validado = 1;
    ELSE
        SET validado = 0;
    END IF;
    RETURN validado;
END
//

SELECT valida_empleado('ars11234', '36584125P', '7279568404') AS valido;

/* d. Inventar un procedimiento almacenado que tenga un parámetro de
entrada. */
/* Procedimiento que inserta o actualiza un titulo */
DELIMITER //
CREATE PROCEDURE insertaOActualizaTitulo(IN nombre_titulo VARCHAR(20), IN numero DECIMAL(10,0))
BEGIN
    IF (SELECT COUNT(t.nombre_titulo) FROM titulo AS t WHERE t.nombre_titulo LIKE nombre_titulo) THEN
        UPDATE titulo AS tt
            SET tt.numero = numero 
            WHERE tt.nombre_titulo LIKE nombre_titulo;
    ELSEIF (SELECT COUNT(t.nombre_titulo) FROM titulo AS t WHERE t.numero LIKE numero) THEN
        UPDATE titulo AS tt
            SET tt.nombre_titulo = nombre_titulo 
            WHERE tt.numero = numero;
    ELSE
        INSERT INTO titulo (nombre_titulo, numero) 
            VALUES (nombre_titulo, numero);
    END IF;
END
//

CALL insertaOActualizaTitulo('PGTH', '14000');
SELECT * FROM icxp3_7.titulo;