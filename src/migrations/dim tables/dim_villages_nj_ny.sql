--Create dim_villages table in postgres_db
CREATE TABLE dim_villages(
village_id SERIAL PRIMARY KEY,
village TEXT,
geom GEOMETRY);

--Insert village values into to dim_vilages
INSERT INTO dim_villages(
    village, geom)
SELECT village, geom
FROM  reference_nj_villages
UNION
SELECT name, geom
from reference_ny_villages;