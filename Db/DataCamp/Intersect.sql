SELECT code, year
FROM economies
INTERSECT
SELECT country_code, year
FROM populations
ORDER BY code, year;

select  name
from countries 
INTERSECT 
select  name
from cities

