# Covid-19 Vaccinations Exploration with Python, SQL, and Power BI 

## 1. Projects Aims
### 1.1 Project Overview
This aim of this project was to develop a dashboard which displays key information about the global roll out of all vaccines administered to combat the Covid-19 virus. The dashboard is then updated regurarly to provide a continuous picture of various key indicators. Key indicators were chosen based on their relevance and statistical importance to someone seeking a broad picture of the vaccine roll-out. The tools that were used for the project are Python, Excel, Power BI, MySQL, and Windows Task Manager. 

### 1.2 Key Information Selected
* 


## 2. Project Execution
### 2.1 Tools Used
* **Python.** This is used to scrape the data from the source and store as a csv for analysis. 
* **MySQL.** This is used for preliminary exploration of the data to determine key information about the vaccine roll out. 
* **MS Excel.** This is used to store the data and use as the data source for Power BI. 
* **Power BI.** This is used to extract the data in the stored excel files and to extract the data at regurlar intervals. 
* **Windows Task Manager**. This is used to run the Python script at set times to regularly update the excel files.

### Steps Taken in the Project. 
1. The data source was chosen based on its comprehensiveness and reliability. *Data Source:* https://ourworldindata.org/covid-deaths.
2. A Python script utilizing the BeautifulSoup library was developed to extract the data source from the above link and store it as a csv file. 
3. Initial data exploration was carried out in MySQL to determine what data was needed to provide key information. 
4. Once the key information had been determined, relevant graphical representations were chosen to best communicate the data. 
5. Once the Dashboard was completed, a .bat file was created so that Windows Task Manager could run the Python script every hour. This would update the excel files.
6. Next, a data gateway was set up in the Power BI web portal to create a connection to the Excel data. 
7. Finally, a scheduled refresh was set up to refresh the dashboard every hour to keep it up to date with the changing data. 

## 3. Repository Files

