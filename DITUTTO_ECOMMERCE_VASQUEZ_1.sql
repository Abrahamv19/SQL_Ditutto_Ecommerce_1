-- DITUTTO_ECOMMERCE es un market place donde consigues de todo, tanto productos como 
-- ticketes de avion
DROP SCHEMA IF EXISTS DITUTTO_ECOMMERCE ;
CREATE SCHEMA IF NOT EXISTS DITUTTO_ECOMMERCE;
USE DITUTTO_ECOMMERCE;


-- TABLA CLIENTES: es la tabla madre, contiene datos personales de clientes y se conecta con
-- tabla pais, tabla pedido_producto y tabla pedido_cliente
-- La clave primaria es id_cliente
DROP TABLE IF EXISTS CLIENTE;
CREATE TABLE IF NOT EXISTS CLIENTE(
id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
id_pais INT ,
id_pedido_producto INT ,
id_pedido_tickete INT ,
nombre VARCHAR(25) NOT NULL,
apellido VARCHAR(20) NOT NULL,
email VARCHAR(40) NOT NULL,
telefono INT NOT NULL,
CONSTRAINT fk_cliente_pais FOREIGN KEY(id_pais) REFERENCES PAIS(id_pais),
CONSTRAINT fk_cliente_pedido_tickete FOREIGN KEY (id_pedido_tickete) REFERENCES PEDIDO_TICKETE(id_pedido_tickete),
CONSTRAINT fk_cliente_pedido_producto FOREIGN KEY (id_pedido_producto) REFERENCES PEDIDO_PRODUCTO(id_pedido_producto)
);

-- TABLA PAIS: es tabla hija de tabla cliente, contiene datos de cada pais donde
-- hay un cliente 
DROP TABLE IF EXISTS PAIS;
CREATE TABLE IF NOT EXISTS PAIS(
id_pais INT NOT NULL,
continente VARCHAR(30) NOT NULL,
idioma VARCHAR(25) NOT NULL,
poblacion INT,
clima VARCHAR(25) NOT NULL,
territorio_km2 INT,
numero_clientes INT
);
CREATE INDEX indice_pais_id ON PAIS (id_pais);
-- Agregue columna nombre_pais con posterioridad a la creacion de la tabla pais
ALTER TABLE PAIS
ADD nombre_pais VARCHAR(40) NOT NULL AFTER id_pais;


-- TABLA PEDIDO_TICKETE: es tabla hija de tabla cliente, contiene datos de cada compra
-- de pedidos de ticketes de avion, realizados por un cliente
DROP TABLE IF EXISTS PEDIDO_TICKETE;
CREATE TABLE IF NOT EXISTS PEDIDO_TICKETE(
id_pedido_tickete INT NOT NULL ,
id_aerolinea INT,
precio_tickete INT, 
fecha_compra DATE NOT NULL,
origen VARCHAR(25) NOT NULL,
destino VARCHAR(25) NOT NULL,
fecha_salida DATE NOT NULL,
fecha_llegada DATE NOT NULL,
CONSTRAINT fk_pedido_tickete_aerolinea FOREIGN KEY(id_aerolinea) REFERENCES AEROLINEA(id_aerolinea)
);
CREATE INDEX indice_pedido_tickete_id ON PEDIDO_TICKETE (id_pedido_tickete);


-- TABLA AEROLINEA: es tabla hija de tabla pedido_tickete, contiene datos de la aerolinea
-- que corresponde a cada compra de tickete y no de producto 
DROP TABLE IF EXISTS AEROLINEA;
CREATE TABLE IF NOT EXISTS AEROLINEA(
id_aerolinea INT NOT NULL ,
nombre VARCHAR(35) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
pagina_web VARCHAR(40) NOT NULL
);
CREATE INDEX indice_aerolinea_id ON AEROLINEA (id_aerolinea);


-- TABLA PEDIDO_PRODUCTO: es tabla hija de tabla cliente, contiene datos de cada compra
-- de pedidos de productos, realizados por un cliente
DROP TABLE IF EXISTS PEDIDO_PRODUCTO;
CREATE TABLE IF NOT EXISTS PEDIDO_PRODUCTO(
id_pedido_producto INT NOT NULL ,
id_producto INT,
precio_producto INT, 
fecha_compra DATE NOT NULL,
tipo_compra VARCHAR(25) NOT NULL,
forma_pago VARCHAR(25) NOT NULL,
CONSTRAINT fk_pedido_producto_producto FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);
CREATE INDEX indice_pedido_producto_id ON PEDIDO_PRODUCTO (id_pedido_producto);


-- TABLA PRODUCTO: es tabla hija de pedido_producto, contiene datos del producto incluido en
-- un pedido de producto y no pedido de tickete
DROP TABLE IF EXISTS PRODUCTO;
CREATE TABLE IF NOT EXISTS PRODUCTO(
id_producto INT NOT NULL ,
id_categoria INT,
id_fabricante INT,
precio_producto_unitario INT, 
descripcion VARCHAR(50) NOT NULL,
CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria),
CONSTRAINT fk_producto_fabricante FOREIGN KEY (id_fabricante) REFERENCES FABRICANTE(id_fabricante)
);
CREATE INDEX indice_producto_id ON PRODUCTO (id_producto);


-- TABLA CATEGORIA: es tabla hija de tabla producto, contiene datos de la categoria de cada producto
-- que ha sido agregado a un pedido de producto
DROP TABLE IF EXISTS CATEGORIA;
CREATE TABLE IF NOT EXISTS CATEGORIA(
id_categoria INT NOT NULL ,
nombre VARCHAR(25) NOT NULL,
descripcion VARCHAR(50) NOT NULL
);
CREATE INDEX indice_categoria_id ON CATEGORIA (id_categoria);


-- TABLA FABRICANTE: es tabla hija de tabla producto, contiene dato del fabricante de cada 
-- producto que ha sido agregado a un pedido de producto
DROP TABLE IF EXISTS FABRICANTE;
CREATE TABLE IF NOT EXISTS FABRICANTE(
id_fabricante INT NOT NULL ,
nombre VARCHAR(25) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
telefono INT NOT NULL
);
CREATE INDEX indice_fabricante_id ON FABRICANTE (id_fabricante);



