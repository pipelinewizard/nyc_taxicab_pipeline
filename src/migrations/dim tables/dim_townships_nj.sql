--Create dim_townsships_nj table in postgres_db
CREATE TABLE dim_townships_nj(
township_id SERIAL PRIMARY KEY,
township TEXT,
geom GEOMETRY);

--Insert township values into to dim_township_nj
INSERT INTO dim_townships_nj(
    township, geom)
SELECT township, geom
FROM  reference_nj_townships;