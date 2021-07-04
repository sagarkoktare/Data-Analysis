CREATE DATABASE COVIDINFO

SELECT * FROM COVIDINFO..covidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4


-- SELECT * FROM COVIDINFO..covidVaccinations
-- ORDER BY 3,4

-- SELECT DATA THAT WE ARE GOING TO USE
 SELECT location, date , total_cases, new_cases, total_deaths, population
  FROM COVIDINFO..covidDeaths
  WHERE continent IS NOT NULL
  ORDER BY 1,2
  
  -- lOOKING AT TOTAL CASES / TOTAL DEATHS
  -- Shows likelihood in your country
  SELECT location, DATE, total_cases, total_deaths, (total_deaths / total_cases)*100 as 'DeathPercentage'
  FROM COVIDINFO..covidDeaths
  WHERE location like '%states%' AND continent IS NOT NULL
  ORDER BY 1,2
  
 -- lOOKING AT TOTAL CASES vs POPULATION
 -- what % of Population affected with Covid-19
  SELECT location, DATE, population,total_cases, (total_cases / population)*100 as 'PecentagePopultionInfected'
  FROM COVIDINFO..covidDeaths
  -- WHERE location like '%states%'
    WHERE continent IS NULL
  ORDER BY 1,2
  
   -- lOOKING AT TOTAL CASES vs POPULATION
 -- what % of Population affected with Covid-19
  SELECT location, population, DATE,MAX(total_cases) as 'HighestInfectedCount', MAX((total_cases / population)*100) as 'PecentagePopultionInfected'
  FROM COVIDINFO..covidDeaths
  -- WHERE location like '%states%'
  -- WHERE continent IS NULL
  GROUP BY location, population, DATE
  ORDER BY PecentagePopultionInfected DESC
  
  -- lOOKING AT COUNTRIES with highest infection rate vs Population
  SELECT location, population,MAX(total_cases) AS HighestInfectionCount, MAX((total_cases / population)*100) as 'TotalCasesInfected'
  FROM COVIDINFO..covidDeaths
  -- WHERE location like '%states%'
  -- WHERE continent IS NULL
  GROUP BY location, population
  ORDER BY TotalCasesInfected DESC
  
   -- lOOKING AT COUNTRIES with Highest Death rate vs Population
  SELECT location, population,MAX(cast(total_deaths as int)) AS HighestInfectionCount, MAX((total_deaths / population)*100) as 'Totaldeaths'
  FROM COVIDINFO..covidDeaths
  -- WHERE location like '%states%'
  -- WHERE continent IS NULL
  GROUP BY location, population
  ORDER BY Totaldeaths DESC
   
  -- SHOWING COUNTRIES with Highest Death rate PER Population
  SELECT location,MAX(cast(total_deaths as int)) AS TotalDeathCount
  FROM COVIDINFO..covidDeaths
  -- WHERE location like '%states%'
  WHERE continent IS NOT NULL
  GROUP BY location
  ORDER BY TotalDeathCount DESC  
 
   -- BY CONTINENT Highest Death rate PER Population
  SELECT location,MAX(cast(total_deaths as int)) AS TotalDeathCount
  FROM COVIDINFO..covidDeaths
  -- WHERE location like '%states%'
  WHERE continent IS NULL
  GROUP BY location
  ORDER BY TotalDeathCount DESC  
  
  -- BY CONTINENT Highest Death rate PER Population
  SELECT location,SUM(cast(total_deaths as int)) AS TotalDeathCount
  FROM COVIDINFO..covidDeaths
  -- WHERE location like '%states%'
  WHERE continent IS NULL
  and location not in ('World','European Union','International')
  GROUP BY location
  ORDER BY TotalDeathCount DESC
  
  -- GLOABAL NUMBERS
  
  SELECT SUM(new_cases) AS NewCases, SUM(CAST(new_deaths AS INT)) AS NewDeaths,SUM(CAST(new_deaths AS INT))/SUM(new_cases) * 100 AS NewDeathPercentage --, (total_deaths / total_cases)*100 as 'DeathPercentage'
  FROM COVIDINFO..covidDeaths
  --WHERE location like '%states%' 
  WHERE continent IS NOT NULL
  -- GROUP BY date
  ORDER BY 1,2

-- LOOKING AT TOTAL POPULATION VS VACCINATION

SELECT * 
FROM COVIDINFO..covidDeaths dea 
JOIN COVIDINFO..covidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date

SELECT dea.continent, dea.location, dea.date, vac.new_vaccinations
FROM COVIDINFO..covidDeaths dea 
JOIN COVIDINFO..covidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
  WHERE dea.continent IS NOT NULL	
  ORDER BY 2,3
  
 SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
 , SUM(CONVERT(INT,vac.new_vaccinations)) -- OVER (Partition BY dea.location order by dea.location,  dea.Date) as RollingPeopleVaccinated
FROM COVIDINFO..covidDeaths dea 
JOIN COVIDINFO..covidVaccinations vac
	ON dea.location = vac.location
	and dea.date = vac.date
  WHERE dea.continent IS NOT NULL	
  ORDER BY 2,3
  
  -- TEMP TABLE
  
  With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From PortfolioProject..CovidDeaths dea
Join PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100 as PercentPeopleVaccinated
From PopvsVac
 
 
 -- creating view to store data for later visualization 
 CREATE VIEW globalNumber as
  SELECT SUM(new_cases) AS NewCases, SUM(CAST(new_deaths AS INT)) AS NewDeaths,SUM(CAST(new_deaths AS INT))/SUM(new_cases) * 100 AS NewDeathPercentage --, (total_deaths / total_cases)*100 as 'DeathPercentage'
  FROM COVIDINFO..covidDeaths
  --WHERE location like '%states%' 
  WHERE continent IS NOT NULL
  -- GROUP BY date
  --  ORDER BY 1,2
 