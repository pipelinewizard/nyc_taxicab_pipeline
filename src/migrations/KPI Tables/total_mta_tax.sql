CREATE TABLE nyctaxicab_total_mta_tax AS
SELECT SUM("mta_tax") AS total_mta_tax
FROM nyctaxicab_2009_01;