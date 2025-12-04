#Question 1  Count how many cities are there in each country?

SELECT 
    country.Code AS CountryCode,
    country.Name AS CountryName,
    COUNT(city.ID) AS NumberOfCities
FROM 
    country
LEFT JOIN 
    city ON country.Code = city.CountryCode
GROUP BY 
    country.Code, country.Name
ORDER BY 
    NumberOfCities DESC;

#Question 2  Display all continents having more than 30 countries.
SELECT 
    Continent,
    COUNT(Code) AS NumberOfCountries
FROM 
    country
GROUP BY 
    Continent
HAVING 
    COUNT(Code) > 30;

#Question 3  List regions whose total population exceeds 200 million
SELECT 
    Region,
    SUM(Population) AS TotalPopulation
FROM 
    country
GROUP BY 
    Region
HAVING 
    SUM(Population) > 200000000;

#Question 4  Find the top 5 continents by average GNP per country.
SELECT 
    Continent,
    AVG(GNP) AS AverageGNP
FROM 
    country
GROUP BY 
    Continent
ORDER BY 
    AverageGNP DESC
LIMIT 5;

#Question 5  Find the total number of official languages spoken in each continent.
SELECT 
    c.Continent,
    COUNT(DISTINCT cl.Language) AS TotalOfficialLanguages
FROM 
    countrylanguage cl
JOIN 
    country c ON cl.CountryCode = c.Code
WHERE 
    cl.IsOfficial = 'T'
GROUP BY 
    c.Continent;

#Question 6  Find the maximum and minimum GNP for each continent.
SELECT 
    Continent,
    MAX(GNP) AS MaxGNP,
    MIN(GNP) AS MinGNP
FROM 
    country
GROUP BY 
    Continent;

#Question 7  Find the country with the highest average city population.
SELECT 
    c.Name AS CountryName,
    AVG(ci.Population) AS AvgCityPopulation
FROM 
    country c
JOIN 
    city ci ON c.Code = ci.CountryCode
GROUP BY 
    c.Code, c.Name
ORDER BY 
    AvgCityPopulation DESC
LIMIT 1;

#Question 8  List continents where the average city population is greater than 200,000.
SELECT 
    c.Continent,
    AVG(ci.Population) AS AvgCityPopulation
FROM 
    country c
JOIN 
    city ci ON c.Code = ci.CountryCode
GROUP BY 
    c.Continent
HAVING 
    AVG(ci.Population) > 200000;

###Question 9  Find the total population and average life expectancy for each 
#continent, ordered by average life expectancy descending.

SELECT 
    Continent,
    SUM(Population) AS TotalPopulation,
    AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM 
    country
GROUP BY 
    Continent
ORDER BY 
    AvgLifeExpectancy DESC;
#question 10  Find the top 3 continents with the highest average life expectancy,
# but only include those where total population is over 200 million

SELECT 
    Continent,
    SUM(Population) AS TotalPopulation,
    AVG(LifeExpectancy) AS AvgLifeExpectancy
FROM 
    country
GROUP BY 
    Continent
HAVING 
    SUM(Population) > 200000000
ORDER BY 
    AvgLifeExpectancy DESC
LIMIT 3;
