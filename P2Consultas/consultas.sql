USE icxp3_7;
/* Grupo 1 */

/* Grupo 2 */

/* Grupo 3 */
/* Dar los teléfonos de las agencias que empiezan con el prefijo 91 */
SELECT telefono FROM agencia WHERE telefono LIKE '+3491%';

/* Mostrar los empleados fijos que tengan una antigüedad mayor a 5 años */
SELECT empleado.codigo_empleado, empleado.nombre, empleado.apellido FROM empleado 
    INNER JOIN fijo ON empleado.codigo_empleado = fijo.codigo_empleado 
    WHERE fijo.antiguedad < DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

/* Mostrar la cuota del sindicato */
SELECT empleado.codigo_empleado, empleado.nombre, empleado.apellido, sindicato.cuota FROM empleado 
    INNER JOIN fijo ON empleado.codigo_empleado = fijo.codigo_empleado 
    INNER JOIN sindicato ON empleado.id_central = sindicato.id
    WHERE fijo.antiguedad < DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

SELECT nombre_sindicato, cuota FROM sindicato;

/* Grupo 4 */

/* Grupo 5 */