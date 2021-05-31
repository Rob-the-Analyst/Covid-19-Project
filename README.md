# Covid-19 Vaccinations Exploration with Python, SQL, and Power BI 

# 1. Project Overview
### 1.1 Description
This aim of this project was to develop a dashboard which displays key information about the global roll out of all vaccines administered to combat the Covid-19 virus. (*Additional Key indicators concerning UK vaccinations are included since this is my country of residence and is, therefore, relevant to me*). The dashboard is then updated regurarly to provide a continuous picture of various key indicators. Key indicators were chosen based on their relevance and statistical importance to someone seeking a broad picture of the vaccine roll-out. The tools that were used for the project are Python, Excel, Power BI, MySQL, and Windows Task Manager. 

### 1.2 Key Information Selected
* Total global vaccinations
* Top countries for vaccine doses
* Vaccine manufacturers by Country
* Total vaccinations in the UK
* Second doses in the UK

### 1.3 Tools Used
* **Python** 
* **MySQL** 
* **MS Excel**  
* **Power BI**  
* **Windows Task Manager**

### 1.4 Data Sources
* **UK Governmant Vaccination Data:** https://coronavirus.data.gov.uk/details/vaccinations.
* **Collected Covid-19 Data:** https://github.com/owid/covid-19-data.
* **Original Source:** https://ourworldindata.org/covid-vaccinations.

# 2. Project Execution

### 2.1 Scraping Data from Source using Python with BeautifulSoup Library
This script was used to pull data from various sources and save them in tubulated form as a CSV file. It also download data in CSV form directly. Details of this process can be found in the 'Vaccine_update.py' and Scrape and 'Download Data.ipynb' files. 


### 2.2 Initial Data Exploration in MySQL
This step involved initial querying of the data to extract the key parameters outlined in the first section. Details of all queries used can be found in the 'SQL Queries.sql' file. 

### 2.3 Creating Dashboard in Power BI
The key information was then visualized in Power BI using relevant visuals. A screenshot the completed dashboard can found as the file 'Power BI screenshot.png'.


### 2.4 Setting up Data Gateway and Schedule Refresh in Power BI Portal
Once the dashboard was complete, it was published to the Power BI web portal. From there, a data gateway was set up to the directory conatining the updated CSV files. Secondly, a scheduled refresh was enabled to update the dashboard daily. 

### 2.5 Setting up .bat File and Window task Manager
In order to update the CSV files before the dashboard pulled data from it, a task was set up in windows task manager which ran a bat file. The bat file ran the Vaccine_update.py program. This was set up to run daily 1 hour before the Power BI scheduled refresh. 


# 3. Final Dashboard in Power BI
![PowerBI screenshot](https://user-images.githubusercontent.com/51541316/120192656-5ddf1400-c213-11eb-9a6c-9005b0e9f858.PNG)

