-- add mun_type column
ALTER TABLE dim_ct_municipalities
ADD COLUMN mun_type TEXT;

UPDATE dim_ct_municipalities ctm
SET mun_type = ctwp.mun_type
FROM ct_wp_mun_type ctwp
WHERE ctm.municipality = ctwp.municipality;