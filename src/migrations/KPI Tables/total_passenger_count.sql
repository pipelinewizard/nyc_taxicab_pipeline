CREATE TABLE nyctaxicab_total_passenger_count AS
SELECT SUM("Passenger_Count") AS total_passenger_count
FROM nyctaxicab_2009_01;