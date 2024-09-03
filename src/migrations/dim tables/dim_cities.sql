-- Insert dim_cities table into postgresql_db
CREATE TABLE dim_cities (
city_id SERIAL PRIMARY KEY,
city TEXT,
geom GEOMETRY);

--Insert city values into to dim_cities
INSERT INTO dim_cities(
    city, geom)
SELECT city, geom
FROM  reference_nj_cities
UNION
SELECT city, geom
from reference_ct_cities
UNION
SELECT name, geom
FROM reference_ny_cities;