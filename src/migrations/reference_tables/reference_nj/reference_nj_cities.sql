--created reference_nj_township table
CREATE TABLE reference_nj_city (
    city_id SERIAL PRIMARY KEY,
    city TEXT,
    geom GEOMETRY
);

INSERT INTO reference_nj_city (
    city, geom
)
SELECT name, geom
FROM reference_nj_municipalities
WHERE reference_nj_municipalities.mun_type = 'City';