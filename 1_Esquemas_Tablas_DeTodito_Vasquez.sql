-- DETODITO_ECOMMERCE es un market place donde consigues de todo, tanto productos como 
-- ticketes de avion
DROP SCHEMA IF EXISTS detodito_ecommerce ;
-- SCRIPT DE CREACION DE 8 TABLAS

CREATE SCHEMA IF NOT EXISTS detodito_ecommerce ;
USE detodito_ecommerce ;

-- 1.) TABLA FABRICANTE: es tabla madre de tabla producto, contiene dato del fabricante de cada 
-- producto que ha sido agregado a un pedido de producto
DROP TABLE IF EXISTS FABRICANTE;
CREATE TABLE IF NOT EXISTS FABRICANTE(
id_fabricante INT NOT NULL ,
nombre VARCHAR(25) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
telefono VARCHAR(20) NOT NULL,
fecha_registro DATE NOT NULL,

CONSTRAINT pk_fabricante PRIMARY KEY (id_fabricante)
);

-- PUEDO USAR EL SCRIPT DE INSERCION DA DATOS ScriptIns_DeTodito_Vasquez.sql o usar archivo CSV
-- VER ARCHIVO PDF - guia_para_exportar_tablas_csv_deTodito.pdf
-- AGREGO DATOS A TABLA FABRICANTE EXPORTANDO EL ARCHIVO: 1_Tabla_Fabricante_CSV.csv 
SELECT * FROM detodito_ecommerce.FABRICANTE;

SELECT * FROM FABRICANTE;

-- 2.) TABLA CATEGORIA: es tabla madre de tabla producto, contiene datos de la categoria de cada producto
-- que ha sido agregado a un pedido de producto
DROP TABLE IF EXISTS CATEGORIA;
CREATE TABLE IF NOT EXISTS CATEGORIA(
id_categoria INT NOT NULL ,
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(80) NOT NULL,
fecha_registro DATE NOT NULL,

CONSTRAINT pk_categoria PRIMARY KEY (id_categoria)
);
-- PUEDO USAR EL SCRIPT DE INSERCION DA DATOS ScriptIns_DeTodito_Vasquez.sql o usar archivo CSV
-- AGREGO DATOS A TABLA CATEGORIA EXPORTANDO EL ARCHIVO: 2_Tabla_Categoria_CSV.csv 
SELECT * FROM detodito_ecommerce.CATEGORIA;


-- 3.) TABLA PRODUCTO: es tabla hija de tabla categoria y tabla fabricante, contiene datos del 
-- producto incluido en un pedido de producto y no pedido de tickete
DROP TABLE IF EXISTS PRODUCTO;
CREATE TABLE IF NOT EXISTS PRODUCTO(
id_producto INT NOT NULL ,
id_categoria INT,
id_fabricante INT,
precio_producto INT, 
descripcion VARCHAR(80) NOT NULL,
fecha_registro DATE NOT NULL,

CONSTRAINT pk_producto PRIMARY KEY (id_producto),
CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
CONSTRAINT fk_producto_fabricante FOREIGN KEY (id_fabricante) REFERENCES FABRICANTE(id_fabricante)
);
-- PUEDO USAR EL SCRIPT DE INSERCION DA DATOS ScriptIns_DeTodito_Vasquez.sql o usar archivo CSV
-- AGREGO DATOS A TABLA PRODUCTO EXPORTANDO EL ARCHIVO: 3_Tabla_Producto_CSV.csv 
SELECT * FROM detodito_ecommerce.PRODUCTO;


-- 4.) TABLA PEDIDO_PRODUCTO: es tabla hija de tabla producto, contiene datos de cada compra
-- de pedidos de productos, realizados por un cliente
DROP TABLE IF EXISTS PEDIDO_PRODUCTO;
CREATE TABLE IF NOT EXISTS PEDIDO_PRODUCTO(
id_pedido_producto INT NOT NULL ,
id_producto INT,
precio_ped_producto INT, 
tipo_compra VARCHAR(50) NOT NULL,
forma_pago VARCHAR(50) NOT NULL,
fecha_compra DATE NOT NULL,

CONSTRAINT pk_pedido_producto PRIMARY KEY (id_pedido_producto),
CONSTRAINT fk_pedido_producto_producto FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);
-- PUEDO USAR EL SCRIPT DE INSERCION DA DATOS ScriptIns_DeTodito_Vasquez.sql o usar archivo CSV
-- AGREGO DATOS A TABLA PEDIDO_PRODUCTO EXPORTANDO EL ARCHIVO: 4_Tabla_Pedido_Producto_CSV.csv 
SELECT * FROM detodito_ecommerce.PEDIDO_PRODUCTO;


