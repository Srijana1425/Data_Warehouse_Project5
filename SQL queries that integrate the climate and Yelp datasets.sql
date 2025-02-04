SELECT temp.date_t AS date_temperature,
 temp.min_temp,
 temp.max_temp,
 temp.normal_max_temp,
 temp.normal_min_temp, 
 p.date_p AS precipitation_date,
 p.precipitation,
 p.precipitation_normal,
 r.review_id,
 r.date AS review_date,
 r.stars AS review_stars,
 r.text AS review_text,
 r.cool AS reveiw_cool,
 r.useful AS review_useful,
 r.funny AS review_funny,
 t.compliment_count,
 t.text AS tip_text,
 t.tip_date AS tip_date,
 b.business_id,
 b.address,
 b.name AS business_name,
 b.categories,
 b.city,
 b.postal_code,
 b.review_count AS business_review_count,
 b.attributes,
 b.is_open,
 b.state,
 b.hours,
 b.latitude,
 b.longitude,
 b.stars AS business_stars ,
 c.highlights,
 c.delivery_or_takeout,
 c.grubhub_enabled,
 c.call_to_action_enabled,
 c.request_a_quote_enabled,
 c.covid_banner,
 c.temporary_closed_until,
 c.virtual_services_offered,
 u.user_id,
 u.name AS user_name,
 u.review_count AS user_review_count,
 u.yelping_since,
 u.friends,
 u.useful AS user_useful,
 u.funny AS user_funny,
 u.cool AS user_cool,
 u.fans,
 u.elite,
 u.average_stars AS user_average_stars,
 u.compliment_hot,
 u.compliment_more,
 u.compliment_profile,
 u.compliment_cute,
 u.compliment_list,
 u.average_stars,
 u.compliment_plain,
 u.compliment_funny,
 u.compliment_cool,
 u.compliment_writer,
 u.compliment_photos
 
 FROM precipitation_d AS p
 JOIN review_d AS r
 ON r.date = p.date_p
 JOIN temperature_d AS temp
 ON temp.date_t = r.date
 JOIN business_d AS b
 ON b.business_id = r.business_id
 JOIN covid_d AS c
 ON b.business_id = c.business_id
 JOIN checkin_d AS ck
 ON b.business_id = ck.business_id
 JOIN tip_d AS t
 ON b.business_id = t.business_id
 JOIN user_d AS u
 ON u.user_id = r.user_id;


 --integrate datasets
 SELECT *
 FROM precipitation_d AS p
 JOIN review_d AS r
 ON r.date = p.date_p
 JOIN temperature_d AS temp
 ON temp.date_t = r.date
 JOIN business_d AS b
 ON b.business_id = r.business_id
 JOIN covid_d AS c
 ON b.business_id = c.business_id
 JOIN checkin_d AS ck
 ON b.business_id = ck.business_id
 JOIN tip_d AS t
 ON b.business_id = t.business_id
 JOIN user_d AS u
 ON u.user_id = r.user_id;
