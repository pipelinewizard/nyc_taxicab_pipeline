CREATE TABLE nyctaxicab_total_tip_amount AS
SELECT SUM("Tip_Amt") AS total_tip_amount
FROM nyctaxicab_2009_01;