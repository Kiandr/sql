-- Case, When, Then, Else, And 
SELECT name, continent, code, surface_area,
        -- first case
    CASE WHEN ___ > ___ THEN '___'
        -- second case
        WHEN > ___ THEN ___
        -- else clause + end
        ELSE ___ END
        AS ___
FROM ___;

SELECT name, continent, code, surface_area,
        -- first case
    CASE WHEN surface_area > 2000000 THEN 'large'
        -- second case
        WHEN surface_area > 350  THEN 'medium'
        -- else clause + end
        ELSE 'small' END
        AS geosize_group
FROM countries;

SELECT countries.name, code, languages.name AS language
FROM countries
FULL JOIN languages
USING (code)
WHERE countries.name LIKE 'V%' OR countries.name IS NULL
ORDER BY countries.name;

SELECT *
FROM countries AS country
FULL JOIN languages AS language
USING (code)
FULL JOIN currencies AS curency
USING (code)
WHERE region LIKE 'M%esia';


SELECT c1.name AS country, region, l.name AS language,
       basic_unit, frac_unit
FROM countries AS c1
FULL JOIN languages AS l
USING (code)
FULL JOIN currencies AS c2
USING (code)
WHERE region LIKE 'M%esia';