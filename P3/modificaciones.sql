USE icxp3_7;
/* Deshabilitamos safe mode update */
SET SQL_SAFE_UPDATES = 0;

/* Incrementa en 1 el número de veces que un trabajador ha sido
trasladado, para todos aquellos trabajadores que llevan más de 5 años
en la agencia bancaria. */
INSERT INTO fecha (fecha) VALUES (NOW());

INSERT INTO traslado (codigo_empleado, id_fecha , id_ciudad, id_agencia, fecha_fin)
SELECT t.codigo_empleado, (SELECT f.id FROM fecha AS f ORDER BY f.id DESC LIMIT 1) AS id_fecha,  t.id_ciudad, t.id_agencia, DATE_ADD((SELECT f.fecha FROM fecha AS f ORDER BY f.id DESC LIMIT 1), INTERVAL 5 YEAR) as fecha_fin
    FROM traslado AS t
    INNER JOIN fecha AS f ON f.id = t.id_fecha
    WHERE YEAR(f.fecha) <= YEAR(SYSDATE()) - 5
        AND t.id_ciudad IS NOT NULL
        AND id_agencia  IS NOT NULL;


/* Elimina los trabajadores que nunca han sido trasladados fuera de su
ciudad de residencia. */
CREATE OR REPLACE VIEW traslados_fuera AS
    SELECT e.codigo_empleado AS codigo_empleado FROM empleado AS e
        INNER JOIN traslado AS t ON t.codigo_empleado = e.codigo_empleado
        WHERE e.id_ciudad_res != t.id_ciudad;

CREATE OR REPLACE VIEW traslados_dentro AS
    SELECT e.codigo_empleado AS codigo_empleado FROM empleado AS e
        INNER JOIN traslado AS t ON t.codigo_empleado = e.codigo_empleado
        WHERE e.id_ciudad_res = t.id_ciudad;

CREATE OR REPLACE VIEW traslados_null AS
    SELECT e.codigo_empleado AS codigo_empleado FROM empleado AS e
        INNER JOIN traslado AS t ON t.codigo_empleado = e.codigo_empleado
        WHERE e.id_ciudad_res IS NULL OR t.id_ciudad IS NULL;

DELETE FROM empleado WHERE codigo_empleado IN (
    SELECT codigo_empleado FROM (
        SELECT e.codigo_empleado AS codigo_empleado FROM empleado AS e
            WHERE e.codigo_empleado NOT IN (SELECT codigo_empleado FROM traslado) OR
                e.codigo_empleado IN (SELECT codigo_empleado FROM traslados_null) OR
                (e.codigo_empleado NOT IN (SELECT codigo_empleado FROM traslados_fuera) AND
                e.codigo_empleado IN (SELECT codigo_empleado FROM traslados_dentro))
    ) AS codigo_empleado
);

DROP VIEW IF EXISTS traslados_fuera;
DROP VIEW IF EXISTS traslados_dentro;
DROP VIEW IF EXISTS traslados_null;


/* Habilitamos safe mode update */
SET SQL_SAFE_UPDATES = 1;