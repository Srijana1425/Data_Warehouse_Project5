--Business_d Table 
CREATE TABLE business_D (
    business_id VARCHAR PRIMARY KEY,
    name VARCHAR ,
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
INSERT INTO business_D   
SELECT 
 usersjson:business_id,
    usersjson:name,
    usersjson:address,
    usersjson:city,
    usersjson:state,
    usersjson:postal_code,
    usersjson:latitude,
    usersjson:longitude,
    usersjson:stars,
    usersjson:review_count,
    usersjson:is_open,
    usersjson:attributes,
    usersjson:categories,
    usersjson:hours
FROM "DATA_WAREHOUSE"."STAGING".BUSINESS;

--user_d Table
CREATE TABLE user_D (
    user_id VARCHAR  PRIMARY KEY,
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
INSERT INTO user_D
SELECT
    usersjson:user_id,
    usersjson:name,
    usersjson:review_count,
    usersjson:yelping_since,
    usersjson:friends,
    usersjson:useful,
    usersjson:funny,
    usersjson:cool,
    usersjson:fans,
    usersjson:elite,
    usersjson:average_stars,
    usersjson:compliment_hot,
    usersjson:compliment_more,
    usersjson:compliment_profile,
    usersjson:compliment_cute,
    usersjson:compliment_list,
    usersjson:compliment_note,
    usersjson:compliment_plain,
    usersjson:compliment_funny,
    usersjson:compliment_cool,
    usersjson:compliment_writer,
    usersjson:compliment_photos
FROM "DATA_WAREHOUSE"."STAGING".user;

--checkin_d Table
CREATE TABLE checkin_D (
    checkin_date VARCHAR,
    business_id VARCHAR,
    FOREIGN KEY (business_id) REFERENCES business_D(business_id)
);
INSERT INTO checkin_D
SELECT 
    usersjson:date,
    usersjson:business_id
FROM "DATA_WAREHOUSE"."STAGING".checkin;

--review-d
CREATE TABLE review_D (
    review_id VARCHAR PRIMARY KEY,
    user_id VARCHAR,
    business_id VARCHAR,
    stars INT,
    date VARCHAR,
    text VARCHAR,
    useful INT,
    funny INT,
    cool INT
);
INSERT INTO review_D 
SELECT
    usersjson:review_id,
    usersjson:user_id,
    usersjson:business_id,
    usersjson:stars,
    usersjson:date,
    usersjson:text,
    usersjson:useful,
    usersjson:funny,
    usersjson:cool   
FROM "DATA_WAREHOUSE"."STAGING".review;

--covid_d Table
CREATE TABLE covid_D (
    business_id VARCHAR,
    highlights VARCHAR,
    delivery_or_takeout VARIANT,
    grubhub_enabled VARIANT,
    call_to_action_enabled VARIANT,
    request_a_quote_enabled VARIANT,
    covid_banner VARIANT,
    temporary_closed_until VARIANT,
    virtual_services_offered VARIANT,
    FOREIGN KEY (business_id) REFERENCES business_D(business_id)
);
INSERT INTO covid_D
SELECT 
    usersjson:"business_id",
    usersjson:"highlights",
    usersjson:"delivery_or_takeout",
    usersjson:"grubhub_enabled",
    usersjson:"call_to_action_enabled",
    usersjson:"Request_a_quote_enabled",
    usersjson:"covid_banner",
    usersjson:"temporary_closed_until",
    usersjson:"virtual_services_offered"   
FROM "DATA_WAREHOUSE"."STAGING".covid;

--tip_d Table
CREATE TABLE tip_D (
    text VARCHAR,
    tip_date VARCHAR,
    compliment_count INT,
    business_id VARCHAR,
    user_id VARCHAR,
    FOREIGN KEY (business_id) REFERENCES business_D(business_id),
    FOREIGN KEY (user_id) REFERENCES user_D(user_id)
);
INSERT INTO tip_D
SELECT 
    usersjson:text,
    usersjson:tip_date,
    usersjson:compliment_count,
    usersjson:business_id,
    usersjson:user_id
FROM "DATA_WAREHOUSE"."STAGING".tip;

--precipitation_D Table
CREATE TABLE precipitation_D(
    date_p DATE PRIMARY KEY,
    precipitation VARCHAR,
    precipitation_normal FLOAT
 );
INSERT INTO precipitation_D
SELECT
    date("DATE",'YYYYMMDD'),
    precipitation,
    precipitation_normal
FROM "DATA_WAREHOUSE"."STAGING".precipitation;

--temperature_D
CREATE TABLE temperature_D(
 date_t DATE PRIMARY KEY,
 min_temp FLOAT,
 max_temp FLOAT,
 normal_min_temp FLOAT,
 normal_max_temp FLOAT
);
INSERT INTO temperature_D
SELECT 
    date("DATE", 'YYYYMMDD'),
    min,
    max,
    normal_min,
    normal_max
FROM "DATA_WAREHOUSE"."STAGING".temperature;

