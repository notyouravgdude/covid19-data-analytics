# Creating Database
CREATE DATABASE covid_db;
USE covid_db;

CREATE TABLE covid_data (
    iso_code VARCHAR(10),
    continent VARCHAR(30),
    location VARCHAR(100),
    date DATE,
    total_cases FLOAT,
    new_cases FLOAT,
    total_deaths FLOAT,
    new_deaths FLOAT,
    total_vaccinations FLOAT,
    people_vaccinated FLOAT,
    people_fully_vaccinated FLOAT,
    population FLOAT
);



# Top 10 Countries by Vaccination
SELECT location,
       MAX(people_fully_vaccinated / population) * 100 AS vaccination_percent
FROM covid_data
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY vaccination_percent DESC
LIMIT 10;


# Fully Vaccinated Trend Over Time (India)
SELECT date, people_fully_vaccinated
FROM covid_data
WHERE location = 'India'
ORDER BY date;


# Global Fully Vaccinated Count Over Time
SELECT date, SUM(people_fully_vaccinated) AS global_fully_vax
FROM covid_data
GROUP BY date
ORDER BY date;


# Vaccination percentage by Continent
SELECT continent,
       MAX(people_fully_vaccinated / population) * 100 AS vaccinated_percent
FROM covid_data
WHERE continent IS NOT NULL
GROUP BY continent;

# Global Daily New Cases
SELECT date, SUM(new_cases) AS daily_new_cases
FROM covid_data
GROUP BY date
ORDER BY date;


# Fully Vaccinated in India
SELECT MAX(people_fully_vaccinated) AS fully_vax
FROM covid_data
WHERE location = 'India';

