USE icxp3_7;

/* Haz un listado de todos los trabajadores que han sido trasladados a una
agencia que no es su lugar de residencia. Añade el año en el que fueron trasladados */
SELECT e.codigo_empleado, e.nombre, e.apellido, e.id_ciudad_res, a.id_ciudad, c.nombre_ciudad, a.nombre_agencia, YEAR(f.fecha) AS año FROM empleado AS e
    INNER JOIN traslado AS t ON t.id_agencia = e.id_central
    INNER JOIN ciudad AS c ON c.id = t.id_ciudad
    INNER JOIN agencia AS a ON a.id_ciudad = t.id_ciudad
    INNER JOIN fecha AS f ON f.id = t.id_fecha
    WHERE e.id_ciudad_res != a.id_ciudad;


/* Realiza un listado de los empleados que han solicitado un préstamo, y
este no ha sido concedido. Añade al listado el código de préstamo. */
SELECT e.nombre, e.apellido, t.codigo_prestamo FROM empleado AS e
    INNER JOIN peticion AS p ON p.codigo_empleado = e.codigo_empleado
    INNER JOIN tipoprestamo AS t ON t.id = p.id_codigo_prestamo
    WHERE p.si_no = 0;


/* Muestra el nombre de los empleados y la fecha en la que han sido
trasladados, aquellos empleados que llevan menos de 5 años desde el
último traslado. Muestra el resultado ordenado por el nombre y apellido
del trabajador. */
SELECT e.nombre, e.apellido, f.fecha FROM empleado AS e
    INNER JOIN traslado AS t ON t.codigo_empleado = e.codigo_empleado
    INNER JOIN fecha AS f ON f.id = t.id_fecha
    WHERE f.fecha > DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
    ORDER BY e.nombre, e.apellido;


/* ​Haz un listado de las agencias ​en las cuales el promedio ​​de traslado de los
trabajadores sea >1,5. En el listado se tiene que 
mostrar el código del trabajador, donde reside y el promedio de años 
que lleva el trabajador. */

/*  */
SET sql_mode=(SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));

CREATE OR REPLACE VIEW traslados_trabajadores AS
    SELECT CONCAT(t.id_fecha, '_',t.codigo_empleado) AS id, a.nombre_agencia, a.id AS id_agencia, e.codigo_empleado, c.nombre_ciudad AS ciudad_de_residencia, TIMESTAMPDIFF(YEAR, f.fecha, t.fecha_fin) AS años 
    FROM agencia AS a
    INNER JOIN traslado AS t ON t.id_agencia = a.id
    INNER JOIN empleado AS e ON e.codigo_empleado = t.codigo_empleado
    INNER JOIN ciudad AS c ON c.id = e.id_ciudad_res
    INNER JOIN fecha AS f ON f.id = t.id_fecha
    GROUP BY id;

CREATE OR REPLACE VIEW numero_traslados AS
    SELECT t.id_agencia, COUNT(t.id_agencia) AS n FROM traslado AS t
    GROUP BY t.id_agencia;

CREATE OR REPLACE VIEW media_años_trabajados AS
    SELECT tt.codigo_empleado, AVG(tt.años) AS media_de_años FROM traslados_trabajadores AS tt
        GROUP BY tt.codigo_empleado
        ORDER BY tt.codigo_empleado;

SELECT tt.nombre_agencia, tt.id_agencia, tt.codigo_empleado, tt.ciudad_de_residencia, mt.media_de_años FROM traslados_trabajadores AS tt
    INNER JOIN numero_traslados AS nt
    INNER JOIN media_años_trabajados AS mt ON mt.codigo_empleado = tt.codigo_empleado
    WHERE nt.id_agencia = tt.id_agencia
    GROUP BY tt.id
    HAVING AVG(nt.n) > 1.5
    ORDER BY tt.nombre_agencia;

DROP VIEW IF EXISTS traslados_trabajadores;
DROP VIEW IF EXISTS numero_traslados;
DROP VIEW IF EXISTS media_años_trabajados;


/* Muestra un listado de los empleados con titulación que estén afiliados al sindicato. */
SELECT e.codigo_empleado, e.nombre, e.apellido, s.nombre_sindicato, ti.nombre_titulo FROM empleado AS e
    INNER JOIN titulacion AS t ON t.codigo_empleado = e.codigo_empleado
    INNER JOIN sindicato AS s ON s.id = e.id_central
    INNER JOIN titulo AS ti ON ti.id = t.id_titulo
    WHERE t.id_titulo IS NOT NULL
    AND e.id_central IS NOT NULL;


/* Inventa una consulta que contenga un group by + having + agregación(count) */
/*Hacer un listado de empleados con peticiones de prestamos con más de 1 petición*/
SELECT e.codigo_empleado, e.nombre, e.apellido, COUNT(p.codigo_empleado) AS numero_peticiones FROM empleado AS e
INNER JOIN peticion AS p ON e.codigo_empleado = p.codigo_empleado
GROUP BY codigo_empleado
HAVING numero_peticiones > 1;
/*Filtra el número de peticiones que ha hecho cada empleado, mostrando dicho número y su dni*/
SELECT empleado.dni, COUNT(peticion.id_codigo_prestamo) AS PeticionesPorEmpleado
FROM peticion
INNER JOIN empleado ON peticion.codigo_empleado = empleado.codigo_empleado
GROUP BY empleado.dni
HAVING COUNT(peticion.id_codigo_prestamo) > 0;



/* Inventa una consulta que contenga una combinación externa + ordenación(order by) */
/*Mostrar listado de empleados y su antigüedad como fijos ordenados por antiguedad ascendentemente. */
SELECT e.codigo_empleado, e.nombre, e.apellido, f.antiguedad FROM empleado AS e
    RIGHT OUTER JOIN fijo AS f ON f.codigo_empleado = e.codigo_empleado 
    ORDER BY f.antiguedad ASC;
/* Empleados temporales ordenados por fecha de inicio */
SELECT e.codigo_empleado, e.nombre, e.apellido, t.fecha_inicio_cont FROM empleado AS e
    RIGHT OUTER JOIN temporal AS t ON t.codigo_empleado = e.codigo_empleado
    ORDER BY t.fecha_inicio_cont ASC;
