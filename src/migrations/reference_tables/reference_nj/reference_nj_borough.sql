--created reference_nj_township table
CREATE TABLE reference_nj_borough (
    reference_nj_borough_id SERIAL PRIMARY KEY,
    borough TEXT,
    geom GEOMETRY
);

INSERT INTO reference_nj_borough (
    borough, geom
)
SELECT name, geom
FROM reference_nj_municipalities
WHERE reference_nj_municipalities.mun_type = 'Borough';