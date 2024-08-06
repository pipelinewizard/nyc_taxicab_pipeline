--Add vendor_id column into the nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01 
ADD COLUMN vendor_id INT;

--Populate vendor_id field in nyctaxicab_2009_01
UPDATE nyctaxicab_2009_01
SET vendor_id = dim_vendor.vendor_id
FROM dim_vendor
WHERE dim_vendor.vendor = nyctaxicab_2009_01.vendor_name

--Drop vendor_name column from table
ALTER TABLE nyctaxicab_2009_01
DROP COLUMN vendor_name

--Add payment_type_id column into the nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01 
ADD COLUMN payment_type_id INT;

--Make Payment Type Values Unique
UPDATE nyctaxicab_2009_01
SET "Payment_Type" = UPPER("Payment_Type");

--Populate payment_type__id field in nyctaxicab_2009_01
UPDATE nyctaxicab_2009_01
SET payment_type_id = dim_payment_type.payment_type_id
FROM dim_payment_type
WHERE dim_payment_type.payment_type = nyctaxicab_2009_01."Payment_Type"

--Drop Payment_Type column from table
ALTER TABLE nyctaxicab_2009_01
DROP COLUMN "Payment_Type";


--Change Data Type of Trip_Pickup_DateTime column to TimeStamp
ALTER TABLE nyctaxicab_2009_01
ALTER COLUMN "Trip_Pickup_DateTime" TYPE TimeStamp USING "Trip_Pickup_DateTime":: TimeStamp,
ALTER COLUMN "Trip_Dropoff_DateTime" TYPE TimeStamp USING "Trip_Dropoff_DateTime":: TimeStamp

-- Add duration coumn
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN duration INTERVAL;

-- Subtract Pickup DateTime from Dropoff DateTime
UPDATE nyctaxicab_2009_01
SET duration = "Trip_Dropoff_DateTime" - "Trip_Pickup_DateTime";


--Add date_id column into the nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01 
ADD COLUMN date_id INT;

--Populate date_id field in nyctaxicab_2009_01
UPDATE nyctaxicab_2009_01
SET date_id = dim_date.date_id
FROM dim_date
WHERE DATE(nyctaxicab_2009_01."Trip_Pickup_DateTime") = dim_date.date;

-- Add Foreign Key Constraints to nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_2009_01
ADD CONSTRAINT fk_payment_type
FOREIGN KEY (payment_type_id)
REFERENCES dim_payment_type(payment_type_id);

ALTER TABLE nyctaxicab_2009_01
ADD CONSTRAINT fk_vendor
FOREIGN KEY (vendor_id)
REFERENCES dim_vendor(vendor_id);

-- Add Foreign Key Constraints to nyctaxicab_daily_summary table
ALTER TABLE nyctaxicab_daily_summary
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

--SUMMARY TABLES

-- nyctaxicab_daily_summary
CREATE TABLE nyctaxicab_daily_summary AS
SELECT 
    date_id,
    COUNT(*) AS ride_count,
    SUM("Trip_Distance") AS total_distance,
    AVG("Trip_Distance") AS avg_distance,
    SUM("Passenger_Count") AS total_passengers,
    AVG("Passenger_Count") AS avg_passengers,
    SUM("Tip_Amt") AS total_tip,
    AVG("Tip_Amt") AS avg_tip,
    SUM("Total_Amt") AS total,
    AVG("Total_Amt") AS avg_total,
    SUM("Fare_Amt") AS total_fare,
    AVG("Fare_Amt") AS avg_fare,
    SUM(duration) AS total_duration,
    AVG(duration) AS avg_duration,
    SUM(surcharge) AS total_surcharge,
    AVG(surcharge) AS avg_surcharge,
    SUM("Tolls_Amt") AS total_toll,
    AVG("Tolls_Amt") AS avg_toll
FROM nyctaxicab_2009_01
GROUP BY date_id;


-- nyctaxicab_daily_summary_byvendor
CREATE TABLE nyctaxicab_daily_summary_byvendor AS
SELECT 
    date_id, vendor_id,
    SUM("Trip_Distance") AS total_distance,
    AVG("Trip_Distance") AS avg_distance,
    SUM("Passenger_Count") AS total_passengers,
    AVG("Passenger_Count") AS avg_passengers,
    SUM("Tip_Amt") AS total_tip,
    AVG("Tip_Amt") AS avg_tip,
    SUM("Total_Amt") AS total,
    AVG("Total_Amt") AS avg_total,
    SUM("Fare_Amt") AS total_fare,
    AVG("Fare_Amt") AS avg_fare,
    SUM(duration) AS total_duration,
    AVG(duration) AS avg_duration,
    SUM(surcharge) AS total_surcharge,
    AVG(surcharge) AS avg_surcharge,
    SUM("Tolls_Amt") AS total_toll,
    AVG("Tolls_Amt") AS avg_toll
