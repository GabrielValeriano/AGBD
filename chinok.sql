/*Nombre y Apellido de todos los empleados, en orden alfabético.*/

SELECT e.FirstName as Nombre, e.LastName as Apellido
FROM employees e
ORDER BY Nombre asc

/*Nombre y duración de todas las canciones del álbum "Big Ones" ordenados 
  del más largo al más corto*/

SELECT t.name as Nombre, t.Milliseconds as Duracion
FROM albums a 
INNER JOIN tracks t
on a.AlbumId = t.AlbumId
WHERE a.Title = "Big Ones"
ORDER BY Milliseconds DESC

/*Nombre de todos los géneros con la cantidad de canciones de cada uno*/

SELECT g.name as Genero, count(t.GenreId) as Canciones
FROM genres g
INNER JOIN tracks t
on g.GenreId = t.GenreId
GROUP BY g.GenreId

/*Nombre de los discos con al menos 5 canciones*/

SELECT a.Title as Disco, count(t.AlbumId) as Canciones
FROM albums a
INNER JOIN tracks t
on a.AlbumId = t.AlbumId
GROUP BY a.AlbumId 
HAVING Canciones >= 5
ORDER BY Canciones ASC

/*Nombre y precio total de los 10 discos más baratos*/
/*Incompleto*/

SELECT a.title as Disco, i.UnitPrice as Precio
FROM albums a
INNER JOIN tracks t
on a.AlbumId = t.AlbumId
INNER JOIN invoice_items i
on t.TrackId = i.TrackId
GROUP BY Precio
HAVING count(t.TrackId)
ORDER BY Disco
