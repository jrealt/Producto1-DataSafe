/* Usamos la base de datos icxp3_7 */
USE icxp3_7;

/* Añadimos email a la tabla empleado como clave única*/
ALTER TABLE empleado ADD COLUMN email varchar(50) UNIQUE;
ALTER TABLE empleado ADD UNIQUE (dni);

/* Eliminamos la columna dirección de la tabla agencia */
ALTER TABLE agencia DROP COLUMN direccion;
/* Añadimos la columna calle a la tabla agencia */
ALTER TABLE agencia ADD COLUMN calle VARCHAR(30);
/* Añadimos la columna numero a la tabla agencia */
ALTER TABLE agencia ADD COLUMN numero VARCHAR(4);
/* Añadimos la columna piso a la tabla agencia */
ALTER TABLE agencia ADD COLUMN piso VARCHAR(3);
/* Añadimos la columna letra a la tabla agencia */
ALTER TABLE agencia ADD COLUMN letra VARCHAR(2);
/* Añadimos la columna cp a la tabla agencia */
ALTER TABLE agencia ADD COLUMN cp VARCHAR(10);
