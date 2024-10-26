-- 2 STORED PROCEDURES - detodito_ecommerce
USE detodito_ecommerce ;

-- STORE PROCEDURE 1 ps_ordenamiento_pais: PERMITE INDICAR A TRAVES DEL PRIMER
--  PARAMETRO LA COLUMNA DE ORDENAMIENTO DE UNA TABLA Y MEDIANTE UN SEGUNDO PARAMETRO, 
-- SI EL ORDEN ES ASCENDENTE O DESCENDENTE
-- p_columna: es el parametro nombre de la columna y p_orden: es el orden seleccionado (asc, desc)

SELECT * FROM PAIS ;

DROP PROCEDURE IF EXISTS ps_ordenamiento_pais ;
DELIMITER &&

CREATE PROCEDURE ps_ordenamiento_pais(
    IN p_columna VARCHAR(50),
    IN p_orden VARCHAR(6)
)
BEGIN
    -- Construir la consulta dinámica con el espacio correcto después de 'ORDER BY'
    SET @p_salida = CONCAT('SELECT * FROM PAIS ORDER BY ', p_columna, ' ', p_orden);

    -- Preparar la consulta
    PREPARE stmt FROM @p_salida;

    -- Ejecutar la consulta
    EXECUTE stmt;

    -- Liberar la consulta preparada
    DEALLOCATE PREPARE stmt;
END&&

DELIMITER ;

CALL ps_ordenamiento_pais('idioma', 'desc');


-- STORE PROCEDURE 2 INSERCION - ELIMINACION: PERMITE 1. INSERTAR REGISTROS EN UNA TABLA DE TU PROYECTO Y
-- 2. ELIMINAR ALGUN REGISTRO ESPECIFICO DE UNA TABLA DE TU PROYECTO

-- A partir de un call que incluya un id_cliente, revisa si ese id_cliente ya existe entonces 
-- procede a borrar ese registro pero si no existe, crea un registro nuevo con todos sus 
-- campos correspondientes

SELECT * FROM CLIENTES ;

DROP PROCEDURE IF EXISTS ps_manejo_clientes ;
DELIMITER &&

CREATE PROCEDURE ps_manejo_clientes(
    IN p_id_cliente INT,
    IN p_id_pais INT,
    IN p_id_pedido_producto INT,
    IN p_id_pedido_tickete INT,
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_email VARCHAR(50),
    IN p_telefono VARCHAR(20),
    IN p_fecha_registro DATE
)
BEGIN
    DECLARE cliente_existe INT;

    -- Verificar si el cliente ya existe
    SELECT COUNT(*) INTO cliente_existe
    FROM CLIENTES
    WHERE id_cliente = p_id_cliente;

    -- Si el cliente ya existe, eliminar el registro
    IF cliente_existe > 0 THEN
        DELETE FROM CLIENTES
        WHERE id_cliente = p_id_cliente;
    ELSE
        -- Si el cliente no existe, insertar un nuevo registro
        INSERT INTO CLIENTES (id_pais, id_pedido_producto, id_pedido_tickete, nombre, apellido, email, telefono, fecha_registro)
        VALUES (p_id_pais, p_id_pedido_producto, p_id_pedido_tickete, p_nombre, p_apellido, p_email, p_telefono, p_fecha_registro);
    END IF;
END&&

DELIMITER ;

-- CALL PARA INSERCION DE NUEVO CLIENTE
CALL ps_manejo_clientes(
    16,                  -- id_cliente
    2,                  -- id_pais
    NULL,               -- id_pedido_producto
    NULL,               -- id_pedido_tickete
    'Juan',             -- nombre
    'Pérez',            -- apellido
    'juan.perez@g.com', -- email
    '123456789',        -- telefono
    '2024-06-18'        -- fecha_registro
);
-- REVISO QUE SE HAYA INSERTADO EL NUEVO CLIENTE
SELECT * FROM CLIENTES ;

-- """"""""""""""""""""""""
-- CALL PARA ELIMINACION DE CLIENTE EXISTENTE
CALL ps_manejo_clientes(
    16,                  -- id_cliente
    2,                  -- id_pais
    NULL,               -- id_pedido_producto
    NULL,               -- id_pedido_tickete
    'Juan',             -- nombre
    'Pérez',            -- apellido
    'juan.perez@g.com', -- email
    '123456789',        -- telefono
    '2024-06-18'        -- fecha_registro
);
-- REVISO QUE SE HAYA ELIMINADO EL CLIENTE EXISTENTE
SELECT * FROM CLIENTES ;


