CREATE TABLE nyctaxicab_total_duration AS
SELECT SUM("duration") AS total_duration
FROM nyctaxicab_2009_01;