-- add mun_type column
ALTER TABLE reference_ct_municipalities
ADD COLUMN mun_type TEXT;

--update mun_type column in ct_municipalities
UPDATE reference_ct_municipalities ctm
SET mun_type = ctwp.mun_type
FROM reference_ct_wp_mun_type ctwp
WHERE ctm.municipality = ctwp.municipality;