--Add vendor_id column into the nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01 
ADD COLUMN vendor_id INT;

--Add payment_type_id column into the nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01 
ADD COLUMN payment_type_id INT;

--Add date_id column into the nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01 
ADD COLUMN date_id INT;

-- Add duration coumn
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