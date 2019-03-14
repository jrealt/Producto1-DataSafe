/* Usamos la base de datos icxp3_7 */
USE icxp3_7;
/* Añadimos nss como clave única */
ALTER TABLE empleado ADD UNIQUE(nss);