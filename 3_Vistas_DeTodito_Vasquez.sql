-- 5 VISTAS - detodito_ecommerce
USE detodito_ecommerce ;

-- VISTA 1 vw_clientes_limit_10: MUESTRA LOS 10 PRIMEROS REGISTROS DE LA TABLA CLIENTES 
CREATE OR REPLACE VIEW detodito_ecommerce.vw_clientes_limit_10 AS
(SELECT * FROM CLIENTES LIMIT 10) ;

-- INVOCACION DE VISTA vw_clientes_limit_10
SELECT * FROM detodito_ecommerce.vw_clientes_limit_10 ;

-- """""""""""""""""""""""
-- VISTA 2 vw_pedido_tickete_precio_maximo: MUESTRA EL PRECIO MAXIMO DEL TICKETE COMPRADO Y EL 
-- ID DE DICHO PEDIDO
CREATE OR REPLACE VIEW detodito_ecommerce.vw_pedido_tickete_precio_maximo AS
(SELECT pt.id_pedido_tickete, max_price_subquery.max_price AS precio_maximo
FROM PEDIDO_TICKETE pt
INNER JOIN (
  SELECT MAX(precio_ped_tickete) AS max_price
  FROM PEDIDO_TICKETE
) AS max_price_subquery
ON pt.precio_ped_tickete = max_price_subquery.max_price) ;

-- INVOCACION DE VISTA vw_pedido_tickete_precio_maximo
SELECT * FROM detodito_ecommerce.vw_pedido_tickete_precio_maximo ;

-- """""""""""""""""""""""
-- VISTA 3 vw_paises_con_estaciones: MUESTRA DE LA TABLA PAIS, QUE PAISES TIENEN UN CLIMA CON 
-- ESTACIONES, ADEMAS MUESTRA EL ID DE DICHO PAIS Y SU NOMBRE
CREATE OR REPLACE VIEW detodito_ecommerce.vw_paises_con_estaciones AS
(SELECT id_pais, nombre, clima FROM PAIS WHERE clima = "ESTACIONES") ;

-- INVOCACION DE VISTA vw_paises_con_estaciones
SELECT * FROM detodito_ecommerce.vw_paises_con_estaciones ;

-- """""""""""""""""""""""
-- VISTA 4 vw_aerolineas_en_orden_alfabetico: MUESTRA UNA LISTA DE LAS AEROLINEAS, 
-- ORGANIZADAS EN ORDEN ALFABETICO POR NOMBRE, TAMBIEN MUESTRA ID_AEROLINEA Y PAGINA_WEB
CREATE OR REPLACE VIEW detodito_ecommerce.vw_aerolineas_en_orden_alfabetico AS
(SELECT id_aerolinea, nombre, pagina_web FROM AEROLINEA ORDER BY nombre ASC) ;

-- INVOCACION DE VISTA vw_aerolineas_en_orden_alfabetico
SELECT * FROM detodito_ecommerce.vw_aerolineas_en_orden_alfabetico ;

-- """"""""""""""""""""""""
-- VISTA 5 vw_cuenta_producto_macBook_Air_13p: CUENTA EL NUMERO DE VECES QUE SE REPITE LA 
-- DESCRIPCION 'macBook Air 13p'EN LA TABLA PRODUCTO CON UN LIMITE DE 2 VECES
CREATE OR REPLACE VIEW detodito_ecommerce.vw_cuenta_producto_macBook_Air_13p AS
(SELECT id_producto, descripcion, fecha_registro, COUNT(*) AS product_count
FROM PRODUCTO
WHERE descripcion IN ('macBook Air 13p')
GROUP BY id_producto, descripcion, fecha_registro
HAVING product_count > 0
ORDER BY fecha_registro DESC
LIMIT 2) ;

-- INVOCACION DE VISTA vw_cuenta_producto_macBook_Air_13p
SELECT * FROM detodito_ecommerce.vw_cuenta_producto_macBook_Air_13p ;












 

