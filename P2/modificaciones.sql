USE icxp3_7;
/* Deshabilitamos safe mode update */
SET SQL_SAFE_UPDATES = 0;

/* a. Cambia de nombre una titulación. */
UPDATE titulo 
    SET nombre_titulo = 'E.S.O.' 
    WHERE nombre_titulo LIKE 'ESO';

/* b. Cambia el año de concesión de un préstamo. */
UPDATE fecha
    SET fecha = DATE_SUB(fecha, INTERVAL 1 YEAR)
    WHERE id = (SELECT p.id_fecha FROM peticion AS p
                    WHERE p.id_codigo_prestamo = 10);

/* c. Cambia el precio hora a la categoría base. */
UPDATE categoria 
    SET sueldo_base=19 
    WHERE id=1;

/* d. Elimina la ciudad de Valencia. */
DELETE FROM ciudad
    WHERE nombre_ciudad LIKE 'Valencia';
        
/* e. Elimina las ciudades que no tengan ningún trabajador residiendo. */
DELETE FROM ciudad
    WHERE id NOT IN (SELECT id_ciudad_res FROM empleado);

/* Habilitamos safe mode update */
SET SQL_SAFE_UPDATES = 1;