/* Usamos la base de datos icxp3_7 */
USE icxp3_7;
/* Eliminamos la clave foranea de titulacion */
ALTER TABLE titulacion DROP FOREIGN KEY titulacion_ibfk_1;
/* Modificamos la columna nombre_titulo de la tabla titulacion */
ALTER TABLE titulacion MODIFY nombre_titulo VARCHAR(20) NOT NULL;
/* Modificamos la columna nombre_titulo de la tabla titulo */
ALTER TABLE titulo MODIFY nombre_titulo VARCHAR(20) NOT NULL;
/* Añadimos de nuevo la clave foranea */
ALTER TABLE titulacion
    ADD CONSTRAINT titulacion_ibfk_1
    FOREIGN KEY(nombre_titulo)
    REFERENCES titulo(nombre_titulo);
