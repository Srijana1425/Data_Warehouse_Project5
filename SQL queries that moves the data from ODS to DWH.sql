--business_DWH Table
CREATE TABLE BUSINESS_DWH(
 business_id VARCHAR PRIMARY KEY,
 name VARCHAR,
 address VARCHAR,
 city VARCHAR,
 state VARCHAR,
 postal_code VARCHAR,
 latitude FLOAT,
 longitude FLOAT,
 stars FLOAT,
 review_count DECIMAL(18,3),
 is_open INT,
 attributes VARIANT,
 categories VARCHAR,
 hours VARIANT
);
INSERT INTO BUSINESS_DWH
SELECT 
    business_id,
    name,
    address,
    city,
    state,
    postal_code,
    latitude,
    longitude,
    stars,
    review_count,
    is_open,
    attributes,
    categories,
    hours
FROM "DATA_WAREHOUSE"."ODS".business_d;

--user_DWH Table
CREATE TABLE USER_DWH(
 user_id VARCHAR PRIMARY KEY,
 name VARCHAR,
 review_count INT,
 yelping_since VARCHAR,
 friends VARCHAR,
 useful INT,
 funny INT,
 cool INT,
 fans INT,
 elite VARCHAR,
 average_stars DECIMAL(18,3),
 compliment_hot INT,
 compliment_more INT,
 compliment_profile INT,
 compliment_cute INT,
 compliment_list INT,
 compliment_note INT,
 compliment_plain INT,
 compliment_funny INT,
 compliment_cool INT,
 compliment_writer INT,
 compliment_photos INT
);
INSERT INTO USER_DWH
SELECT
    user_id,
    name,
    review_count,
    yelping_since,
    friends,
    useful,
    funny,
    cool,
    fans,
    elite,
    average_stars,
    compliment_hot,
    compliment_more,
    compliment_profile,
    compliment_cute,
    compliment_list,
    compliment_note,
    compliment_plain,
    compliment_funny,
    compliment_cool,
    compliment_writer,
    compliment_photos 
FROM "DATA_WAREHOUSE"."ODS".user_d;

--checkin_DWH Table
CREATE TABLE checkin_DWH (
    checkin_date VARCHAR,
    business_id VARCHAR
);
INSERT INTO checkin_DWH
SELECT 
    checkin_date,
    business_id
FROM "DATA_WAREHOUSE"."ODS".checkin_D;

--review_DWH Table
CREATE TABLE review_DWH (
    review_id VARCHAR PRIMARY KEY,
    stars INT,
    date VARCHAR,
    text VARCHAR,
    useful INT,
    funny INT,
    cool INT
);
INSERT INTO review_DWH 
SELECT
    review_id,
    stars,
    date,
    text,
    useful,
    funny,
    cool   
FROM "DATA_WAREHOUSE"."ODS".review_D;

--covid_DWH Table
CREATE TABLE covid_DWH (
    business_id VARCHAR,
    highlights VARCHAR,
    delivery_or_takeout VARIANT,
    grubhub_enabled VARIANT,
    call_to_action_enabled VARIANT,
    request_a_quote_enabled VARIANT,
    covid_banner VARIANT,
    temporary_closed_until VARIANT,
    virtual_services_offered VARIANT
);
INSERT INTO covid_DWH
SELECT 
    business_id,
    highlights,
    delivery_or_takeout,
    grubhub_enabled,
    call_to_action_enabled,
    Request_a_quote_enabled,
    covid_banner,
    temporary_closed_until,
    virtual_services_offered   
FROM "DATA_WAREHOUSE"."ODS".covid_d;

--tip_DWH Table
CREATE TABLE tip_DWH (
    text VARCHAR,
    tip_date VARCHAR,
    compliment_count INT,
    business_id VARCHAR,
    user_id VARCHAR
);
INSERT INTO tip_DWH
SELECT 
    text,
    tip_date,
    compliment_count,
    business_id,
    user_id
FROM "DATA_WAREHOUSE"."ODS".tip_d;

--weather_DWH
CREATE TABLE weather_DWH(
   weather_date DATE PRIMARY KEY,
   min_temp FLOAT,
   max_temp FLOAT,
   normal_min_temp FLOAT,
   normal_max_temp FLOAT,
   precipitation VARCHAR,
   precipitation_normal FLOAT
);

INSERT INTO weather_DWH 
SELECT 
         t.date_t, 
         t.min_temp, 
         t.max_temp, 
         t.normal_min_temp,
         t.normal_max_temp,
         p.precipitation,
         p.precipitation_normal
FROM "DATA_WAREHOUSE"."ODS".temperature_d AS t
JOIN "DATA_WAREHOUSE"."ODS".precipitation_d AS p
ON t.date_t = p.date_p;

--fact table
create table TOTAL_INFO(
   business_id VARCHAR,
   review_id VARCHAR,
   user_id VARCHAR,
   weather_date DATE,
   FOREIGN KEY (business_id) REFERENCES business_DWH(business_id),
   FOREIGN KEY (review_id) REFERENCES review_DWH(review_id),
   FOREIGN KEY (user_id) REFERENCES user_DWH(user_id),
   FOREIGN KEY (weather_date) REFERENCES weather_DWH(weather_date)
);
INSERT INTO TOTAL_INFO
SELECT 
    r.review_id,
    u.user_id, 
    b.business_id, 
    r.date
FROM "DATA_WAREHOUSE"."ODS".review_d AS r
JOIN "DATA_WAREHOUSE"."ODS".business_d AS b
ON b.business_id  = r.business_id
JOIN "DATA_WAREHOUSE"."ODS".user_d AS u
ON r.user_id = u.user_id;