/* Usamos la base de datos icxp3_7 */
USE icxp3_7;
/* Modificamos la columna nombre_titulo de la tabla titulo */
ALTER TABLE titulo MODIFY nombre_titulo VARCHAR(20) NOT NULL;