--- AGV: 
select avg(life_expectancy)
from populations
where year = 2015

-- missing letters 
select *
from populations
where life_expectancy > 
    1.15 * ( select avg(life_expectancy) 
    from populations
    where year = 2015
    ) 
AND  year = 2015;

/*

SELECT *
FROM populations
WHERE life_expectancy >
  1.15 * (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015) AND
  year = 2015;
*/

-- Practice 1
-- select the appropriate fields
select name , country_code, urbanarea_pop
-- from the cities table
from cities
-- with city name in the field of capital cities
where name IN
  (select capital
   from countries)
ORDER BY urbanarea_pop DESC;