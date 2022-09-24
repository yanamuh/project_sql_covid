-- shows all dataset
SELECT * FROM public.covid_deaths;

-- Select data we will use 
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM public.covid_deaths
WHERE continent IS NOT NULL -- discard the total data for a continent
ORDER BY 1,2;

-- Looking at total cases vs total deaths
-- Shows likelihood of dying if you contract in Indonesia
Select location, date, total_cases, total_deaths, cast((cast(total_deaths as float)/total_cases)*100.00 as decimal(6,3)) as death_percentage
FROM public.covid_deaths
WHERE continent IS NOT NULL AND lower(location) like 'indonesia'
ORDER BY 1,2;

-- total cases vs population
-- Shows what percentage of population got covid
Select continent, location, date, total_cases, population, cast((cast(total_cases as float)/population)*100.00 as decimal(6,3)) as death_percentage
FROM public.covid_deaths
WHERE continent IS NOT NULL AND lower(continent) like 'asia'
ORDER BY 1,2,3;

-- Looking at countries with Highest Infection Rate compared to Population
SELECT location, population, MAX(total_cases) AS highest_infection_count, MAX((cast(total_cases as float)/population)*100.00) as percent_population_infected
FROM public.covid_deaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY percent_population_infected DESC;

-- Showing countries with highest death count per population
SELECT location, MAX(total_deaths) as total_death_count
FROM public.covid_deaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY total_death_count DESC;

-- BREAK DOWN BY CONTINENT
-- Showing continents with the highest total_death
SELECT continent, MAX(total_deaths) AS total_death_count
FROM public.covid_deaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_death_count DESC;

-- GLOBAL NUMBERS
-- per day
SELECT date, SUM(new_cases) AS total_cases_per_day, SUM(new_deaths) AS total_deaths_per_day, SUM(cast(new_deaths as float))/SUM(new_cases)*100 AS death_percentage
FROM public.covid_deaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2;

-- total number globally
SELECT SUM(new_cases) AS total_cases_per_day, SUM(new_deaths) AS total_deaths_per_day, SUM(cast(new_deaths as float))/SUM(new_cases)*100 AS death_percentage
FROM public.covid_deaths
WHERE continent IS NOT NULL
-- GROUP BY date
ORDER BY 1,2;

-- CHECK THE VACCINATIONS
-- Looking at Total Population vs Vaccinations

-- WITH CTE
WITH pop_vs_vac (continent, location, date, population, new_vaccination, rolling_people_vaccinated)
AS 
(
    SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
           SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
    FROM public.covid_deaths dea
    JOIN public.covid_vaccinations vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
--     ORDER BY 2,3
)
SELECT location, population, max(rolling_people_vaccinated) AS total_people_vaccinated, cast(max(rolling_people_vaccinated) as float)/population*100 AS percentage_people_vaccinated
FROM pop_vs_vac
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY percentage_people_vaccinated DESC
;
-- sepertinya ada yang salah dengan data Gibraltar dan Israel, perc vaksinasinya lebih tinggi dari total populasi

-- WITH TEMP TABLE
DROP TABLE IF EXISTS percent_population_vaccinated CASCADE
CREATE TABLE percent_population_vaccinated AS
(
   SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
           SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
    FROM public.covid_deaths dea
    JOIN public.covid_vaccinations vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
)

SELECT location, population, max(rolling_people_vaccinated) AS total_people_vaccinated, cast(max(rolling_people_vaccinated) as float)/population*100 AS percentage_people_vaccinated
FROM percent_population_vaccinated
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY percentage_people_vaccinated DESC
;

CREATE VIEW percent_population_vaccinated_2 AS
    SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
           SUM(vac.new_vaccinations) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
    FROM public.covid_deaths dea
    JOIN public.covid_vaccinations vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL;
    