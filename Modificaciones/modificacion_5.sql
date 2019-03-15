/* Usamos la base de datos icxp3_7 */
USE icxp3_7;
/* Añadimos telefono_movil a la tabla empleado como clave única*/
ALTER TABLE empleado ADD COLUMN telefono_movil VARCHAR(12) UNIQUE;