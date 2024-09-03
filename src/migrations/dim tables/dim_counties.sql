--Create dim_counties table in postgres_db
CREATE TABLE dim_counties(
county_id SERIAL PRIMARY KEY,
county TEXT,
geom GEOMETRY);

--Insert county values into to dim_counties
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