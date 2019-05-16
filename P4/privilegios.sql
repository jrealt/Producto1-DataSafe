USE icxp3_7;
/* ------------------    Ejercicio 1a    ------------------- */

/* Creamos el usuario admin */
CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';


/* Concedemos los privilegios al usuario admin */
GRANT ALL PRIVILEGES ON icxp3_7.* TO 'admin'@'localhost' WITH GRANT OPTION;

GRANT
     CREATE USER,
     RELOAD,
     SELECT,
     CREATE ROUTINE,
     ALTER ROUTINE,
     SUPER
     ON *.* TO 'admin'@'localhost'
     WITH GRANT OPTION;


/* Recargamos los privilegios */
FLUSH PRIVILEGES;

/* Verificamos que el usuario admin ha sido creado */
SELECT user,host FROM mysql.user WHERE user LIKE 'admin';

/* Mostramos los privilegios del usuario admin */
SHOW GRANTS FOR 'admin'@'localhost';


/* ------------------    Ejercicio 1b    ------------------- */

/* Nos logeamos en la cuenta de admin */

/* Creamos el usuario empleado */
CREATE USER 'empleado'@'localhost' IDENTIFIED BY '1234';


/* Creamos el usuario agencia */
CREATE USER 'agencia'@'localhost' IDENTIFIED BY '1234';

/* Verificamos que los usuarios han sido creados */
SELECT user,host FROM mysql.user WHERE user LIKE 'empleado' OR user LIKE 'agencia';

/* ------------------    Ejercicio 1c    ------------------- */

/* Concedemos los privilegios al usuario empleado */
GRANT UPDATE ON icxp3_7.empleado TO  'empleado'@'localhost';

GRANT SELECT ON icxp3_7.* TO  'empleado'@'localhost';


/* Recargamos los privilegios */
FLUSH PRIVILEGES;

/* Mostramos los privilegios del usuario empleado */
SHOW GRANTS FOR 'empleado'@'localhost';

/* Concedemos los privilegios al usuario agencia */
GRANT 
    CREATE,
    ALTER,
    DROP,
    DELETE,
    INSERT,
    UPDATE,
    SELECT,
    CREATE VIEW,
    SHOW VIEW,
    CREATE TEMPORARY TABLES
    ON icxp3_7.* TO 'agencia'@'localhost';


/* Recargamos los privilegios */
FLUSH PRIVILEGES;

/* Mostramos los privilegios del usuario agencia */
SHOW GRANTS FOR 'agencia'@'localhost';