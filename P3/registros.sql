INSERT INTO empleado (codigo_empleado, dni, nss, nombre, apellido, id_nombre_cat, id_central, id_ciudad_res, email, telefono_movil)
    VALUES 
    ('ppm80832', '45215844M', '2812645678', 'Pablo', 'Perez', 1, 1, 1, 'pperez@gmail.com', '+34659223176'),
    ('ars11234', '36584125P', '7279568404', 'Ana', 'Rio', 2, 4, 5, 'ario@gmail.com', '+34674734566'),
    ('lcs52675', '15426895P', '7364952675', 'Laura', 'Caceres', 2, 4, 5, 'lcac@gmail.com', '+34678956432'),
    ('gtp56984', '95683452P', '7568941568', 'Gregorio', 'Trapero', 5, 3, 5, 'gregt@gmail.com', '+34915869256'),
    ('frl45763', '15486925P', '4896414587', 'Francisco', 'Roldan', 7, 2, 4, 'frold@gmail.com', '+34916853654');

INSERT INTO fijo (codigo_empleado, antiguedad)
  VALUES 
  ('ppm80832', '2012-07-24'),
  ('ars11234', '2013-11-04'),
  ('lcs52675', '2015-06-08'),
  ('frl45763', '2013-10-16');

INSERT INTO titulacion (codigo_empleado, id_titulo)
  VALUES 
  ('ppm80832', 1),
  ('ars11234', 2),
  ('lcs52675', 1),
  ('frl45763', 2);

INSERT INTO tipoprestamo (codigo_prestamo, tipo_interes, vigencia)
  VALUES
  (11, 4.5, '2020-01-01'),
  (12, 3.0, '2021-01-01'),
  (13, 3.1, '2024-01-01'),
  (14, 2.9, '2022-01-01'),
  (15, 4.0, '2025-01-01'),
  (16, 1.0, '2027-01-01');

INSERT INTO fecha (fecha)
  VALUES 
  ('2013-07-24'),
  ('2017-10-25'),
  ('2014-10-04'),
  ('2012-12-21'),
  ('2012-05-13'),
  ('2015-11-11'),
  ('2016-01-07'),
  ('2011-09-05'),
  ('2014-02-28'),
  ('2014-10-12'),
  ('2013-12-25'),
  ('2016-05-01'),
  ('2011-12-03');

INSERT INTO peticion (codigo_empleado, id_codigo_prestamo, id_fecha, si_no)
    VALUES
    ('ppm80832', 11, 21, FALSE),
    ('ars11234', 12, 22, FALSE),
    ('mrr99583', 13, 23, FALSE),
    ('mgg12375', 14, 24, FALSE),
    ('lcs52675', 15, 25, FALSE),
    ('frl45763', 16, 26, FALSE);

INSERT INTO traslado (codigo_empleado, id_fecha, id_ciudad, id_agencia, fecha_fin)
    VALUES
    ('ppm80832', 27, 2, 1, '2021-7-25'),
    ('ars11234', 28, 4, 4, '2017-11-23'),
    ('mrr99583', 29, 2, 5, '2015-1-29'),
    ('mgg12375', 30, 6, 7, '2016-9-8'),
    ('gtp56984', 31, 5, 8, '2015-10-16'),
    ('frl45763', 32, 2, 1, '2017-9-4'),
    ('lcs52675', 33, 2, 5, '2018-12-10');
