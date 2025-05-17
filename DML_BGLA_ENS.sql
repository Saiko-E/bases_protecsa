-- Autores: Blanca Giselle Licona Aguilar y Erick Nava Santiago
-- Fecha de entrega: 18/05/2025
-- Curso Prebecario: Base de Datos 25-1

USE banco;

INSERT INTO empleado (empleado_id, nombre, ap_pat, ap_mat, fecha_contratacion) VALUES 
(1232,'Mariana','Hernández', 'Sosa','2020-01-15' ),
(8712, 'Luciano', 'Quevedo', 'Martínez', '2018-08-12'),
(5398, 'Enrique', 'Soriano', 'Oviedo', '2019-05-22'),
(9802, 'Anyhram', 'Melendez', 'León', '2021-09-26'),
(7631, 'Germán', 'Camacho', 'Zea', '2022-06-09');

INSERT INTO empleado (empleado_id, empleado_director_id, nombre, ap_pat, ap_mat, fecha_contratacion) VALUES
(9457, 8712, 'Javier', 'Navarro', 'González', '2023-05-02'),
(9456, 8712, 'Paola', 'Linares', 'Pérez', '2023-07-10'),
(2034, 9802, 'Roberto', 'Rodríguez', NULL, '2023-09-15'),
(7361, 9802, 'Omar', 'Araiza', 'Escobedo', '2024-01-06'),
(8573, 1232, 'Iván', 'Habacuc', NULL, '2023-01-12');

INSERT INTO estado VALUES 
(1, 'CDMX'),
(2, 'Sinaloa'),
(3, 'Yucatán'), 
(4, 'Oaxaca'), 
(5, 'Puebla'), 
(6, 'Edo. de México'), 
(7, 'Veracruz'), 
(8, 'Aguascalientes'), 
(9, 'Chiapas'),
(10, 'Colima');

INSERT INTO delegacion (delegacion_id, nombre, calle, lote, cp, estado_id) VALUES
(1, 'Coyoacán', 'Av. Universidad', 100, 04360, 1),         
(2, 'Mazatlán', 'Av. del Mar', 55, 82017, 2),              
(3, 'Mérida Centro', 'Calle 60', 12, 97000, 3),            
(4, 'Juchitán', '5 de Septiembre', 22, 70000, 4),          
(5, 'Cholula', 'Av. Morelos', 30, 72760, 5),               
(6, 'Ecatepec', 'Vía Morelos', 45, 55060, 6),              
(7, 'Veracruz Centro', 'Av. Independencia', 70, 91700, 7), 
(8, 'Aguascalientes Norte', 'Av. Aguascalientes', 150, 20130, 8), 
(9, 'Tuxtla Gutiérrez', 'Blvd. Belisario Domínguez', 101, 29000, 9), 
(10, 'Colima Centro', 'Calle Madero', 18, 28000, 10); 


INSERT INTO sucursal (sucursal_id, anio, delegacion_id, empleado_director_id) VALUES
(1, 2020, 1, 1232),   
(2, 2019, 2, 8712),   
(3, 2021, 3, 5398),   
(4, 2022, 4, 9802),   
(5, 2023, 5, 7631),   
(6, 2021, 6, 1232),   
(7, 2020, 7, 8712),   
(8, 2024, 8, 9802),   
(9, 2023, 9, 5398),   
(10, 2022, 10, 7631); 

INSERT INTO auditor (auditor_id, nombre, ap_pat, ap_mat, cedula) VALUES
(1, 'Silvia', 'Reyes', 'Juárez', '12345678'),
(2, 'Andrés', 'Gómez', 'Luna', '87654321'),
(3, 'Laura', 'Campos', 'Mendoza', '23456789'),
(4, 'Carlos', 'Nava', 'Téllez', '34567890'),
(5, 'Diana', 'Figueroa', 'Salas', '45678901'),
(6, 'Luis', 'Beltrán', 'Ochoa', '56789012'),
(7, 'Rosa', 'Vega', 'Moreno', '67890123'),
(8, 'Jorge', 'Escobar', 'Ruiz', '78901234'),
(9, 'Claudia', 'Ramírez', 'García', '89012345'),
(10, 'Arturo', 'Mejía', 'Zapata', '90123456');

INSERT INTO cliente (cliente_id, auditor_id, nombre, ap_pat, ap_mat, sucursal_id) VALUES
(100, 1, 'Daniela', 'Morales', 'Vargas', 1),
(101, 2, 'Fernando', 'García', 'Soto', 2),
(102, 3, 'Liliana', 'Navarro', 'Ortiz', 3),
(103, 4, 'Miguel', 'Pérez', 'López', 4),
(104, 5, 'Patricia', 'Delgado', 'Ramírez', 5),
(105, 6, 'Ricardo', 'Torres', 'Espinoza', 6),
(106, 7, 'Elena', 'Jiménez', 'Cruz', 7),
(107, 8, 'Héctor', 'Salinas', 'Aguilar', 8),
(108, 9, 'Teresa', 'Mora', 'Domínguez', 9),
(109, 10, 'Alfredo', 'Bautista', 'Carrillo', 10);

