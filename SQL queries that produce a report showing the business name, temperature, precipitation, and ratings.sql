SELECT
    b.name AS business_name,
    w.min_temp,
    w.max_temp,
    w.precipitation,
    b.stars 
FROM
    TOTAL_INFO AS fact_table
JOIN
    business_DWH AS b ON fact_table.business_id = b.business_id
JOIN
    weather_DWH AS w ON fact_table.weather_date = w.weather_date
ORDER BY
    b.name ASC;