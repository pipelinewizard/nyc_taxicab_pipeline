--created reference_ct_city table
CREATE TABLE reference_ct_town (
    town_id SERIAL PRIMARY KEY,
    town TEXT,
    geom GEOMETRY
);

INSERT INTO reference_ct_town (
    town, geom
)
SELECT municipality, geom
FROM reference_ct_municipalities
WHERE reference_ct_municipalities.mun_type = 'Town';