SELECT f.title as titulo, c.name as categoria, lg.name as idioma 
FROM film f 
INNER JOIN film_category fc
on f.film_id = fc.film_id
INNER JOIN category c
on fc.category_id = c.category_id
INNER JOIN language lg
on f.language_id = lg.language_id
WHERE length BETWEEN 60 AND 120 

SELECT sf.first_name as nombre, sf.last_name as apellido, a.address_id as direccion,c.city as ciudad, ct.country as pais
FROM staff sf
INNER JOIN store s
on sf.store_id = s.store_id
INNER JOIN address a
on s.address_id = a.address_id
INNER JOIN city c
on a.city_id = c.city_id
INNER JOIN country ct
on c.country_id = ct.country_id

SELECT f.title as titulo, max(r.return_date) as DevolucionesMaxima, min(r.return_date) as DevolucionesMinima
FROM film f
INNER JOIN inventory i
on f.film_id = i.film_id
INNER JOIN rental r
on i.inventory_id = r.inventory_id
"GROUP BY f.title"

SELECT *
FROM film f
INNER JOIN film_category fc
on f.film_id = fc.film_id
INNER JOIN category c
on fc.category_id = c.category_id
INNER JOIN language l
on f.language_id = l.language_id
INNER JOIN film_actor fa
on f.film_id = fa.film_id
INNER JOIN actor a
on fa.actor_id = a.actor_id
INNER JOIN inventory i
on f.film_id = i.film_id
INNER JOIN film_text ft
on i.film_id = ft.film_id
INNER JOIN store s
on i.store_id = s.store_id
INNER JOIN rental r
on i.inventory_id = r.inventory_id
INNER JOIN payment p
on r.rental_id = p.rental_id
INNER JOIN staff sf
on s.store_id = sf.store_id
INNER JOIN address ad
on s.address_id = ad.address_id
INNER JOIN customer ct
on ad.address_id = ct.address_id
INNER JOIN city cy
on ad.city_id = cy.city_id
INNER JOIN country cn
on cy.country_id = cn.country_id

SELECT count(*), rating
FROM film f
GROUP BY rating

SELECT count(*), c.name as categoria
FROM film f
INNER JOIN film_category fc
on f.film_id = fc.film_id
INNER JOIN category c
on fc.category_id = c.category_id
GROUP BY c.category_id

SELECT count(*) AS CantidadDeActores, a.first_name as nombre, a.last_name as apellido
FROM film f
INNER JOIN film_actor fa
on f.film_id = fa.film_id
INNER JOIN actor a
on fa.actor_id= a.actor_id
GROUP BY a.actor_id
ORDER BY CantidadDeActores DESC LIMIT 10

SELECT count(*) AS Ejemplares, a.address as direccion, c.city as ciudad, cy.country as pais
FROM inventory i
INNER JOIN store s
on i.store_id = s.store_id
INNER JOIN address a
on s.address_id= a.address_id
INNER JOIN city c
on a.city_id = c.city_id
INNER JOIN country cy
on c.country_id = cy.country_id
GROUP BY i.store_id

SELECT count(i.film_id) AS peliculas, a.address as direccion, c.city as ciudad, cy.country as pais
FROM film f
INNER JOIN inventory i
on f.film_id = i.film_id
INNER JOIN store s
on i.store_id = s.store_id
INNER JOIN address a
on s.address_id= a.address_id
INNER JOIN city c
on a.city_id = c.city_id
INNER JOIN country cy
on c.country_id = cy.country_id
GROUP BY s.store_id

SELECT AVG(f.rental_duration*f.rental_rate) as PromedioDeRentas, c.name as categoria
FROM film f
INNER JOIN inventory i
on f.film_id = i.film_id
INNER JOIN rental r 
on i.inventory_id = r.inventory_id
INNER JOIN film_category fc
on f.film_id = fc.film_id
INNER JOIN category c 
on fc.category_id = c.category_id
GROUP BY c.category_id

