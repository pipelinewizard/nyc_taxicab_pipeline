--created reference_ct_boroughs table
CREATE TABLE reference_ct_boroughs (
    borough_id SERIAL PRIMARY KEY,
    borough TEXT,
    geom GEOMETRY
);

INSERT INTO reference_ct_boroughs (
    borough, geom
)
SELECT municipality, geom
FROM reference_ct_municipalities
WHERE reference_ct_municipalities.mun_type = 'Borough';