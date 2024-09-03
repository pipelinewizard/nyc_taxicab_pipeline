--created reference_nj_village table
CREATE TABLE reference_nj_village (
    village_id SERIAL PRIMARY KEY,
    village TEXT,
    geom GEOMETRY
);

INSERT INTO reference_nj_village (
    village, geom
)
SELECT name, geom
FROM reference_nj_municipalities
WHERE reference_nj_municipalities.mun_type = 'Village';