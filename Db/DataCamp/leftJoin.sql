select c.name as country, c.region, p.life_expectancy as life_exp
from countries as c
left  join populations as p
on c.code = p.country_code
where p.life_expectancy IS NOT NULL and p.year = 2010
order by p.life_expectancy ASC 
limit  5


