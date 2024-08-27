-- Created table for Municipality type for Connecticut from Wikipedia
CREATE TABLE ct_wp_mun_type (
municipality_id SERIAL PRIMARY KEY,
municipality TEXT,
mun_type TEXT)

-- copied cvs data into Postgresql
\copy ct_wp_mun_type (municipality, mun_type) FROM '/home/isaiah_unix/repos/nyc_taxicab/Data/copyfile.csv' DELIMITER ',' CSV HEADER;