INSERT INTO servicio (servicio_id, tipo_servicio, cliente_id, sucursal_id) VALUES
(1000, 1, 100, 1),
(1001, 2, 101, 2),
(1002, 1, 102, 3),
(1003, 3, 103, 4),
(1004, 2, 104, 5),
(1005, 1, 105, 6),
(1006, 2, 106, 7),
(1007, 3, 107, 8),
(1008, 1, 108, 9),
(1009, 3, 109, 10);

INSERT INTO servicio (servicio_id, cliente_id, tipo_servicio, sucursal_id)
VALUES
(1010, 105, 3, 3),
(1011, 106, 3, 5),
(1012, 108, 3, 3),
(1013, 102, 3, 8),
(1014, 100, 3, 1);

INSERT INTO prestamo (servicio_id, es_inicial, monto, plazo, fecha) VALUES
(1000, 1, 50000.00, 12, '2023-01-10'),
(1002, 0, 75000.00, 24, '2022-05-20'),
(1004, 1, 30000.00, 18, '2023-09-15'),
(1005, 0, 20000.00, 6, '2024-01-10'),
(1008, 1, 100000.00, 36, '2021-11-25');

INSERT INTO pago_prestamo (servicio_id, num_pago, monto) VALUES
(1000, 1, 4200.00),
(1000, 2, 4200.00),
(1000, 3, 4200.00),
(1002, 1, 3125.00),
(1002, 2, 3125.00),
(1004, 1, 1666.67),
(1005, 1, 3333.33),
(1005, 2, 3333.33),
(1008, 1, 2777.78),
(1008, 2, 2777.78);

INSERT INTO cuenta (servicio_id, cuenta_id, tipo_cuenta, saldo_inicial, numero_cuenta) VALUES
(1001, 2001, 0, 15000.00, '0102030401'),
(1003, 2002, 1, 8000.00, '0102030402'),
(1006, 2003, 0, 12000.00, '0102030403'),
(1007, 2004, 1, 30000.00, '0102030404'),
(1009, 2005, 0, 10000.00, '0102030405');

INSERT INTO cuenta_ahorro (servicio_id, duracion, intereses) VALUES
(1001, 12, 3.5),
(1006, 24, 4.2),
(1009, 18, 3.9);

INSERT INTO cuenta_corriente (servicio_id, chequera, saldo_minimo) VALUES
(1003, 111222, 5000.00),
(1007, 333444, 7000.00);

INSERT INTO inversion (servicio_id, monto, gat, codigo, auditor_id) VALUES
(1003, 25000.00, '8.5', 'INVX01', 1),
(1007, 18000.00, '7.2', 'INVX02', 2),
(1009, 22000.00, '9.1', 'INVX03', 3);

INSERT INTO inversion (servicio_id, monto, gat, codigo, auditor_id) VALUES
(1010, 23000.00, '8.2', 'INVX04',4),
(1011, 19870.00, '6.3', 'INVX05', 5);

INSERT INTO inversion_deuda_publica (servicio_id, pais_bono, moneda) VALUES
(1003, 'México', 'MXN'),
(1007, 'Estados Unidos', 'USD'),
(1009, 'Alemania', 'EUR'),
(1010, 'Brasil', 'BRL'),
(1011, 'Japón', 'JPY');

INSERT INTO cnb (transaccion_id, tipo, nombre_banco, fecha) VALUES
(1, 'Compra', 'BBVA', '2024-01-10'),
(2, 'Venta', 'Santander', '2024-01-15'),
(3, 'Compra', 'Citibanamex', '2024-02-01'),
(4, 'Compra', 'HSBC', '2024-03-05'),
(5, 'Venta', 'Scotiabank', '2024-04-12'),
(6, 'Compra', 'Inbursa', '2024-04-20'),
(7, 'Venta', 'Banorte', '2024-05-03'),
(8, 'Compra', 'Afirme', '2024-05-10'),
(9, 'Venta', 'Banco Azteca', '2024-05-15'),
(10, 'Compra', 'Banregio', '2024-05-20');

INSERT INTO inversion_bolsa_valores (servicio_id, indice_bursatil, nombre_fondo_inversion, transaccion_id) VALUES
(1003, 850.50, 'Fondo Tecnología Global', 2),
(1007, 915.75, 'Fondo Energía Renovable', 4),
(1009, 730.80, 'Fondo Bienes Raíces', 6),
(1010, 690.40, 'Fondo Agroindustria', 8),
(1011, 880.90, 'Fondo Inteligencia Artificial', 10);







