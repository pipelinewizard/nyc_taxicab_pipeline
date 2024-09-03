--created reference_ct_city table
CREATE TABLE reference_ct_city (
    city_id SERIAL PRIMARY KEY,
    city TEXT,
    geom GEOMETRY
);

INSERT INTO reference_ct_city (
    city, geom
)
SELECT municipality, geom
FROM reference_ct_municipalities
WHERE reference_ct_municipalities.mun_type = 'City';