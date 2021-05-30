###### This python script is used for the following taks
###### 1. To scrape a webpage for a csv file containing worldwide vaccination manufacturer data.
###### 2. Perform a direct csv file download of UK Vaccination data.
###### 3. Perform a driect csv file download of world vaccination data. 
###### This script will utilise the BeautifulSoup library for web scraping tasks. 

# Import Libraries
import pandas as pd
import numpy as np
import requests
from bs4 import BeautifulSoup as bs

# Load webpage
rv = requests.get('https://github.com/owid/covid-19-data/blob/master/public/data/vaccinations/locations.csv')

# Convert to a beautiful soup object
webpage_v = bs(rv.content)

# Scrape Table Data based on CSS selector
table_v = webpage_v.select("table.js-csv-data")[0]

# Find all columns and put into list
columns_v = table_v.find('thead').find_all('th')

# Find all column names from columns list
column_names_v = [c.string for c in columns_v]

# Define where rows are in html text
table_rows_v = table_v.find('tbody').find_all('tr')

# Run through each row and take data from everything after 'td'
v = []
for tr in table_rows_v:
    td = tr.find_all('td')
    row = [tr.string for tr in td]
    v.append(row)

# This removes first column of every row (index)
for x in v:
    del x[0]

# Take data and put into columns
df_v = pd.DataFrame(v, columns=column_names_v)

# Replace empty cells with NaN
df_v = df_v.replace('',np.nan)

# Removing blank cells in total vaccinations column
df_v = df_v.dropna(subset = ['vaccines'])

# Saving to csv
df_v.to_csv('Vaccinations_type_updated.csv')

# Direct download of CSV from uk gov data
df_gov = pd.read_csv('https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=overview&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22newPeopleVaccinatedFirstDoseByPublishDate%22:%22newPeopleVaccinatedFirstDoseByPublishDate%22,%22newPeopleVaccinatedSecondDoseByPublishDate%22:%22newPeopleVaccinatedSecondDoseByPublishDate%22,%22cumPeopleVaccinatedFirstDoseByPublishDate%22:%22cumPeopleVaccinatedFirstDoseByPublishDate%22,%22cumPeopleVaccinatedSecondDoseByPublishDate%22:%22cumPeopleVaccinatedSecondDoseByPublishDate%22%7D&format=csv')

df_gov = df_gov.drop(columns = ['areaType','areaName','areaCode'])
df_gov.to_csv('vaccinations_gov_updated.csv')

# Direct download of vaccinatrion data
df_v2 = pd.read_csv('https://github.com/owid/covid-19-data/raw/master/public/data/vaccinations/vaccinations.csv')
df_v2.to_csv('Vaccinations_updated.csv')
