CREATE TABLE nyctaxicab_total_surcharge AS
SELECT SUM("surcharge") AS total_surcharge
FROM nyctaxicab_2009_01;