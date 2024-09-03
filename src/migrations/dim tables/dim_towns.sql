--Create dim_towns table in postgres_db
CREATE TABLE dim_towns(
town_id SERIAL PRIMARY KEY,
town TEXT,
geom GEOMETRY);

--Insert town values into to dim_towns
INSERT INTO dim_towns(
    town, geom)
SELECT town, geom
FROM  reference_nj_towns
UNION
SELECT town, geom
from reference_ct_towns
UNION
SELECT name, geom
FROM reference_ny_towns;