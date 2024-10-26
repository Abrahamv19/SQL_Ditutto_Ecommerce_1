-- 2 FUNCIONES - detodito_ecommerce
USE detodito_ecommerce ;

-- FUNCION 1 : RETORNA EL ID_CLIENTE EN BASE A UNA CIUDAD DE DESTINO DE UN TICKETE

DELIMITER $$

DROP FUNCTION IF EXISTS fn_retorna_id_pedido_tickete_por_destino_vuelo ;
CREATE FUNCTION fn_retorna_id_pedido_tickete_por_destino_vuelo(p_destino VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_respuesta INT;

    SELECT id_pedido_tickete 
    INTO v_respuesta 
    FROM PEDIDO_TICKETE 
    WHERE destino = p_destino
    LIMIT 1;

    RETURN v_respuesta;
END$$

DELIMITER ;

-- NOTA: SI EXISTE ALGUN ERROR AL CREAR LA FUNCION, CORRER COMANDO: USE detodito_ecommerce ; PRIMERO
-- Y DESPUES VOLVER A CREAR LA FUNCION INCLUYENDO LOS DELIMITER

-- INVOCACION DE FUNCION fn_retorna_id_pedido_tickete_por_destino_vuelo
select fn_retorna_id_pedido_tickete_por_destino_vuelo('buenos aires') as v_respuesta;

-- """"""""""""""""""""""""

-- FUNCION 2 : RETORNA EL PRECIO DE UN PRODUCTO EN BASE A SU DECRIPCION

DELIMITER $$

DROP FUNCTION IF EXISTS fn_retorna_precio_producto_por_descripcion ;
CREATE FUNCTION fn_retorna_precio_producto_por_descripcion(p_descripcion VARCHAR(80))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_respuesta INT;

    SELECT precio_producto 
    INTO v_respuesta 
    FROM PRODUCTO 
    WHERE descripcion = p_descripcion
    LIMIT 1;

    RETURN v_respuesta;
END$$

DELIMITER ;

-- NOTA: SI EXISTE ALGUN ERROR AL CREAR LA FUNCION, CORRER COMANDO: USE detodito_ecommerce ; PRIMERO
-- Y DESPUES VOLVER A CREAR LA FUNCION INCLUYENDO LOS DELIMITER

-- INVOCACION DE FUNCION fn_retorna_precio_producto_por_descripcion
select fn_retorna_precio_producto_por_descripcion('colores principe azul') as v_respuesta;







