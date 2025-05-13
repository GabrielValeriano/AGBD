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

SELECT a.title as Disco, sum(t.UnitPrice) as Precio
FROM albums a
INNER JOIN tracks t
on a.AlbumId = t.AlbumId
INNER JOIN invoice_items i
on t.TrackId = i.TrackId
GROUP BY Disco
HAVING Precio
ORDER BY Precio ASC LIMIT 10

/*Nombre del tema, nombre del género y nombre del disco 
  de los temas que valen $0.99*/

SELECT a.title as Disco, sum(t.UnitPrice) as Precio
FROM albums a
INNER JOIN tracks t
on a.AlbumId = t.AlbumId
INNER JOIN invoice_items i
on t.TrackId = i.TrackId
GROUP BY Disco
HAVING Precio <= 0.99
ORDER BY Precio ASC 

/*Nombre del tema, duración, nombre del disco y nombre 
  del artista de los 20 temas más cortos*/

SELECT t.name as Cancion, t.Milliseconds as Duracion, a.Title as Disco, ar.name as Artista
FROM tracks t
INNER JOIN albums a
on t.AlbumId = a.AlbumId
INNER JOIN artists ar
on a.ArtistId = ar.ArtistId
ORDER BY Duracion ASC LIMIT 20

/*Apellido, puesto, apellido del jefe y cantidad de clientes que atiende de todos los empleados,
  ordenado desde los que atienden más clientes a los que atienden menos*/
/*Incompleto(No era posible hacerlo)*/

SELECT e.LastName as Apellido, r.LastName AS Apellido_Jefe, count(c.CustomerId)
FROM employees e
INNER JOIN employees r
on r.ReportsTo = e.EmployeeId
INNER JOIN customers c
on r.EmployeeId = c.SupportRepId
GROUP by r.EmployeeId

SELECT employees.LastName FROM employees 
INNER JOIN employees r ON employees.EmployeeId = r.ReportsTo
INNER JOIN customers cu ON employees.EmployeeId = cu.SupportRepId