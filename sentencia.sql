SELECT * from INHABITANT

SELECT * from INHABITANT WHERE job = "amicable"

SELECT * from INHABITANT WHERE STATE = "friendly" and "weaponsmith"

SELECT * from INHABITANT WHERE STATE = "friendly" and job LIKE "%smith" 

SELECT personid from inhabitant where name = "Stranger"

SELECT gold from inhabitant where name = "Stranger"

SELECT *from item where owner is null 

UPDATE item SET owner = 20 WHERE owner is null

SELECT *from inhabitant where state = "friendly" and job ="dealer" or job ="merchant" 

UPDATE item SET owner =15 WHERE item = "teapot" or item ="ring"

UPDATE inhabitant SET name = name == "joel" WHERE personid =20

SELECT *from inhabitant where job ="baker" order by gold desc

SELECT i.name
FROM inhabitant i
INNER JOIN village v
ON  v.chief = i.personid 
where v.name = 'Onionville'
