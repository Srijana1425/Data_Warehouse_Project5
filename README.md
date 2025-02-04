# 📂Designing a Data Warehouse for Reporting and OLAP

In this project, I explored the relationship between weather and customer reviews of restaurants using real-world Yelp and climate datasets. The project revolves around architecting and designing a Data Warehouse (DWH) for the purpose of reporting and online analytical processing (OLAP). I utilized Snowflake, a cloud-native data warehouse system, to accomplish this task.

## Getting Set Up ⚙️

### Downloading the Data 📥
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

<hr>
### Data Loading and Analysis Instructions


**Step 1:** Create an ER Diagram
Design an Entity-Relationship (ER) diagram to visualize the movement of data into Staging, Operational Data Store (ODS), and Data Warehouse environments. This diagram will help illustrate your approach.

![**ER DIAGRAM**](https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/screenshorts/1.Data_architecture_diagram(YELP).jpg)


**Step 2:** Set Up a Staging Environment/Schema in Snowflake
- *Snowflake Account Setup*

  If you already have a Snowflake account, you can skip this step. Otherwise, follow these instructions:
  
    1.Create a Snowflake account at [Snowflake: Your Cloud Data Platform](https://www.snowflake.com/).
  
    2.Choose the "Start for free" option and provide your details.
  
    3.Select an Enterprise plan and a cloud provider.

    4.Activate your account using the link sent to your email.

- *Install the SnowSQL Client*
  
    1.Install the SnowSQL client from the [Snowflake Repository](https://docs.snowflake.com/en/user-guide/snowsql-install-config.html).
    
    2.For Mac OS users, troubleshoot using the provided link if needed.

**Step 3:** Upload Data to Staging
- Upload all Yelp and Climate data to the staging environment.
- Ensure large JSON files are split using tools like PineTools or 7zip to prevent parsing errors.
- Use the SnowSQL command line and <a href="https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/JSON%20functions%20to%20transform%20staging%20data%20from%20a%20single%20JSON%20structure%20into%20multiple%20columns%20for%20ODS.pdf">JSON functions</a> to load large data into staging.

**Upload Data to Staging**

![data to staging](https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/screenshorts/3.Add_2_files_into_the_staging.jpg)

**Step 4:** Create an ODS Environment/Schema in Snowflake
- Set up an ODS environment/schema in Snowflake.
- Move the data from the staging environment to the ODS environment.

**ER DIAGRAM**

 ![ER Diagram](https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/screenshorts/4.ODS_ER_diagram.jpg)

**STAGING TO ODS**

![staging to ODS](https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/screenshorts/5.staging_data_to_ODS.jpg)


**Step 5:** Design a STAR Schema for the Data Warehouse Environment
- Develop a STAR schema for the Data Warehouse environment.
- Create a Data Warehouse environment/schema in Snowflake.
- Move the data from the ODS environment to the Data Warehouse environment.

**STAR SCHEMA**

![star](https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/screenshorts/8.Fact_table_ER_diagram.jpg)


**ODS to DWH**

![ods to dwh](https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/screenshorts/7.data_from_ODS_to_DWH.jpg)


**Step 6:** Query and Analysis
- Use SQL queries to analyze the data in the Data Warehouse.
- Specifically, explore how weather affects Yelp reviews.

**Report showing the business name, temperature, precipitation, and ratings**

![report](https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/screenshorts/9.report_showing_the_business_name.jpg)

<hr>

## Project Files 📁

To further understand our project, please refer to the following files and directories in the repository:

Screenshots : Folder containing all the ER diagrams and images screenshots.

SQL Code :SQL code used for creating and managing the database. You can view it here.
<ul>
    <li><a href="https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/SQL%20queries%20that%20integrate%20the%20climate%20and%20Yelp%20datasets.sql">SQL queries that integrate the climate and Yelp datasets.sql.</a></li>
    <li><a href="https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/SQL%20queries%20that%20moves%20the%20data%20from%20ODS%20to%20DWH.sql">SQL queries that moves the data from ODS to DWH.sql</a></li>
    <li><a href="https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/SQL%20queries%20that%20produce%20a%20report%20showing%20the%20business%20name%2C%20temperature%2C%20precipitation%2C%20and%20ratings.sql">SQL queries that produce a report showing the business name, temperature, precipitation, and ratings.sql</a></li>
    <li><a href="https://github.com/Srijana1425/Data_Warehouse_Project5/blob/main/SQL%20queries%20that%20transform%20staging%20to%20ODS.sql">SQL queries that transform staging to ODS.sql</a></li>
</ul>
 











