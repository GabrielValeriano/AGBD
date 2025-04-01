SELECT f.title as titulo, c.name as categoria, lg.name as idioma 
FROM film f 
INNER JOIN film_category fc
on f.film_id = fc.film_id
INNER JOIN category c
on fc.category_id = c.category_id
INNER JOIN language lg
on f.language_id = lg.language_id
WHERE length BETWEEN 60 AND 120 

SELECT sf.first_name as nombre, sf.last_name as apellido, c.city as ciudad, ct.country as pais
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