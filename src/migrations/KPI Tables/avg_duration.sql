CREATE TABLE nyctaxicab_avg_duration AS
SELECT AVG("duration") AS avg_duration
FROM nyctaxicab_2009_01;