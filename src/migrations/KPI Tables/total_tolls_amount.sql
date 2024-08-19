CREATE TABLE nyctaxicab_total_tolls_amount AS
SELECT SUM("Tolls_Amt") AS total_tolls_amount
FROM nyctaxicab_2009_01;