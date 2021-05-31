	-- This script is for initial exploration of the obtained vaccination data --

-- Creating database for the tables
Create Schema covidvaccines;

-- Initial schema select
Use covidvaccines;

-- Tables were creating when importing the CSV files using the import wizard 

-- Overview of the data
Select * From worldvaccines 
Select * From vaccinemanufacturer
Select * From ukvaccines

-- List of columns to assess what attributes we have and what data types they are
Show Columns From worldvaccines
Show Columns From vaccinemanufacturer
Show Columns From ukvaccines

-- Fill in blanks with null value in order to modify data type
	-- worldvaccines
Update worldvaccines Set total_vaccinations = Null Where total_vaccinations = ''
Update worldvaccines Set people_vaccinated = Null Where people_vaccinated = ''
Update worldvaccines Set daily_vaccinations = Null Where daily_vaccinations = ''
Update worldvaccines Set total_vaccinations_per_hundred = Null Where total_vaccinations_per_hundred = ''
Update worldvaccines Set people_vaccinated_per_hundred = Null Where people_vaccinated_per_hundred = ''
Update worldvaccines Set daily_vaccinations_per_million = Null Where daily_vaccinations_per_million = ''

-- Modify name of date column 
Alter Table worldvaccines
	Rename Column date To date_

Alter Table ukvaccines
	Rename Column date To date_

-- Altering data type for columns to enable application of functions
	-- worldvaccines table
Alter Table worldvaccines
	Modify Column date_ Date,
    Modify Column total_vaccinations Int Null,
    Modify Column people_vaccinated Int Null,
    Modify Column daily_vaccinations Int Null,
    Modify Column total_vaccinations_per_hundred Decimal (10,2) Null,
    Modify Column people_vaccinated_per_hundred Decimal (10,2) Null,
    Modify Column daily_vaccinations_per_million Decimal (10,2) Null;
    
    -- ukvaccines table
Alter table ukvaccines
	Modify Column date_ Date,
    Modify Column newPeopleVaccinatedFirstDoseByPublishDate Int Null,
    Modify Column newPeopleVaccinatedSecondDoseByPublishDate Int Null;

-- Deleting categories that are irrelevant 
Delete From worldvaccines
	Where location = 'Upper middle income'
	Or location = 'Lower middle income'
	Or location = 'High income'
    
-- Shows the sources of data for the manufacturers of vaccines by country 
Select Distinct(source_website)
From vaccinemanufacturer

-- Shows the total number of vaccine doses in each country to date and saves as a view
Create View totalvaccinespercountry As
	Select location, MAX(total_vaccinations) As 'TotalDoses'
	From worldvaccines
	Group By location
	Order By TotalDoses desc
    
-- Shows the total number of vaccine doses per hundred people in each country and saves as a view
Create View totalvaccinesperhundred As
	Select location, MAX(total_vaccinations_per_hundred) As 'TotalDosesPerHundred'
	From worldvaccines
	Group By location
	Order By TotalDosesPerHundred desc

-- Shows the current total vaccine doses worldwide and saves as a view
Create View toalglobalvaccines As
	Select MAX(total_vaccinations) As 'globalvaccines'
    From worldvaccines 
    Where location = 'World'
    
-- Shows the current total vaccine doses per hundred people worldwide and saves as a view
Create View toalglobalvaccinesperhundred As
	Select MAX(total_vaccinations_per_hundred) As 'globalvaccinesperhundred'
    From worldvaccines 
    Where location = 'World'
    
-- Shows total first doses in the UK
Create View totalfirstdoseuk As
	Select MAX(cumPeopleVaccinatedFirstDoseByPublishDate)
    From ukvaccines
    
-- Shows total second doses in the UK
Create View totalseconddoseuk As
	Select MAX(cumPeopleVaccinatedSecondDoseByPublishDate)
    From ukvaccines
