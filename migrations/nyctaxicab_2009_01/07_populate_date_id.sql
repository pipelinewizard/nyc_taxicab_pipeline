--Populate date_id field in nyctaxicab_2009_01
UPDATE nyctaxicab_2009_01
SET date_id = dim_date.date_id
FROM dim_date
WHERE DATE(nyctaxicab_2009_01."Trip_Pickup_DateTime") = dim_date.date;