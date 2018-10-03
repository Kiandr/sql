-- names and capitals that are not in common 
SELECT name 
FROM cities
except
SELECT capital
FROM countries
order by name;

select capital 
from countries 
except 
select name
from cities
order by capital 