CREATE TABLE nyctaxicab_avg_trip_distance AS
SELECT AVG("Trip_Distance") AS avg_trip_distance
FROM nyctaxicab_2009_01;