--a) a) Crear la base de datos con el archivo create_restaurant_db.sql

--b) Explorar la tabla “menu_items” para conocer los productos del menú.
select * from menu_items;
--Encontrar el número de artículos en el menú.
select distinct item_name from menu_items;
--R=32 ARTICULOS

-- ¿Cuál es el artículo menos caro y el más caro en el menú?
SELECT item_name, price FROM MENU_ITEMS
order by price desc;
--El articulo mas caro es shrimp Scampi con un costo de $19.95
SELECT item_name, price FROM MENU_ITEMS
order by price asc;
--El articulo mas barato es edamame con un costo de $5.00

--¿Cuántos platos americanos hay en el menú?
select category from menu_items
where category = 'American';
--R= 6 PLATOS AMERICANOS

--¿Cuál es el precio promedio de los platos?
select avg (price) as promedio_precio from menu_items;
--El precio promedio es 13.28593


--c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
select * from order_details;

--1.- Realizar consultas para contestar las siguientes preguntas:
-- ¿Cuántos pedidos únicos se realizaron en total?

select count (*) order_details_id from order_details;
--R= 12234 pedidos únicos


-- ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?

SELECT order_id, count (item_id)
	from order_details 
	Group by order_id
	order by count(item_id) desc
	limit 5;
-- R=los pedidos con order_id con mayor numero de articulos,en este caso 14, fueron:
--440, 2675, 3473, 4305, 443.


--cuándo se realizó el primer pedido y el último pedido?
select * from order_details;

--ULTIMO PEDIDO:
SELECT order_date from order_details
order by order_date desc;
--R= 2023-03-31

--PRIMER PEDIDO:
SELECT order_date from order_details
order by order_date;
--R= 2023-01-01


-- ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
SELECT * from order_details
where order_date  between '2023-01-01' and '2023-01-05';
--R= 702 PEDIDOS

--d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.

--1.- Realizar un left join entre entre order_details y menu_items con el identificador
--item_id(tabla order_details) y menu_item_id(tabla menu_items).

--Se muestra el JOIN:
SELECT * FROM order_details as OD
left join menu_items AS MI
on OD.item_id= MI.menu_item_id;


--5 puntos clave:
1) ¿CUALES FUERON LOS 5 PLATILLOS MAS PEDIDOS Y LOS 5 MENOS PEDIDOS DEL MENU? 
select COUNT(OD.order_id), MI.item_name
	From order_details as OD
	LEFT JOIN menu_items as MI
	ON OD.item_id=MI.menu_item_id
	group by MI.item_name
	order by count(OD.order_id) desc
	limit 5;

--R=Los platillos mas pedidos fueron: Hamburguer, Edamame, Korean Beef Bowl, Cheeseburger y Frenchfries

Select COUNT(OD.order_id), MI.item_name
	From order_details as OD
	LEFT JOIN menu_items as MI
	ON OD.item_id=MI.menu_item_id
	group by MI.item_name
	order by count(OD.order_id) asc
	limit 5;

--R=Los platillos menos pedidos fueron: ChickenTacos, Potstickers, CheeseLasagna y SteakTacos.

--a) a) Crear la base de datos con el archivo create_restaurant_db.sql

--b) Explorar la tabla “menu_items” para conocer los productos del menú.
select * from menu_items;
--Encontrar el número de artículos en el menú.
select distinct item_name from menu_items;
--R=32 ARTICULOS

-- ¿Cuál es el artículo menos caro y el más caro en el menú?
SELECT item_name, price FROM MENU_ITEMS
order by price desc;
--El articulo mas caro es shrimp Scampi con un costo de $19.95
SELECT item_name, price FROM MENU_ITEMS
order by price asc;
--El articulo mas barato es edamame con un costo de $5.00

--¿Cuántos platos americanos hay en el menú?
select category from menu_items
where category = 'American';
--R= 6 PLATOS AMERICANOS

--¿Cuál es el precio promedio de los platos?
select avg (price) as promedio_precio from menu_items;
--El precio promedio es 13.28593


--c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
select * from order_details;

--1.- Realizar consultas para contestar las siguientes preguntas:
-- ¿Cuántos pedidos únicos se realizaron en total?

select count (*) order_details_id from order_details;
--R= 12234 pedidos únicos


-- ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?

SELECT order_id, count (item_id)
	from order_details 
	Group by order_id
	order by count(item_id) desc
	limit 5;
-- R=los pedidos con order_id con mayor numero de articulos,en este caso 14, fueron:
--440, 2675, 3473, 4305, 443.


--cuándo se realizó el primer pedido y el último pedido?
select * from order_details;

--ULTIMO PEDIDO:
SELECT order_date from order_details
order by order_date desc;
--R= 2023-03-31

--PRIMER PEDIDO:
SELECT order_date from order_details
order by order_date;
--R= 2023-01-01


-- ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
SELECT * from order_details
where order_date  between '2023-01-01' and '2023-01-05';
--R= 702 PEDIDOS

--d) Usar ambas tablas para conocer la reacción de los clientes respecto al menú.

--1.- Realizar un left join entre entre order_details y menu_items con el identificador
--item_id(tabla order_details) y menu_item_id(tabla menu_items).

--Se muestra el JOIN:
SELECT * FROM order_details as OD
left join menu_items AS MI
on OD.item_id= MI.menu_item_id;


--5 puntos clave:
1) ¿CUALES FUERON LOS 5 PLATILLOS MAS PEDIDOS Y LOS 5 MENOS PEDIDOS DEL MENU? 
select COUNT(OD.order_id), MI.item_name
	From order_details as OD
	LEFT JOIN menu_items as MI
	ON OD.item_id=MI.menu_item_id
	group by MI.item_name
	order by count(OD.order_id) desc
	limit 5;

--R=Los platillos mas pedidos fueron: Hamburguer, Edamame, Korean Beef Bowl, Cheeseburger y Frenchfries

Select COUNT(OD.order_id), MI.item_name
	From order_details as OD
	LEFT JOIN menu_items as MI
	ON OD.item_id=MI.menu_item_id
	group by MI.item_name
	order by count(OD.order_id) asc
	limit 5;

--R=Los platillos menos pedidos fueron: ChickenTacos, Potstickers, CheeseLasagna y SteakTacos.

--LOS 3 TOTALES DE MAYOR PEDIDO Y SU PRECIO:
Select COUNT(OD.order_id), MI.price
	From order_details as OD
	LEFT JOIN menu_items as MI
	ON OD.item_id=MI.menu_item_id
	group by MI.price
	order by count(OD.order_id) DESC
	limit 3;

--DE ACUERDO A LO ANTERIOR LO QUE MAS SE VENDE SON PLATILLOS DE $17.95, SEGUIDO POR PLATILLOS DE $7.00, Y FINALMENTE DE $13.95

--Ubicar la categoría o el lugar de origen del platillo mas pedido:
Select COUNT(OD.order_id), MI.category
	From order_details as OD
	LEFT JOIN menu_items as MI
	ON OD.item_id=MI.menu_item_id
	group by MI.category
	order by count(OD.order_id) desc
	limit 1;

--De acuerdo a lo anterior el platillo mas pedido es el asiático.




