CREATE TABLE nyctaxicab_avg_tip_amount AS
SELECT AVG("Tip_Amt") AS avg_tip_amount
FROM nyctaxicab_2009_01;