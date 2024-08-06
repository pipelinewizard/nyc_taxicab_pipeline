-- Create dim_vendor table
CREATE TABLE dim_vendor (
    vendor_id SERIAL PRIMARY KEY,
    vendor VARCHAR(255) NOT NULL
);