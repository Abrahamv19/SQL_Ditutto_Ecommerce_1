-- CREAR 2 USUARIOS NUEVOS - COMENTAR SENTECIAS GRANT Y CREATE USER
USE detodito_ecommerce ;

-- CREACION USUARIO 1: PERMISOS DE SOLO LECTURA SOBRE TODAS LAS TABLAS
-- nombre: usuario1_solo_l - clave: abc123
CREATE USER IF NOT EXISTS 'usuario1_solo_l'@'localhost' IDENTIFIED BY 'abc123';

GRANT SELECT ON detodito_ecommerce.* TO 'usuario1_solo_l'@'localhost';

FLUSH PRIVILEGES;

-- SI QUISIERA ELIMINAR EL USUARIO 1, EJECUTO EL SIGUIENTE CODIGO
DROP USER 'usuario1_solo_l'@'localhost';

-- VER PERMISOS DE USUARIO 1
SHOW GRANTS FOR 'usuario1_solo_l'@'localhost';


-- CREACION USUARIO 2: PERMISOS DE LECTURA, INSERCION, MODIFICACION EN 2 TABLAS (CLIENTES - PAIS)
-- nombre: usuario2_solo_lim - clave: abc456
CREATE USER IF NOT EXISTS 'usuario2_solo_lim'@'localhost' IDENTIFIED BY 'abc456';

GRANT SELECT, INSERT, UPDATE ON detodito_ecommerce.CLIENTES TO 'usuario2_solo_lim'@'localhost';
GRANT SELECT, INSERT, UPDATE ON detodito_ecommerce.PAIS TO 'usuario2_solo_lim'@'localhost';

FLUSH PRIVILEGES;


-- SI QUISIERA ELIMINAR EL USUARIO 2, EJECUTO EL SIGUIENTE CODIGO
DROP USER 'usuario2_solo_lim'@'localhost';

-- VER PERMISOS DE USUARIO 2
SHOW GRANTS FOR 'usuario2_solo_lim'@'localhost';