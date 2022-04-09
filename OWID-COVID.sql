select*
From PortfolioProject.dbo.CovidDeaths
Order by 3,5

select location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject.dbo.CovidDeaths
Order by 3,5

--Looking at tota cases vs total deaths
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercent
from PortfolioProject..CovidDeaths
Order by 1,2

--Looking at tota cases vs total deaths
SELECT Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercent
from PortfolioProject..CovidDeaths
Where location = 'Nigeria'
Order by 1,2

--Looking at the total cases vs Population
SELECT Location, date, population, total_cases,(total_cases/population)*100 as InfectionRate
from PortfolioProject..CovidDeaths
--Where location = 'Nigeria'
Order by 1,2

--Looking at Countries with highest infection rate compared to population
SELECT Location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population)*100) as InfectionRate
from PortfolioProject..CovidDeaths
--Where location = 'Nigeria'
group by location, population
Order by InfectionRate desc

--Showing Countries with the highest death count per population
SELECT Location, max(total_deaths) as TotalDeathCount, max((total_deaths/population)*100) as DeathRate
from PortfolioProject..CovidDeaths
--Where location = 'Nigeria'
group by location, population
Order by DeathRate desc

--Showing Total deaths in Countries
SELECT Location, population, SUM(total_deaths) as TotalDeathsReported, SUM(total_cases) as TotalCasesReported
from PortfolioProject..CovidDeaths
--Where location = 'Nigeria'
group by location, population
Order by TotalCasesReported desc