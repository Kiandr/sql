select c.code, c.name, c.region, p.year, p.fertility_rate
from countries as c
inner join populations as p
on c.code  = p.country_code 


SELECT c.code, name, region, e.year, fertility_rate, unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
INNER JOIN economies AS e;