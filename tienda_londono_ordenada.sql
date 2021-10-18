CREATE DATABASE IF NOT EXISTS tienda_londono;
CREATE DATABASE IF NOT EXISTS g53e2;

USE tienda_londono;
USE g53e2;

CREATE TABLE usuarios (
cedula_usuario BIGINT(20) PRIMARY KEY,
email_usuario VARCHAR (255) NOT NULL,
nombre_usuario VARCHAR (255) NOT NULL,
password VARCHAR(255) NOT NULL,
usuario VARCHAR(255) NOT NULL
);

CREATE TABLE clientes (
cedula_cliente BIGINT(20) PRIMARY KEY,
direccion_cliente VARCHAR (255) NOT NULL,
email_cliente VARCHAR (255) NOT NULL,
nombre_cliente VARCHAR(255) NOT NULL,
telefono_cliente VARCHAR(255) NOT NULL
);

CREATE TABLE proveedores (
nit_proveedor BIGINT(20) PRIMARY KEY,
ciudad_proveedor VARCHAR(255) NOT NULL,
direccion_proveedor VARCHAR(255) NOT NULL,
nombre_proveedor VARCHAR(255) NOT NULL,
telefono_proveedor VARCHAR(255) NOT NULL
);

CREATE TABLE productos (
codigo_producto BIGINT(20) PRIMARY KEY,
iva_compra DOUBLE NOT NULL,
nit_proveedor BIGINT(20) NOT NULL,
nombre_producto VARCHAR(255) NOT NULL,
precio_compra DOUBLE NOT NULL,
precio_venta DOUBLE NOT NULL,
FOREIGN KEY (nit_proveedor) REFERENCES proveedores(nit_proveedor)
);

CREATE TABLE ventas (
codigo_venta BIGINT(20) PRIMARY KEY AUTO_INCREMENT,
cedula_cliente BIGINT(20) NOT NULL,
cedula_usuario BIGINT(20) NOT NULL,
iva_venta DOUBLE NOT NULL,
total_venta DOUBLE NOT NULL,
valor_venta DOUBLE NOT NULL,
FOREIGN KEY (cedula_cliente) REFERENCES clientes(cedula_cliente),
FOREIGN KEY (cedula_usuario) REFERENCES usuarios(cedula_usuario)
);

CREATE TABLE detalle_ventas (
codigo_detalle_venta BIGINT(20),
cantidad_producto INT(11) NOT NULL,
codigo_producto BIGINT(20) NOT NULL,
codigo_venta BIGINT NOT NULL,
valor_total DOUBLE,
valor_venta DOUBLE,
valor_iva DOUBLE,
FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto),
FOREIGN KEY (codigo_venta) REFERENCES ventas(codigo_venta)
);


INSERT INTO usuarios VALUES(00000000,'admin@tienda_londono.com','Administrador','admin','administrador');
INSERT INTO usuarios VALUES(66666666,'pablo.londono@tienda_londono.com','Pablo Londoño','123456','plondono2');
INSERT INTO usuarios VALUES(11111111,'jesus.layton@tienda_londono.com','Jesus Layton','123456','jlayton');
INSERT INTO usuarios VALUES(22222222,'jennyfer.lopez@tienda_londono.com','Jennyfer Lopez','123456','jlopez');
INSERT INTO usuarios VALUES(33333333,'paula.londono@tienda_londono.com','Paula Londoño','123456','plondono');
INSERT INTO usuarios VALUES(44444444,'eduardo.londono@tienda_londono.com','Eduardo Londoño','123456','elondono');


INSERT INTO clientes VALUES(100,'Av 1 # 2 -34','cliente1@cliente.com','Cliente 1','2345678');
INSERT INTO clientes VALUES(101,'Av 2 # 3 -45','cliente2@cliente.com','Cliente 2','6457894');
INSERT INTO clientes VALUES(102,'Av 9 # 8 -78','cliente3@cliente.com','Cliente 3','6585678');
INSERT INTO clientes VALUES(103,'Av 6 # 8 -25','cliente4@cliente.com','Cliente 4','2458678');
INSERT INTO clientes VALUES(104,'Cra 10 # 20 -340','cliente5@cliente.com','Cliente 5','6447515');


