-- Create dim_vendor table
CREATE TABLE dim_vendor (
    vendor_id SERIAL PRIMARY KEY,
    vendor VARCHAR(255) NOT NULL
);

INSERT INTO dim_vendor (vendor)
SELECT DISTINCT Vendor
FROM nyctaxicab_2009_01;