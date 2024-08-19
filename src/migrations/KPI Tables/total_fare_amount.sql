CREATE TABLE nyctaxicab_total_fare_amount AS
SELECT SUM("Fare_Amt") AS total_fare_amount
FROM nyctaxicab_2009_01;