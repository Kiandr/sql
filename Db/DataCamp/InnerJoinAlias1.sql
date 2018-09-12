select cities.name as city, countries.name as country, countries.region
from cities  
inner join countries  
on cities.country_code = countries.code