-- MSSQL semi joint
SELECT name
FROM states
WHERE indep_year < 1800;

-- An other semi joint
SELECT president, country, continent FROM presidents;

-- Final semi point 
SELECT president, country, continent FROM presidents
WHERE country IN
(SELECT name
FROM states
WHERE indep_year < 1800);

-- Practice step 1
select code
from countries
where region like 'Middle East%';

-- Practice step 2
select  distinct name 
from languages 
where  code in (select code from countries where region = 'Middle East')
order by name;

-- Practice 2 #1
select count(*)
from countries
where continent like 'Oceania'

-- Practice 2 #2
select c2.code, c1.name ,  c2.basic_unit as currency
from  countries as c1
inner join 
currencies as c2
on c1.code = c2.code
where c1.continent like 'Oceania'

-- Practice 2 #3
select code, name 
from  countries 
where continent like 'Oceania' and code not in (select code from currencies)

-- Final Practice 
-- select the city name
select name
-- alias the table where city name resides
from cities AS c1
-- choose only records matching the result of multiple set theory clauses
-- dentify the country codes that are included in either economies or currencies but not in populations.
-- Use that result to determine the names of cities in the countries that match the specification in the previous instruction.
WHERE c1.country_code IN
(
    -- select appropriate field from economies AS e
    SELECT e.code
    FROM economies AS e
    -- get all additional (unique) values of the field from currencies AS c2  
    union
    SELECT c2.code
    FROM currencies AS c2
    -- exclude those appearing in populations AS p
    EXCEPT
    SELECT p.country_code
    FROM populations AS p
);

