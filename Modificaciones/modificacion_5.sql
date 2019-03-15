/* Usamos la base de datos icxp3_7 */
USE icxp3_7;

ALTER TABLE empleado ADD COLUMN telefono_movil VARCHAR(12) UNIQUE;