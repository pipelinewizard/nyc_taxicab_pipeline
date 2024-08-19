CREATE TABLE nyctaxicab_total_trip_distance AS
SELECT SUM("Trip_Distance") AS total_trip_distance
FROM nyctaxicab_2009_01;