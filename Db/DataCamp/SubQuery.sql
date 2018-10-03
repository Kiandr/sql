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

-- Practice 1
-- select the appropriate fields
-- from the cities table
-- with city name in the field of capital cities
select name , country_code, urbanarea_pop
from cities
where name IN
  (select capital
   from countries)
ORDER BY urbanarea_pop DESC;

-- 
SELECT countries.name AS country, COUNT(*) AS cities_num
FROM cities
INNER JOIN countries
ON countries.code = cities.country_code
GROUP BY country
ORDER BY cities_num DESC, country
LIMIT 9;

select countries.name as country, 
    (select count(*) 
     from cities
     where  cities.country_code = countries.code) as cities_num
from countries
order by cities_num desc, country  
limit 9;

-- How many languages in each country code
select  code , count(*) as lang_num
from languages
group by code

--Include the previous query (aliased as subquery) as a subquery in the FROM clause of a new query.
--Select the local name of the country from countries.
--Also, select lang_num from subquery.
--Make sure to use WHERE appropriately to match code in countries and in subquery.
--Sort by lang_num in descending order.

select countries.local_name, foo.lang_num  as lang_num
from countries, (select code, count(*) as lang_num from languages group by code) as foo
where foo.code = countries.code
order by lang_num  desc

