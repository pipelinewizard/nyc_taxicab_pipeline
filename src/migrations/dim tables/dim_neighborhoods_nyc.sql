--Create dim_neighborhoods_nyc table in postgres_db
CREATE TABLE dim_neighborhoods_nyc(
neighborhood_id SERIAL PRIMARY KEY,
neighborhood TEXT,
geom GEOMETRY);

--Insert neighborhood values into to dim_neighborhoods_nyc
INSERT INTO dim_neighborhoods_nyc(
    neighborhood, geom)
SELECT ntaname, geom
FROM  reference_nyc_neighborhoods;