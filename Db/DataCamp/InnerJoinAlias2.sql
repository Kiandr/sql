SELECT c.code AS country_Code , c.name, e.year, e.inflation_rate
FROM countries AS c
inner JOIN economies as  e
ON c.code = e.code;