SELECT f.title as Pelicula, SUM(rental_rate*rental_duration) as CostoTotal, r.rental_date as DiaDeAlquiler, r.return_date as DiaDeDevolucionesPorAccidentes
FROM film f
INNER JOIN inventory i
on f.film_id = i.film_id
INNER JOIN rental r
on i.inventory_id = r.inventory_id
WHERE f.title = "ALABAMA DEVIL"

SELECT f.title as Nombre, c.name as Categoria, f.length as Duracion
FROM film f
INNER JOIN film_category fc
on f.film_id = fc.film_id
INNER JOIN category c
on fc.category_id = c.category_id
ORDER BY length DESC

SELECT f.title as Nombre, count(a.actor_id) as cantidadActores
FROM film f
INNER JOIN film_actor fa
on f.film_id = fa.film_id
INNER JOIN actor a
on fa.actor_id = a.actor_id
WHERE f.title LIKE 'w%'
GROUP BY f.title
HAVING cantidadActores >=5
ORDER BY cantidadActores ASC

SELECT c.first_name as Nombre, c.last_name as Apellido, SUM(p.amount) as TotalPagado
FROM payment p 
INNER JOIN customer c
on p.customer_id = c.customer_id
GROUP BY c.customer_id
HAVING TotalPagado

SELECT f.title as Titulo, f.length as Duracion, a.first_name as NombreActor
FROM film f
INNER JOIN film_actor fa
on f.film_id = fa.film_id
INNER JOIN actor a
on fa.actor_id = a.actor_id
GROUP BY NombreActor
HAVING Duracion <= 60
ORDER BY Duracion ASC

/*apellido del cliente con su ciudad, pais, direccion, sus alquileres y pagos 
  ,ordenado los pagos de menor a mayor.*/

SELECT cs.last_name as Cliente, c.city as Ciudad, cu.country as Pais, ad.address as Direccion, f.rental_rate as Alquileres, p.amount as Pagos
FROM customer cs
INNER JOIN address ad
on cs.address_id = ad.address_id
INNER JOIN city c
on ad.city_id = c.city_id
INNER JOIN country cu
on c.country_id = cu.country_id
INNER JOIN payment p
on cs.customer_id = p.customer_id
INNER JOIN rental r
on p.rental_id = r.rental_id
INNER JOIN inventory i
on r.inventory_id = i.inventory_id
INNER JOIN film f
on i.film_id = f.film_id
ORDER BY Pagos ASC

/*Insertarse uno mismo como actor con todos sus campos.*/

INSERT INTO actor(actor_id, first_name, last_name, last_update)
VALUES (201,"GABRIEL","VALERIANO","2020-12-23 07:12:31")

/*Insertar 2 amigos o nombres que consideren.*/

INSERT INTO actor(actor_id, first_name, last_name, last_update)
VALUES (202,"MIGUEL","DIAZ","2020-12-23 07:12:31"),(203,"JOEL","CARI","2020-12-23 07:12:31")

/*Modificar los 3 datos ingresados por datos nuevos o de gente famosa.*/

/*Modificamos a Gabriel*/
UPDATE actor
SET actor_id = 204, first_name = "TOBEY", last_name = "MAGUIRE", last_update = "2020-12-23 07:12:30"
WHERE  actor_id = 201

/*Modificamos a Miguel*/
UPDATE actor
SET actor_id = 205, first_name = "ANDREW", last_name = "GARDFIELD", last_update = "2020-12-23 07:12:30"
WHERE  actor_id = 202

/*MOdificamos a Joel*/
UPDATE actor
SET actor_id = 206, first_name = "TOM", last_name = "HOLAND", last_update = "2020-12-23 07:12:30"
WHERE  actor_id = 203

/*Borrar todos los datos ingresados finalmente.*/
DELETE FROM actor
WHERE actor_id >= 204 AND actor_id <= 206 