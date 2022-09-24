create table covid_vaccinations(
    iso_code char,
    continent char,
    country char,
    date date,
    new_tests integer,
    total_tests integer,
    total_tests_per_thousand float,
    new_tests_per_thousand float,
    new_tests_smoothed integer,
    new_tests_smoothed_per_thousand float,
    positive_rate float,
    tests_per_case float,
    tests_units char,
    total_vaccinations integer,
    people_vaccinated integer,
    people_fully_vaccinated integer,
    new_vaccinations integer,
    new_vaccinations_smoothed integer,
    total_vaccinations_per_hundred float,
    people_vaccinated_per_hundred float,
    people_fully_vaccinated_per_hundred float,
    new_vaccinations_smoothed_per_million integer,
    stringency_index float,
    population_density float,
    median_age float,
    aged_65_older float,
    aged_70_older float,
    gdp_per_capita float,
    extreme_poverty float,
    cardiovasc_death_rate float,
    diabetes_prevalence float,
    female_smokers float,
    male_smokers float,
    handwashing_facilities float,
    hospital_beds_per_thousand float,
    life_expectancy float,
    human_development_index float
);

copy public."covid_vaccinations" from 'C:\Users\muham\Downloads\DA\1 Porto SQL - Data Exploration - COVID\CovidVaccinations.csv' with csv header;
select * from public.covid_vaccinations;

create table covid_deaths (
    iso_code text,
    continent text,
    location text,
    date date,
    total_cases int,
    new_cases int,
    new_cases_smoothed float,
    total_deaths int,
    new_deaths int,
    new_deaths_smoothed float,
    total_cases_per_million float,
    new_cases_per_million float,
    new_cases_smoothed_per_million float,
    total_deaths_per_million float,
    new_deaths_per_million float,
    new_deaths_smoothed_per_million float,
    reproduction_rate float,
    icu_patients int,
    icu_patients_per_million float,
    hosp_patients int,
    hosp_patients_per_million float,
    weekly_icu_admissions int,
    weekly_icu_admissions_per_million float,
    weekly_hosp_admissions int,
    weekly_hosp_admissions_per_million float,
    new_tests int,
    total_tests int,
    total_tests_per_thousand float,
    new_tests_per_thousand float,
    new_tests_smoothed int,
    new_tests_smoothed_per_thousand float,
    positive_rate float,
    tests_per_case float,
    tests_units int,
    total_vaccinations int,
    people_vaccinated int,
    people_fully_vaccinated int,
    new_vaccinations int,
    new_vaccinations_smoothed int,
    total_vaccinations_per_hundred float,
    people_vaccinated_per_hundred float,
    people_fully_vaccinated_per_hundred float,
    new_vaccinations_smoothed_per_million float,
    stringency_index float,
    population int,
    population_density float,
    median_age float,
    aged_65_older float,
    aged_70_older float,
    gdp_per_capita float,
    extreme_poverty float,
    cardiovasc_death_rate float,
    diabetes_prevalence float,
    female_smokers float,
    male_smokers float,
    handwashing_facilities float,
    hospital_beds_per_thousand float,
    life_expectancy float,
    human_development_index float
);

select * from public.covid_deaths;

copy public."covid_deaths" from 'C:\Users\muham\Downloads\DA\1 Porto SQL - Data Exploration - COVID\CovidDeaths.csv';

alter table covid_deaths
add column new_cases_smoothed_per_million float;

copy public."covid_deaths" from 'C:\Users\muham\Downloads\DA\1 Porto SQL - Data Exploration - COVID\CovidDeaths.csv';

DROP TABLE IF EXISTS covid_deaths CASCADE;
create table covid_deaths (
    iso_code text,
    continent text,
    location text,
    date date,
    total_cases int,
    new_cases int,
    new_cases_smoothed float,
    total_deaths int,
    new_deaths int,
    new_deaths_smoothed float,
    total_cases_per_million float,
    new_cases_per_million float,
    new_cases_smoothed_per_million float,
    total_deaths_per_million float,
    new_deaths_per_million float,
    new_deaths_smoothed_per_million float,
    reproduction_rate float,
    icu_patients int,
    icu_patients_per_million float,
    hosp_patients int,
    hosp_patients_per_million float,
    weekly_icu_admissions int,
    weekly_icu_admissions_per_million float,
    weekly_hosp_admissions int,
    weekly_hosp_admissions_per_million float,
    new_tests int,
    total_tests int,
    total_tests_per_thousand float,
    new_tests_per_thousand float,
    new_tests_smoothed int,
    new_tests_smoothed_per_thousand float,
    positive_rate float,
    tests_per_case float,
    tests_units int,
    total_vaccinations int,
    people_vaccinated int,
    people_fully_vaccinated int,
    new_vaccinations int,
    new_vaccinations_smoothed int,
    total_vaccinations_per_hundred float,
    people_vaccinated_per_hundred float,
    people_fully_vaccinated_per_hundred float,
    new_vaccinations_smoothed_per_million float,
    stringency_index float,
    population int,
    population_density float,
    median_age float,
    aged_65_older float,
    aged_70_older float,
    gdp_per_capita float,
    extreme_poverty float,
    cardiovasc_death_rate float,
    diabetes_prevalence float,
    female_smokers float,
    male_smokers float,
    handwashing_facilities float,
    hospital_beds_per_thousand float,
    life_expectancy float,
    human_development_index float
);

ALTER TABLE covid_deaths
ALTER COLUMN tests_units SET DATA TYPE text;

copy public."covid_deaths" from 'C:\Users\muham\Downloads\DA\1 Porto SQL - Data Exploration - COVID\CovidDeaths.csv' with csv header;

ALTER TABLE covid_deaths
ALTER COLUMN population SET DATA TYPE bigint;

copy public."covid_deaths" from 'C:\Users\muham\Downloads\DA\1 Porto SQL - Data Exploration - COVID\CovidDeaths.csv' with csv header;

ALTER TABLE covid_deaths
ALTER COLUMN weekly_hosp_admissions SET DATA TYPE float;

copy public."covid_deaths" from 'C:\Users\muham\Downloads\DA\1 Porto SQL - Data Exploration - COVID\CovidDeaths.csv' with csv header;

ALTER TABLE covid_deaths
ALTER COLUMN weekly_icu_admissions SET DATA TYPE float;

copy public."covid_deaths" from 'C:\Users\muham\Downloads\DA\1 Porto SQL - Data Exploration - COVID\CovidDeaths.csv' with csv header;

select * from public.covid_deaths;

select * from public.covid_deaths
order by 3,4;