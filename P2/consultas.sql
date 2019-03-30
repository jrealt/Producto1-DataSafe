USE icxp3_7;
/* Grupo 1 */
/* Dar el número de agencias. */
SELECT count(*) AS numero_agencias
    FROM agencia; 

/* Relación de todos los empleados, se debe listar el DNI, apellido y el NSS, Ordenados por el apellido. */
SELECT e.dni, e.apellido, e.nss FROM empleado AS e
    ORDER BY e.apellido ASC;

/* Dar la relación de los empleados que tienen titulación. */
SELECT e.nombre, e.apellido, tt.nombre_titulo FROM empleado As e
    INNER JOIN titulacion AS t ON t.codigo_empleado = e.codigo_empleado
    INNER JOIN titulo AS tt ON tt.id = t.id_titulo;

/* Grupo 2 */
/* Dar la relación de los empleados que están en el sindicato. */
SELECT e.nombre, e.apellido, s.nombre_sindicato, s.cuota FROM empleado AS e
    INNER JOIN sindicato AS s ON s.id = e.id_central;

/* Listar el sueldo base y el precio hora extra de cada categoría. */
SELECT c.nombre_cat, c.sueldo_base, c.hora_extra FROM categoria AS c;

/* Dar el número de las agencias que están en Barcelona. */
SELECT COUNT(a.id_ciudad) AS numero_de_agencias FROM agencia AS a 
    INNER JOIN ciudad AS c ON c.id = a.id_ciudad
    WHERE c.nombre_ciudad LIKE 'Barcelona';

/* Grupo 3 */
/* Dar los teléfonos de las agencias que empiezan con el prefijo 91 */
SELECT a.telefono FROM agencia AS a 
    WHERE a.telefono LIKE '+3491%';

/* Mostrar los empleados fijos que tengan una antigüedad mayor a 5 años */
SELECT e.* FROM empleado AS e
    INNER JOIN fijo AS f ON e.codigo_empleado = f.codigo_empleado 
    WHERE f.antiguedad < DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

/* Mostrar la cuota del sindicato */
SELECT e.*, s.cuota FROM empleado AS e
    INNER JOIN fijo AS f ON e.codigo_empleado = f.codigo_empleado 
    INNER JOIN sindicato AS s ON e.id_central = s.id
    WHERE f.antiguedad < DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

SELECT s.nombre_sindicato, s.cuota FROM sindicato AS s;

/* Grupo 4 */
/* Mostrar los empleados que se han trasladado en los últimos 2 años, y a la ciudad donde han ido. Ordenar por nombre del empleado. */
SELECT e.codigo_empleado, e.nombre, e.apellido, c.nombre_ciudad FROM empleado AS e
    INNER JOIN traslado AS t ON t.codigo_empleado = e.codigo_empleado
    INNER JOIN ciudad AS c ON c.id = t.id_ciudad
    INNER JOIN fecha AS f ON f.id = t.id_fecha
    WHERE f.fecha > DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
    ORDER BY e.nombre;

/* Mostrar todas las peticiones de préstamo de los empleados. */
SELECT e.codigo_empleado, e.nombre, e.apellido, f.fecha, p.si_no, t.tipo_interes, t.vigencia FROM empleado As e
    INNER JOIN peticion AS p ON p.codigo_empleado = e.codigo_empleado
    INNER JOIN fecha AS f ON f.id = p.id_fecha
    INNER JOIN tipoprestamo AS t ON t.codigo_prestamo = p.id_codigo_prestamo;

/* Mostrar todas las peticiones de préstamo concedidas a los empleados. */
SELECT e.codigo_empleado, e.nombre, e.apellido, f.fecha, p.si_no, t.tipo_interes, t.vigencia FROM empleado As e
    INNER JOIN peticion AS p ON p.codigo_empleado = e.codigo_empleado
    INNER JOIN fecha AS f ON f.id = p.id_fecha
    INNER JOIN tipoprestamo AS t ON t.codigo_prestamo = p.id_codigo_prestamo
    WHERE p.si_no = 1;

/* Grupo 5 */
/* Dar el trabajador con más peticiones de préstamo. */
SELECT e.codigo_empleado, e.nombre, e.apellido, COUNT(p.codigo_empleado) AS np FROM empleado AS e
    INNER JOIN peticion AS p ON e.codigo_empleado = p.codigo_empleado
    GROUP BY codigo_empleado
    ORDER BY np DESC
    LIMIT 1;

/* Formular una consulta que tenga una agrupación con Group by. */
/* Cantidad de empleados que viven por ciudad */
SELECT c.nombre_ciudad, COUNT(e.id_ciudad_res) AS nc FROM ciudad AS c
    INNER JOIN empleado AS e ON c.id = e.id_ciudad_res
    GROUP BY nombre_ciudad
    ORDER BY nc DESC;

/* Formular una consulta que tenga una agrupación con Group by y un filtraje con having. */
/* Empleados con sindicados que pagan una cuota mayor a 10€ */
SELECT e.*, s.cuota FROM empleado AS e
    INNER JOIN sindicato AS s ON e.id_central = s.id
    GROUP BY s.cuota
    HAVING s.cuota > 10;

