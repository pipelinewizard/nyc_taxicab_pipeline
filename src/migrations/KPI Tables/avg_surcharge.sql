CREATE TABLE nyctaxicab_avg_surcharge AS
SELECT AVG("surcharge") AS avg_surcharge
FROM nyctaxicab_2009_01;