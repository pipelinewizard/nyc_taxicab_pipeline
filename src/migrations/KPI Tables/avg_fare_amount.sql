CREATE TABLE nyctaxicab_avg_fare_amount AS
SELECT AVG("Fare_Amt") AS avg_fare_amount
FROM nyctaxicab_2009_01;