USE icxp3_7;

INSERT INTO categoria (nombre_cat, sueldo_base, hora_extra)
  VALUES 
  ('categoria_01', 12.00, 18.00),
  ('categoria_02', 8.00, 12.00),
  ('categoria_03', 7.88, 11.82),
  ('categoria_04', 9.50, 14.25),
  ('categoria_05', 10.00, 15.00),
  ('categoria_06', 6.50, 9.75),
  ('categoria_07', 6.50, 9.75),
  ('categoria_08', 10.00, 15.00),
  ('categoria_09', 14.5, 21.75),
  ('categoria_10', 7.8, 11.70);

INSERT INTO sindicato (nombre_sindicato, cuota)
  VALUES 
  ("UGT", 13.00),
  ("CCOO", 14.00),
  ("CNT", 9.00),
  ("CGT", 10.00),
  ("SAT", 11.00),
  ("COS", 12.00),
  ("LAB", 12.5),
  ("SO", 8.5),
  ("AST", 8.00),
  ("CIG", 10.5);

INSERT INTO ciudad (nombre_ciudad, num_habitantes)
  VALUES 
  ('Madrid', 3223334),
  ('Barcelona', 1620343),
  ('Valencia', 791413),
  ('Sevilla', 688711),
  ('Zaragoza', 666880),
  ('Malaga', 571026),
  ('Murcia', 447182),
  ('Palma', 409661),
  ('Bilbao', 345821),
  ('Alicante', 331577);

INSERT INTO empleado (codigo_empleado, dni, nss, nombre, apellido, id_nombre_cat, id_central, id_ciudad_res, email, telefono_movil)
  VALUES 
  ('jrm89012', '45678844M', '2812345678', 'Juan', 'Rodríguez', 1, 1, 1, 'jrodriguez@gmail.com', '+34659278576'),
  ('mgs91128', '87977552P', '7279560804', 'Marcos', 'Gómez', 2, 4, 5, 'mgomez@gmail.com', '+34678334566'),
  ('jgr23778', '38923235G', '5437635590', 'José', 'García', 7, 5, 2, 'jgarcia@gmail.com', '+34665812239'),
  ('mgg12375', '89234713M', '3732997415', 'María', 'González', 4, 7, 8, 'mgonzalez@gmail.com', '+34653389124'),
  ('rms10184', '94571879U', '3696581102', 'Roger', 'Martín', 8, 6, 9, 'rmartin@gmail.com', '+34698470415'),
  ('crl38160', '39573446T', '7821437691', 'Carmen', 'Ruiz', 9, 9, 7, 'cruiz@gmail.com', '+34622196890'),
  ('clm03866', '30583199O', '8832780416', 'Claudia', 'López', 6, 2, 3, 'clopez@gmail.com', '+34698161206'),
  ('mrr99583', '43597258K', '2237984169', 'Mario', 'Ramos', 3, 8, 4, 'mramos@gmail.com', '+34672830755'),
  ('idi20862', '65489902L', '2021125989', 'Isabel', 'Díaz', 5, 3, 6, 'idiaz@gmail.com', '+34680026491'),
  ('lap33670', '19983245Y', '7026518657', 'Laura', 'Álvarez', 10, 10, 10, 'lalvarez@gmail.com', '+34605367199');

INSERT INTO titulo (nombre_titulo, numero)
  VALUES 
  ('ESO', 3000),
  ('Bachiller', 4000),
  ('CFGS_DAM', 5000),
  ('CFGS_DAW', 5001),
  ('CFGS_ASIR', 5002),
  ('CFGS_AF', 6000),
  ('CFGS_MP', 7000),
  ('CFGS_GVEC', 8000),
  ('G_ADE', 12000),
  ('G_II', 13000);

INSERT INTO titulacion (codigo_empleado, id_titulo)
  VALUES 
  ('jrm89012', 1),
  ('mgs91128', 2),
  ('jgr23778', 3),
  ('mgg12375', 4),
  ('rms10184', 5),
  ('crl38160', 6),
  ('clm03866', 7),
  ('mrr99583', 8),
  ('idi20862', 9),
  ('lap33670', 10);

INSERT INTO fijo (codigo_empleado, antiguedad)
  VALUES 
  ('jrm89012', '2012-07-24'),
  ('mgs91128', '2013-11-04'),
  ('jgr23778', '2015-06-08'),
  ('mgg12375', '2013-10-16'),
  ('rms10184', '2016-01-07');

