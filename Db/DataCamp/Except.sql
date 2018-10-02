-- names and capitals that are not in common 
SELECT name 
FROM cities
except
SELECT capital
FROM countries
order by name;