INSERT INTO proveedores VALUES(100,'Av 1 # 2 -34','proveedor1@proveedor.com','proveedor 1','2345678');
INSERT INTO proveedores VALUES(101,'Av 2 # 3 -45','proveedor2@proveedor.com','proveedor 2','6457894');
INSERT INTO proveedores VALUES(102,'Av 9 # 8 -78','proveedor3@proveedor.com','proveedor 3','6585678');
INSERT INTO proveedores VALUES(103,'Av 6 # 8 -25','proveedor4@proveedor.com','proveedor 4','2458678');
INSERT INTO proveedores VALUES(104,'Cra 10 # 20 -340','proveedor5@proveedor.com','proveedor 5','6447515');
INSERT INTO proveedores VALUES(105,'Av 1 # 2 -34','proveedor1@proveedor.com','proveedor 1','2345678');
INSERT INTO proveedores VALUES(106,'Av 2 # 3 -45','proveedor2@proveedor.com','proveedor 2','6457894');
INSERT INTO proveedores VALUES(107,'Av 9 # 8 -78','proveedor3@proveedor.com','proveedor 3','6585678');
INSERT INTO proveedores VALUES(108,'Av 6 # 8 -25','proveedor4@proveedor.com','proveedor 4','2458678');
INSERT INTO proveedores VALUES(109,'Cra 10 # 20 -340','proveedor5@proveedor.com','proveedor 5','6447515');


INSERT INTO productos VALUES(201,0.19,100,'Leche Descremada',2000.0,3000.0);
INSERT INTO productos VALUES(202,0.19,100,'Azucar',2000.0,3000.0);
INSERT INTO productos VALUES(203,0.19,101,'Mantequilla',2000.0,3000.0);
INSERT INTO productos VALUES(204,0.19,101,'Pan',2000.0,3000.0);
INSERT INTO productos VALUES(205,0.19,102,'Harina',2000.0,3000.0);
INSERT INTO productos VALUES(206,0.19,102,'Huevos',2000.0,3000.0);
INSERT INTO productos VALUES(207,0.19,103,'Tomate',2000.0,3000.0);
INSERT INTO productos VALUES(208,0.19,103,'Cebolla',2000.0,3000.0);
INSERT INTO productos VALUES(209,0,104,'Lechuga',2000.0,3000.0);
INSERT INTO productos VALUES(210,0,104,'Zanahoria',2000.0,3000.0);


CREATE UNIQUE INDEX unique_user ON proveedor(nit_proveedor);
CREATE UNIQUE INDEX unique_user ON clientes(cedula_cliente);
CREATE UNIQUE INDEX unique_user ON ventas(codigo_venta);
CREATE UNIQUE INDEX unique_user ON detalle_ventas(codigo_detalle_venta);
CREATE UNIQUE INDEX unique_user ON usuarios(cedula_usuario);
CREATE UNIQUE INDEX unique_user ON proveedor(nit_proveedor);

SELECT * FROM usuarios;
SELECT * FROM proveedores;
SELECT * FROM ventas;
SELECT * FROM detalle_ventas;
SELECT * FROM clientes;
SELECT * FROM productos;

DELETE FROM usuarios WHERE cedula_usuario < 10 AND cedula_usuario > 0;

DELETE from proveedores WHERE nit_proveedor=100;

DELETE FROM productos;
DELETE FROM ventas;
DELETE FROM detalle_ventas;

SELECT clientes.cedula_cliente, clientes.nombre_cliente, SUM(total_venta) AS total_venta FROM ventas INNER JOIN clientes on clientes.cedula_cliente = ventas.cedula_cliente GROUP BY clientes.cedula_cliente;

