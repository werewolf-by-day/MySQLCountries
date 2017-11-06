# 1. display all countries that speak Slovene
#     return name of country, language, and language percentage
#     arrange results by language percentage in descending order

SELECT countries.name, languages.language, languages.percentage
FROM countries
LEFT JOIN languages ON countries.id = languages.country_id
WHERE languages.language = 'Slovene'
ORDER BY languages.percentage DESC;

# 2. display total number of cities for each country
# 	   return name of country and total number of cities
# 	   arrange results by number of cities in descending order

SELECT countries.name, COUNT(cities.name) AS number_of_cities
FROM countries
LEFT JOIN cities ON countries.id = cities.country_id
GROUP BY countries.name
ORDER BY number_of_cities DESC;

# 3. display all cities in Mexico with a population greater than 500,000
# 	   arrange result by population in descending order

SELECT cities.name, cities.population
FROM cities
JOIN countries ON cities.country_id = countries.id
WHERE countries.name = 'Mexico' AND cities.population > 500000
ORDER BY cities.population DESC;

# 4. display all languages in each country with a percentage greater than 89%
# 	   arrange result by percentage in descending order

SELECT countries.name, languages.language, languages.percentage
FROM countries
LEFT JOIN languages ON countries.id = languages.country_id
WHERE languages.percentage > 89
ORDER BY languages.percentage DESC;

# 5. display all countries with surface area below 501 and population greater than 100,000
SELECT name, surface_area, population
FROM countries
WHERE surface_area < 501 AND population >100000;

# 6. display all countries with only Constitutional Monarchy with a capital greater than 200
#     and a life expectancy greater than 75 years
SELECT name, government_form, life_expectancy
FROM countries
WHERE government_form = 'Constitutional Monarchy' AND capital > 200;

# 7. display all cities of Argentina inside the Buenos Aires district that have population greater than 500,000
# 	   return country name, city name, district, and population
SELECT countries.name, cities.name, cities.district, cities.population
FROM countries
LEFT JOIN cities ON countries.id = cities.country_id
WHERE countries.name = 'Argentina' AND cities.district = 'Buenos Aires' AND cities.population > 500000;

# 8. display the name of the region and the number of countries in each region
# 	   arrange the result by number of countries in descending order
SELECT region, COUNT(region) AS countries
FROM countries
GROUP BY region
ORDER BY countries DESC;