FROM nyctaxicab_2009_01
GROUP BY date_id, vendor_id;

-- Add Foreign Key Constraints to nyctaxicab_daily_summary_byvendor table
ALTER TABLE nyctaxicab_daily_summary_byvendor
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_daily_summary_byvendor
ADD CONSTRAINT fk_vendor
FOREIGN KEY (vendor_id)
REFERENCES dim_vendor(vendor_id);

-- nyctaxicab_daily_summary_bypayment_type
CREATE TABLE nyctaxicab_daily_summary_bypayment_type AS
SELECT 
    date_id, payment_type_id,
    SUM("Trip_Distance") AS total_distance,
    AVG("Trip_Distance") AS avg_distance,
    SUM("Passenger_Count") AS total_passengers,
    AVG("Passenger_Count") AS avg_passengers,
    SUM("Tip_Amt") AS total_tip,
    AVG("Tip_Amt") AS avg_tip,
    SUM("Total_Amt") AS total,
    AVG("Total_Amt") AS avg_total,
    SUM("Fare_Amt") AS total_fare,
    AVG("Fare_Amt") AS avg_fare,
    SUM(duration) AS total_duration,
    AVG(duration) AS avg_duration,
    SUM(surcharge) AS total_surcharge,
    AVG(surcharge) AS avg_surcharge,
    SUM("Tolls_Amt") AS total_toll,
    AVG("Tolls_Amt") AS avg_toll
FROM nyctaxicab_2009_01
GROUP BY date_id, payment_type_id;

-- Add Foreign Key Constraints to nyctaxicab_daily_summary_byvendor table
ALTER TABLE nyctaxicab_daily_summary_bypayment_type
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_daily_summary_bypayment_type
ADD CONSTRAINT fk_payment_type
FOREIGN KEY (payment_type_id)
REFERENCES dim_payment_type(payment_type_id);

-- nyctaxicab_summary_byvendor
CREATE TABLE nyctaxicab_summary_byvendor AS
SELECT 
    vendor_id,
    SUM("Trip_Distance") AS total_distance,
    AVG("Trip_Distance") AS avg_distance,
    SUM("Passenger_Count") AS total_passengers,
    AVG("Passenger_Count") AS avg_passengers,
    SUM("Tip_Amt") AS total_tip,
    AVG("Tip_Amt") AS avg_tip,
    SUM("Total_Amt") AS total,
    AVG("Total_Amt") AS avg_total,
    SUM("Fare_Amt") AS total_fare,
    AVG("Fare_Amt") AS avg_fare,
    SUM(duration) AS total_duration,
    AVG(duration) AS avg_duration,
    SUM(surcharge) AS total_surcharge,
    AVG(surcharge) AS avg_surcharge,
    SUM("Tolls_Amt") AS total_toll,
    AVG("Tolls_Amt") AS avg_toll
FROM nyctaxicab_2009_01
GROUP BY vendor_id;

ALTER TABLE nyctaxicab_summary_byvendor
ADD CONSTRAINT fk_vendor
FOREIGN KEY (vendor_id)
REFERENCES dim_vendor(vendor_id);

-- nyctaxicab_summary_bypayment_type
CREATE TABLE nyctaxicab_summary_bypayment_type AS
SELECT 
    payment_type_id,
    SUM("Trip_Distance") AS total_distance,
    AVG("Trip_Distance") AS avg_distance,
    SUM("Passenger_Count") AS total_passengers,
    AVG("Passenger_Count") AS avg_passengers,
    SUM("Tip_Amt") AS total_tip,
    AVG("Tip_Amt") AS avg_tip,
    SUM("Total_Amt") AS total,
    AVG("Total_Amt") AS avg_total,
    SUM("Fare_Amt") AS total_fare,
    AVG("Fare_Amt") AS avg_fare,
    SUM(duration) AS total_duration,
    AVG(duration) AS avg_duration,
    SUM(surcharge) AS total_surcharge,
    AVG(surcharge) AS avg_surcharge,
    SUM("Tolls_Amt") AS total_toll,
    AVG("Tolls_Amt") AS avg_toll
FROM nyctaxicab_2009_01
GROUP BY payment_type_id;

ALTER TABLE nyctaxicab_summary_bypayment_type
ADD CONSTRAINT fk_payment_type
FOREIGN KEY (payment_type_id)
REFERENCES dim_payment_type(payment_type_id);
    