-- 5.) TABLA AEROLINEA: es tabla madre de tabla pedido_tickete, contiene datos de la aerolinea
-- que corresponde a cada compra de tickete y no de producto 
DROP TABLE IF EXISTS AEROLINEA;
CREATE TABLE IF NOT EXISTS AEROLINEA(
id_aerolinea INT NOT NULL ,
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(80) NOT NULL,
pagina_web VARCHAR(80) NOT NULL,
fecha_registro DATE NOT NULL,

CONSTRAINT pk_aerolinea PRIMARY KEY (id_aerolinea)
);
-- PUEDO USAR EL SCRIPT DE INSERCION DA DATOS ScriptIns_DeTodito_Vasquez.sql o usar archivo CSV
-- AGREGO DATOS A TABLA AEROLINEA EXPORTANDO EL ARCHIVO: 5_Tabla_Aerolinea_CSV.csv 
SELECT * FROM detodito_ecommerce.AEROLINEA;


-- 6.) TABLA PEDIDO_TICKETE: es tabla madre de tabla cliente, contiene datos de cada compra
-- de pedidos de ticketes de avion, realizados por un cliente
DROP TABLE IF EXISTS PEDIDO_TICKETE;
CREATE TABLE IF NOT EXISTS PEDIDO_TICKETE(
id_pedido_tickete INT NOT NULL ,
id_aerolinea INT,
precio_ped_tickete INT, 
origen VARCHAR(50) NOT NULL,
destino VARCHAR(50) NOT NULL,
fecha_salida DATE NOT NULL,
fecha_llegada DATE NOT NULL,
fecha_compra DATE NOT NULL,

CONSTRAINT pk_pedido_tickete PRIMARY KEY (id_pedido_tickete),
CONSTRAINT fk_pedido_tickete_aerolinea FOREIGN KEY(id_aerolinea) REFERENCES AEROLINEA(id_aerolinea)
);
-- PUEDO USAR EL SCRIPT DE INSERCION DA DATOS ScriptIns_DeTodito_Vasquez.sql o usar archivo CSV
-- AGREGO DATOS A TABLA PEDIDO_TICKETE EXPORTANDO EL ARCHIVO: 6_Tabla_Pedido_Tickete_CSV.csv 
SELECT * FROM detodito_ecommerce.PEDIDO_TICKETE;


-- 7.) TABLA PAIS: es tabla madre de tabla cliente, contiene datos de cada pais donde
-- hay un cliente 
DROP TABLE IF EXISTS PAIS;
CREATE TABLE IF NOT EXISTS PAIS(
id_pais INT NOT NULL, 
nombre VARCHAR(50) NOT NULL,
continente VARCHAR(50) NOT NULL,
idioma VARCHAR(50) NOT NULL,
poblacion INT NOT NULL,
clima ENUM ('TROPICAL', 'FRIO', 'CALIENTE', 'ESTACIONES') NOT NULL,
territorio_km2 INT NOT NULL,
numero_clientes INT NOT NULL,
fecha_registro DATE NOT NULL,

CONSTRAINT pk_pais PRIMARY KEY (id_pais)
);
-- PUEDO USAR EL SCRIPT DE INSERCION DA DATOS ScriptIns_DeTodito_Vasquez.sql o usar archivo CSV
-- AGREGO DATOS A TABLA PAIS EXPORTANDO EL ARCHIVO: 7_Tabla_Pais_CSV.csv 
SELECT * FROM detodito_ecommerce.PAIS;


-- 8.) TABLA CLIENTES: es la tabla hija de tabla pais, tabla pedido_tickete y tabla pedido_producto,
-- contiene datos personales de clientes y se conecta con tabla pais, tabla pedido_producto y 
-- tabla pedido_cliente - La clave primaria es id_cliente
DROP TABLE IF EXISTS CLIENTES;
CREATE TABLE IF NOT EXISTS CLIENTES(
id_cliente INT AUTO_INCREMENT NOT NULL  ,
id_pais INT NOT NULL,
id_pedido_producto INT NULL,
id_pedido_tickete INT NULL,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
telefono VARCHAR(20) NOT NULL,
fecha_registro DATE NOT NULL, 

CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
CONSTRAINT fk_cliente_pais FOREIGN KEY(id_pais) REFERENCES PAIS(id_pais),
CONSTRAINT fk_cliente_pedido_tickete FOREIGN KEY (id_pedido_tickete) REFERENCES PEDIDO_TICKETE(id_pedido_tickete),
CONSTRAINT fk_cliente_pedido_producto FOREIGN KEY (id_pedido_producto) REFERENCES PEDIDO_PRODUCTO(id_pedido_producto)
);
-- PUEDO USAR EL SCRIPT DE INSERCION DA DATOS ScriptIns_DeTodito_Vasquez.sql o usar archivo CSV
-- AGREGO DATOS A TABLA CLIENTES EXPORTANDO EL ARCHIVO: 8_Tabla_Clientes_CSV.csv 
SELECT * FROM detodito_ecommerce.CLIENTES;



