/*
Why does the following code result in an error?
SELECT c.name AS country, l.name AS language
FROM countries AS c
INNER JOIN languages AS l;
Because: INNER JOIN requires a specification of the key field (or fields) in each table.
*/

-- These two are the same and correct:
SELECT *
FROM countries
INNER JOIN economies
ON countries.code = economies.code;

SELECT *
FROM countries
INNER JOIN economies
USING(code);

SELECT ___.___ AS ___, ___, ___.___ AS ___, ___
FROM ___ AS ___
___ JOIN ___ AS ___
___(___);

SELECT c.name AS country, continent, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
USING(code);