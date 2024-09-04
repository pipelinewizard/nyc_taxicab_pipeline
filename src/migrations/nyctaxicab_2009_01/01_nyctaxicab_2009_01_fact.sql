--Add vendor_id column into the nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01 
ADD COLUMN vendor_id INT;

--Add payment_type_id column into the nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01 
ADD COLUMN payment_type_id INT;

--Add date_id column into the nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01 
ADD COLUMN date_id INT;

-- Add duration column
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN duration INTERVAL;

--Populate vendor_id field in nyctaxicab_2009_01
UPDATE nyctaxicab_2009_01
SET vendor_id = dim_vendor.vendor_id
FROM dim_vendor
WHERE dim_vendor.vendor = nyctaxicab_2009_01.vendor_name

--Populate payment_type__id field in nyctaxicab_2009_01
UPDATE nyctaxicab_2009_01
SET payment_type_id = dim_payment_type.payment_type_id
FROM dim_payment_type
WHERE dim_payment_type.payment_type = nyctaxicab_2009_01."Payment_Type"

--Populate date_id field in nyctaxicab_2009_01
UPDATE nyctaxicab_2009_01
SET date_id = dim_date.date_id
FROM dim_date
WHERE DATE(nyctaxicab_2009_01."Trip_Pickup_DateTime") = dim_date.date;

--Drop vendor_name column from table
ALTER TABLE nyctaxicab_2009_01
DROP COLUMN vendor_name

--Make Payment Type Values Unique
UPDATE nyctaxicab_2009_01
SET "Payment_Type" = UPPER("Payment_Type");

-- Subtract Pickup DateTime from Dropoff DateTime
UPDATE nyctaxicab_2009_01
SET duration = "Trip_Dropoff_DateTime" - "Trip_Pickup_DateTime";

-- Created geometry type column that combines longitiatue and latitude into a single spatial point adding start_location and end_location column to nyctaxicab_2009_01
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN start_location geography(Point, 4326),
ADD COLUMN end_location geography(Point, 4326);

-- Populate columns with combined longitude and latitude data
UPDATE nyctaxicab_2009_01
SET start_location = ST_SetSRID(ST_MakePoint("Start_Lon", "Start_Lat"), 4326),
    end_location = ST_SetSRID(ST_MakePoint("End_Lon", "End_Lat"), 4326);

-- Add ride_count column
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN ride_count INT;

-- Populate ride_count column
UPDATE TABLE nyctaxicab_2009_01
SET ride_count =1;

-- Associate each trip with a state
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN start_state_id INTEGER,
ADD COLUMN end_state_id INTEGER;

UPDATE nyctaxicab_2009_01 AS t
SET start_state_id = ds.state_id
FROM dim_states AS ds
WHERE ST_Contains(ds.geom, t.start_location::geometry);

UPDATE nyctaxicab_2009_01 AS t
SET end_state_id = ds.state_id
FROM dim_states AS ds
WHERE ST_Contains(ds.geom, t.end_location::geometry);


-- Associate each trip with a neighborhood
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN nyc_start_neighborhood_id INTEGER,
ADD COLUMN nyc_end_neighborhood_id INTEGER;

UPDATE nyctaxicab_2009_01 AS t
SET nyc_start_neighborhood_id = nh.gid
FROM dim_neighborhoods_nyc AS nh
WHERE ST_Contains(nh.geom, t.start_location::geometry);

UPDATE nyctaxicab_2009_01 AS t
SET nyc_end_neighborhood_id = nh.gid
FROM dim_neighborhoods_nyc AS nh
WHERE ST_Contains(nh.geom, t.end_location::geometry);

-- Associate each trip with a county
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN start_county_id INTEGER,
ADD COLUMN end_county_id INTEGER;

UPDATE nyctaxicab_2009_01 AS t
SET start_county_id = dc.county_id
FROM dim_counties AS dc
WHERE ST_Contains(dc.geom, t.start_location::geometry);

UPDATE nyctaxicab_2009_01 AS t
SET end_county_id = dc.county_id
FROM dim_counties AS dc
WHERE ST_Contains(dc.geom, t.end_location::geometry);

-- Associate each trip with a city
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN start_city_id INTEGER,
ADD COLUMN end_city_id INTEGER;

UPDATE nyctaxicab_2009_01 AS t
SET start_city_id = dct.city_id
FROM dim_cities AS dct
WHERE ST_Contains(dct.geom, t.start_location::geometry);

UPDATE nyctaxicab_2009_01 AS t
SET end_city_id = dct.city_id
FROM dim_cities AS dct
WHERE ST_Contains(dct.geom, t.end_location::geometry);

-- Associate each trip with a borough
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN start_borough_id INTEGER,
ADD COLUMN end_borough_id INTEGER;

UPDATE nyctaxicab_2009_01 AS t
SET start_borough_id = db.borough_id
FROM dim_boroughs AS db
WHERE ST_Contains(db.geom, t.start_location::geometry);

UPDATE nyctaxicab_2009_01 AS t
SET end_borough_id = db.borough_id
FROM dim_boroughs AS db
WHERE ST_Contains(db.geom, t.end_location::geometry);

-- Associate each trip with a town
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN start_town_id INTEGER,
ADD COLUMN end_town_id INTEGER;

UPDATE nyctaxicab_2009_01 AS t
SET start_town_id = dt.town_id
FROM dim_towns AS dt
WHERE ST_Contains(dt.geom, t.start_location::geometry);

UPDATE nyctaxicab_2009_01 AS t
SET end_town_id = dt.town_id
FROM dim_towns AS dt
WHERE ST_Contains(dt.geom, t.end_location::geometry);

-- Associate each trip with a township
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN start_township_id INTEGER,
ADD COLUMN end_township_id INTEGER;

UPDATE nyctaxicab_2009_01 AS t
SET start_township_id = dts.township_id
FROM dim_townships_nj AS dts
WHERE ST_Contains(dts.geom, t.start_location::geometry);

UPDATE nyctaxicab_2009_01 AS t
SET end_township_id = dts.township_id
FROM dim_townships_nj AS dts
WHERE ST_Contains(dts.geom, t.end_location::geometry);

-- Associate each trip with a township
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN start_township_id INTEGER,
ADD COLUMN end_township_id INTEGER;

UPDATE nyctaxicab_2009_01 AS t
SET start_township_id = dts.township_id
FROM dim_townships_nj AS dts
WHERE ST_Contains(dts.geom, t.start_location::geometry);

UPDATE nyctaxicab_2009_01 AS t
SET end_township_id = dts.township_id
FROM dim_townships_nj AS dts
WHERE ST_Contains(dts.geom, t.end_location::geometry);

-- Associate each trip with a village
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN start_village_id INTEGER,
ADD COLUMN end_village_id INTEGER;

UPDATE nyctaxicab_2009_01 AS t
SET start_village_id = dv.village_id
FROM dim_villages_nj_ny AS dv
WHERE ST_Contains(dv.geom, t.start_location::geometry);

UPDATE nyctaxicab_2009_01 AS t
SET end_village_id = dv.village_id
FROM dim_villages_nj_ny AS dv
WHERE ST_Contains(dv.geom, t.end_location::geometry);
