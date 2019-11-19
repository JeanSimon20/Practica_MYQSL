DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
/*1 Lista el nombre de todos los productos que hay en la tabla producto.*/
select nombre from producto; 
/*2 Lista los nombres y los precios de todos los productos de la tabla producto.*/
select nombre, precio from producto;
/*3 Lista todas las columnas de la tabla producto.*/
select * from producto; 
/*4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).*/
select precio, round((precio * 1.11),2) AS precio_dolares; 
/*5 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.*/
select 
nombre AS 'Nomnbre del producto',
   precio AS 'Precio en Euros',
  round(precio * 1.11) AS 'Precio en dolares'
from producto;
/*6 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.*/
SELECT upper(nombre) FROM producto; 
/*7 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.*/
SELECT lower(nombre) FROM producto; 
/*8 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante*/
SELECT nombre, UPPER(left(nombre,2)) FROM fabricante; 
/*9 Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.*/
select nombre,round(precio) from producto; 
/*10 Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.*/
select nombre,round(precio) from producto; 
/*11 Lista el código de los fabricantes que tienen productos en la tabla producto.*/
select codigo from producto; 
/*12 Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.*/
select distinct(codigo_fabricante) from producto; 
/*13 Lista los nombres de los fabricantes ordenados de forma ascendente.*/
select * from fabricante order by nombre ASC; 
/*14 Lista los nombres de los fabricantes ordenados de forma descendente.*/
select * from fabricante order by nombre DESC; 
/*15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.*/

/*16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/
SELECT * FROM fabricante LIMIT 0, 5; 
/*17 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta*/

/*18.Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)*/
select * 
from producto
order by precio asc
limit 1;
/*19.Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)*/
select * 
from producto
order by precio desc
limit 1;




