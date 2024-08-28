--Create dim_state table in postgres_db
CREATE TABLE dim_counties(
county_id SERIAL PRIMARY KEY,
county TEXT,
geom GEOMETRY);

--Insert state values into to dim_states
INSERT INTO dim_counties(
    county, geom)
SELECT county, geom
FROM  reference_nj_counties
UNION
SELECT county, geom
from reference_ct_counties
UNION
SELECT name, geom
FROM reference_ny_counties;