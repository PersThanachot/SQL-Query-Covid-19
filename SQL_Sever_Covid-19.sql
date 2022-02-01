SELECT 
	Location,
	date,
	total_cases,
	new_cases,
	total_deaths,
	population
FROM PortfolioProject.dbo.CovidDeaths_28_1_2022
ORDER BY 
	Location,
	date

-- Looking at Total Cases vs. Total Deaths

SELECT 
	Location,
	date,
	total_cases,
	total_deaths,
	(total_deaths/total_cases)*100 AS DeathsPercentage
FROM PortfolioProject.dbo.CovidDeaths_28_1_2022
WHERE Location LIKE '%Thai%'
ORDER BY 
	Location,
	date

-- Looking at Total Cases vs. Population

SELECT 
	Location,
	date,
	total_cases,
	population,
	(total_cases/population)*100 AS TotalCasePercentage
FROM PortfolioProject.dbo.CovidDeaths_28_1_2022
WHERE Location LIKE '%Thai%'
ORDER BY 
	Location,
	date

-- Looking at Countries with Hightest Infection Rate Compared to Population

SELECT 
	Location,
	max(total_cases) AS max_cases,
	population,
	(max(total_cases)/population)*100 AS HightestIfectionCount
FROM PortfolioProject.dbo.CovidDeaths_28_1_2022
GROUP BY 
	Location,
	population
ORDER BY HightestIfectionCount DESC

-- Showing Countries with Hightest Deaths Count per Population

SELECT 
	Location,
	max(cast(total_deaths as int)) AS max_deaths,
	population,
	(max(cast(total_deaths as int))/population)*100 AS HightestDeathsCount
FROM PortfolioProject.dbo.CovidDeaths_28_1_2022
GROUP BY 
	Location,
	population
ORDER BY max_deaths DESC

--LET'S BREAK THINGS DOWN BY CONTINENT

SELECT 
	continent,
	max(cast(total_deaths as int)) AS TotalDeaths
FROM PortfolioProject.dbo.CovidDeaths_28_1_2022
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeaths DESC

--showing continent with the highest deaths count per population

SELECT 
	continent,
	(max(cast(total_deaths as int))/sum(population)) AS HightestDeathsCount
FROM PortfolioProject.dbo.CovidDeaths_28_1_2022
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY HightestDeathsCount ASC