INSERT INTO temporal (codigo_empleado, fecha_inicio_cont, fecha_fin_cont)
  VALUES 
  ('crl38160', '2013-05-21', '2015-05-22'),
  ('clm03866', '2017-06-15', '2017-12-16'),
  ('mrr99583', '2015-09-02', '2016-03-03'),
  ('idi20862', '2013-12-05', '2013-06-06'),
  ('lap33670', '2014-08-12', '2016-08-13');

INSERT INTO fecha (fecha)
  VALUES 
  ('2016-07-24'),
  ('2015-09-16'),
  ('2019-10-08'),
  ('2014-12-21'),
  ('2018-04-13'),
  ('2013-07-10'),
  ('2017-03-09'),
  ('2016-05-05'),
  ('2015-09-19'),
  ('2014-11-02'),
  ('2013-07-24'),
  ('2014-09-16'),
  ('2016-10-08'),
  ('2013-12-21'),
  ('2017-04-13'),
  ('2012-07-10'),
  ('2019-03-09'),
  ('2017-05-05'),
  ('2011-09-19'),
  ('2015-11-02');

INSERT INTO agencia (id_ciudad, nombre_agencia, telefono, calle, numero, piso, letra, cp)
  VALUES 
  (2, 'agencia_01', '+34656237041', 'aribau', 106, '3o', 'a', 08036),
  (3, 'agencia_02', '+34696321045', 'quart', 15, '2o', 'a', 46001),
  (1, 'agencia_03', '+34674125952', 'lagasca', 67, '4o', 'b', 28001),
  (4, 'agencia_04', '+34600256341', 'campamento', 10, '1o', 'a', 41018),
  (2, 'agencia_05', '+34696753421', 'balmes', 209, '5o', 'd', 08006),
  (9, 'agencia_06', '+34670022002', 'cortes', 107, '3o', 'b', 48003),
  (6, 'agencia_07', '+34693414141', 'pelayo', 77, '5o', 'a', 29009),
  (5, 'agencia_08', '+34609360214', 'coso', 86, '2o', 'c', 50001),
  (1, 'agencia_09', '+34641023160', 'alcala', 337, '7o', 'b', 28027),
  (3, 'agencia_10', '+34606170053', 'colon', 60, '5o', 'c', 46004);

INSERT INTO traslado (codigo_empleado, id_fecha, id_ciudad, id_agencia, fecha_fin)
  VALUES
  ("jrm89012", 11, 2, 1, "2016-09-03"),
  ("mgs91128", 12, 3, 2, "2017-12-29"),
  ("jgr23778", 13, 1, 3, "2019-12-25"),
  ("mgg12375", 14, 4, 4, "2015-04-05"),
  ("rms10184", 15, 2, 5, "2019-09-22"),
  ("crl38160", 16, 9, 6, "2013-09-09"),
  ("clm03866", 17, 6, 7, "2020-03-30"),
  ("mrr99583", 18, 5, 8, "2019-01-13"),
  ("idi20862", 19, 1, 9, "2016-09-21"),
  ("lap33670", 20, 3, 10, "2017-12-26");


INSERT INTO tipoprestamo (codigo_prestamo, tipo_interes, vigencia)
  VALUES
  (1, 0.3, '2018-01-01'),
  (2, 5.0, '2019-01-01'),
  (3, 7.6, '2020-03-03'),
  (4, 0.3, '2019-04-04'),
  (5, 0.3, '2019-05-04'),
  (6, 6.7, '2019-06-04'),
  (7, 7.6, '2019-06-04'),
  (8, 4.8, '2019-09-09'),
  (9, 3.5, '2019-12-21'),
  (10, 6.7, '2020-01-01');

INSERT INTO peticion (codigo_empleado, id_codigo_prestamo, id_fecha, si_no)
  VALUES
  ('jrm89012', 1, 1, TRUE),
  ('mgs91128', 2, 2, TRUE),
  ('jgr23778', 3, 3, TRUE),
  ('jgr23778', 4, 4, TRUE),
  ('jrm89012', 5, 5, TRUE),
  ('mgg12375', 6, 6, TRUE),
  ('mgg12375', 7, 7, TRUE),
  ('mgg12375', 8, 8, TRUE),
  ('rms10184', 9, 9, TRUE),
  ('rms10184', 10, 10, TRUE);