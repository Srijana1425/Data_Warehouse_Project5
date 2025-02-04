# Designing a Data Warehouse for Reporting and OLAP

In this project, I explored the relationship between weather and customer reviews of restaurants using real-world Yelp and climate datasets. The project revolves around architecting and designing a Data Warehouse (DWH) for the purpose of reporting and online analytical processing (OLAP). I utilized Snowflake, a cloud-native data warehouse system, to accomplish this task.

## Getting Set Up

### Downloading the Data
To begin, you need to download the necessary datasets for your analysis. Follow these steps:

1. Visit the Yelp Dataset page and enter your details to access the data. <a href="https://www.yelp.com/dataset/download">YELP dataset page</a>
2. Download the "Download JSON" and "COVID-19 Data" files.
3. If the COVID-19 Data is not available on Yelp, you can get it from the provided Kaggle page. <a href="https://www.kaggle.com/datasets/claudiadodge/yelp-academic-data-set-covid-features?select=yelp_academic_dataset_covid_features.json">Kaggle Page to download COVID-19 data</a>
4. Save the downloaded files using single-word filenames for ease of loading into the database later.

You'll also need climate data:

1. Download the precipitation and temperature data CSV files using links below.
    <ul>
       <li><a href="https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/temperature-degreef.csv">Temperature csv</a></li>
       <li><a href="https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/precipitation-inch.csv">Precipitation csv</a></li>
    </ul>
 

### Snowflake Account Setup
If you already have a Snowflake account, you can skip this step. Otherwise, follow these instructions:

1. Create a Snowflake account at [Snowflake: Your Cloud Data Platform](https://www.snowflake.com/).
2. Choose the "Start for free" option and provide your details.
3. Select an Enterprise plan and a cloud provider.
4. Activate your account using the link sent to your email.

Install the SnowSQL client:

1. Install the SnowSQL client from the [Snowflake Repository](https://docs.snowflake.com/en/user-guide/snowsql-install-config.html).
2. For Mac OS users, troubleshoot using the provided link if needed.

### Explore the Data
Take some time to familiarize yourself with the data you've uploaded into Snowflake.

## Instructions

1. **Data Architecture Diagram**: Create a diagram illustrating how you will move data into Staging, Operational Data Store (ODS), and Data Warehouse environments. This diagram will help visualize your approach.

2. **Staging Environment**: Set up a staging environment/schema in Snowflake. 

3. **Data Upload to Staging**: Upload all Yelp and Climate data to the staging environment. Make sure to split large JSON files (< 3 million records per file in Yelp) using tools like PineTools or 7zip to prevent parsing errors.

4. **Operational Data Store (ODS)**: Create an ODS environment/schema in Snowflake. Design an entity-relationship (ER) diagram to illustrate data structure.

5. **Migrate to ODS**: Move the data from the staging environment to the ODS environment. Document this process using screenshots.

6. **Data Warehouse Environment**: Design a STAR schema for the Data Warehouse environment.

7. **Migrate to Data Warehouse**: Transfer data from ODS to the Data Warehouse. Capture this process with screenshots.

8. **Query and Analysis**: Use SQL queries to analyze the data in the Data Warehouse. Specifically, explore how weather affects Yelp reviews. Provide SQL code and screenshots.
## Data Architect Diagram
<img src="./Project Design a Data Warehouse for Reporting and OLAP/ScreenShots/YELP New Data Architect.png">

## Tables in Staging Area
<img src="./Project Design a Data Warehouse for Reporting and OLAP/ScreenShots/Temperature and Precipitation Table Staging.png">

## Tables in ODS 
<img src="./Project Design a Data Warehouse for Reporting and OLAP/ScreenShots/YELP and Climate Tables at ODS.png">

### Entity Relationship Model In ODS
<img src="./Project Design a Data Warehouse for Reporting and OLAP/ScreenShots/YELP ERD diagram.PNG">

## Table in DWH
<img src="./Project Design a Data Warehouse for Reporting and OLAP/ScreenShots/YELP and Climate Table in DWH.png">

### Star Schema in DWH
<img src="./Project Design a Data Warehouse for Reporting and OLAP/ScreenShots/Star Schema.png">

### Reporting
<img src="./Project Design a Data Warehouse for Reporting and OLAP/ScreenShots/SQL code to reports the business name, temperature, precipitation, and ratings.png">

## SQL Scripts
<ul>
    <li><a href="./Project Design a Data Warehouse for Reporting and OLAP/SQL Script RAW to STAGING.sql">SQL queries code that transforms staging to ODS.</a></li>
    <li><a href="./Project Design a Data Warehouse for Reporting and OLAP/SQL STAGING to ODS.sql">SQL queries code that specifically uses JSON functions to transform data from a single JSON structure of staging to multiple columns of ODS.</a></li>
    <li><a href="./Project Design a Data Warehouse for Reporting and OLAP/SQL ODS to DWH.sql">SQL queries code necessary to move the data from ODS to DWH.</a></li>
    <li><a href="./Project Design a Data Warehouse for Reporting and OLAP/SQL Integrating Climate and Yelp data.sql">SQL queries code to integrate climate and Yelp data</a></li>
    <li><a href="./Project Design a Data Warehouse for Reporting and OLAP/SQL reporting business,temperature, precipitation.sql">SQL queries code that reports the business name, temperature, precipitation, and ratings.</a></li>
</ul>

## Conclusion

This project empower me to delve into the relationship between weather conditions and restaurant reviews using real-world data and advanced data warehousing techniques. By applying the principles learned in the Designing Data Systems Course and leveraging Snowflake's capabilities, I created a robust infrastructure for reporting and OLAP analysis. Happy exploring!
