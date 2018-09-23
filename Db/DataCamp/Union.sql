-- pick specified columns from 2010 table
SELECT *
-- 2010 table will be on top
FROM economies2010
-- which set theory clause?
UNION
-- pick specified columns from 2015 table
SELECT *
-- 2015 table on the bottom
FROM economies2015
-- order accordingly
ORDER BY code, year;

SELECT country_code
FROM cities
UNION
SELECT code
FROM currencies
ORDER BY country_code;

SELECT country_code as code, year
FROM populations
union all
SELECT code, year
FROM economies
ORDER BY code, year;