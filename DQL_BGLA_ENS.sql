-- Autores: Blanca Giselle Licona Aguilar y Erick Nava Santiago
-- Fecha de entrega: 18/05/2025
-- Curso Prebecario: Base de Datos 25-1

USE banco;
-- Promedio del monto de los préstamos
SELECT * FROM prestamo;

SELECT AVG(monto) PromedioPrestamos
FROM prestamo

-- Obtener todos tus préstamos mayores o igual a $50,000 ordenados de mayor a menor
SELECT servicio_id, monto
FROM prestamo
WHERE monto >= 50000
ORDER BY monto DESC;

-- Pagos realizados por cada préstamo
SELECT *
FROM pago_prestamo;

SELECT * FROM prestamo

SELECT p.servicio_id, COUNT(*) AS num_pagos, SUM(pp.monto) AS total_pagado
FROM prestamo p
JOIN pago_prestamo pp ON p.servicio_id = pp.servicio_id
GROUP BY p.servicio_id;

-- Total de préstamos por sucursal
SELECT s.sucursal_id, COUNT(p.servicio_id) AS total_prestamos
FROM prestamo p
JOIN servicio sv ON p.servicio_id = sv.servicio_id
JOIN sucursal s ON sv.sucursal_id = s.sucursal_id
GROUP BY s.sucursal_id;


-- Empleados que son directores
SELECT DISTINCT e.empleado_id, e.nombre, e.ap_pat, e.ap_mat
FROM empleado e
JOIN sucursal s ON e.empleado_id = s.empleado_director_id;

-- Clientes con cuentas de ahorro y sus intereses
SELECT c.cliente_id, c.nombre, c.ap_pat, 
       ca.duracion, ca.intereses
FROM cliente c
JOIN servicio s ON c.cliente_id = s.cliente_id
JOIN cuenta_ahorro ca ON s.servicio_id = ca.servicio_id;

-- Clientes y número de servicios
SELECT c.cliente_id, c.nombre, c.ap_pat,
       COUNT(s.servicio_id) AS numero_servicios
FROM cliente c
LEFT JOIN servicio s ON c.cliente_id = s.cliente_id
GROUP BY c.cliente_id, c.nombre, c.ap_pat;