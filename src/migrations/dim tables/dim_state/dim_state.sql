--Create dim_state table in postgres_db
CREATE TABLE dim_state(
state_id SERIAL PRIMARY KEY,
state TEXT,
geom GEOMETRY);

--Insert state values into to dim_states
INSERT INTO dim_state(
    state, geom)
SELECT name, geom
FROM  reference_ny_state
UNION
SELECT name, geom
from reference_nj_state
UNION
SELECT state, geom
FROM reference_ct_state;


