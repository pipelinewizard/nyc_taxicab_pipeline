CREATE TABLE nyctaxicab_total_amount AS
SELECT SUM("Total_Amt") AS total_amount
FROM nyctaxicab_2009_01;