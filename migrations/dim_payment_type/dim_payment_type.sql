-- Create dim_vendor table
CREATE TABLE dim_payment_type (
    payment_type_id SERIAL PRIMARY KEY,
    vendor VARCHAR(255) NOT NULL
);