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


