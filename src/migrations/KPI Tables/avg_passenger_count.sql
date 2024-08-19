CREATE TABLE nyctaxicab_avg_passenger_count AS
SELECT AVG("Passenger_Count") AS avg_passenger_count
FROM nyctaxicab_2009_01;