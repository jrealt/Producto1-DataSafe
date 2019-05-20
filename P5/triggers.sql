/* Realizar los siguientes disparadores. */
/* a. Un disparador que al añadir un nuevo empleado verifique que su
apellido no puede tener una longitud superior a 15 caracteres. */
DELIMITER //
CREATE TRIGGER verificar_apellido BEFORE INSERT ON empleado FOR EACH ROW
BEGIN
    declare longitud INT(10);
    declare mensaje_de_error VARCHAR(80);
    SET longitud = CHAR_LENGTH(NEW.apellido);
    IF (longitud > 15) THEN
        SET  mensaje_de_error = CONCAT('Verificar_Apellido: Error, apellido sobrepasa 15 carácteres. Longitud: ', CAST(longitud AS CHAR));
        SIGNAL sqlstate '45000' SET message_text = mensaje_de_error;
    END IF;
END
//
INSERT INTO empleado (codigo_empleado, dni, nss, nombre, apellido, id_nombre_cat, id_central, id_ciudad_res, email, telefono_movil) 
    VALUES ('rpa11458', '89654725H', '4265987264', 'Raul', 'Perez Espinoza Mar', '3', '4', '1', 'raupe@gmail.com', '+34667526387'); 


/* b. Un disparador que al añadir una cuota sindical, verifique que la cuota
(número) es positivo. */
DELIMITER //
CREATE TRIGGER verificar_cuota_sindical BEFORE INSERT ON sindicato FOR EACH ROW
BEGIN
    declare cuota FLOAT;
    declare mensaje_de_error VARCHAR(80);
    SET cuota = NEW.cuota;
    IF (cuota <= 0) THEN
        SET  mensaje_de_error = CONCAT('Verificar_Cuota_Sindical: Error, cuota sindical no es positiva. Cuota: ', CAST(cuota AS CHAR));
        SIGNAL sqlstate '45000' SET message_text = mensaje_de_error;
    END IF;
END
//

INSERT INTO sindicato (nombre_sindicato, cuota) VALUES ('Ficticio', -40.5);


/* c. Un disparador que al eliminar una titulación, copie esta titulación en otra
tabla (esta tabla deberá ser creada por vosotros). */
CREATE TABLE IF NOT EXISTS titulaciones_eliminadas (
        codigo_empleado VARCHAR(8) NOT NULL,
        id_titulo INT NOT NULL,
        PRIMARY KEY (codigo_empleado),
        FOREIGN KEY (codigo_empleado) REFERENCES empleado (codigo_empleado) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (id_titulo) REFERENCES titulo (id) ON UPDATE CASCADE ON DELETE CASCADE);


DELIMITER //
CREATE TRIGGER salvaTitulacionesEliminadas BEFORE DELETE ON titulacion FOR EACH ROW
BEGIN
    INSERT INTO titulaciones_eliminadas (codigo_empleado, id_titulo) VALUES (OLD.codigo_empleado, OLD.id_titulo);
END;
//

DELETE FROM titulacion WHERE codigo_empleado LIKE 'crl38160';
SELECT * FROM titulaciones_eliminadas;
