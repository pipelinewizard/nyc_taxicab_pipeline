-- Create dim_payment_type table
CREATE TABLE dim_payment_type (
    payment_type_id SERIAL PRIMARY KEY,
    payment_type VARCHAR(255) NOT NULL
);

INSERT INTO dim_payment_type (payment_type)
SELECT DISTINCT Payment_Type
FROM nyctaxicab_2009_01;