--created reference_nj_township table
CREATE TABLE reference_nj_township (
    township_id SERIAL PRIMARY KEY,
    township TEXT,
    geom GEOMETRY
);

INSERT INTO reference_nj_township (
    township, geom
)
SELECT name, geom
FROM reference_nj_municipalities
WHERE reference_nj_municipalities.mun_type = 'Township';