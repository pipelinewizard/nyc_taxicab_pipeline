-- Insert dim_boroughs table into postgresql_db
CREATE TABLE dim_boroughs (
borough_id SERIAL PRIMARY KEY,
borough TEXT,
geom GEOMETRY);

--Insert borough values into to dim_boroughs
INSERT INTO dim_boroughs(
    borough, geom)
SELECT boro_name, geom
FROM  reference_ny_boroughs
UNION
SELECT borough, geom
from reference_ct_boroughs
UNION
SELECT borough, geom
FROM reference_nj_boroughs;dd