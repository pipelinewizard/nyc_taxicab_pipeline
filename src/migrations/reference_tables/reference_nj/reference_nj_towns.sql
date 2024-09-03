--created reference_nj_township table
CREATE TABLE reference_nj_town (
    town_id SERIAL PRIMARY KEY,
    town TEXT,
    geom GEOMETRY
);

INSERT INTO reference_nj_town (
    town, geom
)
SELECT name, geom
FROM reference_nj_municipalities
WHERE reference_nj_municipalities.mun_type = 'Town';