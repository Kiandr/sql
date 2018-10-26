/*Final challenge (2)

Whoofta! That was challenging, huh?

Let's ease up a bit and calculate the average fertility rate for each region in 2015.

INSTRUCTIONS
100 XP
Include the name of region, its continent, and average fertility rate aliased as avg_fert_rate.
Sort based on avg_fert_rate ascending.
Remember that you'll need to GROUP BY all fields that aren't included in the aggregate function of SELECT.

Take Hint (-30 XP)*/

/* Query */
-- choose fields
SELECT ___, ___, ___(___) AS ___
-- left table
FROM ___ AS ___
-- right table
INNER JOIN ___ AS ___
-- join conditions
ON ___ = ___
-- specific records matching a condition
WHERE ___ = ___
-- aggregated for each what?
GROUP BY ___, ___
-- how should we sort?
ORDER BY ___;

/* My soltuion*/
-- choose fields
SELECT region, continent, AVG(fertility_rate) from populations) AS avg_fert_rate
-- left table
FROM countries AS c
-- right table
INNER JOIN populations AS p
-- join conditions
ON p.country_code = c.code
-- specific records matching a condition
WHERE p.year = 2015
-- aggregated for each what?
GROUP BY continent, region
-- how should we sort?
ORDER BY avg_fert_rate;