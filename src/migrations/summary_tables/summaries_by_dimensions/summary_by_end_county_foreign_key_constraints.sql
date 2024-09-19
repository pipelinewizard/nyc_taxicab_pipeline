-- Add Foreign Key Constraints to nyctaxicab_summary_by_end_county table
ALTER TABLE nyctaxicab_summary_by_end_county
ADD CONSTRAINT fk_end_county
FOREIGN KEY (end_county_id)
REFERENCES dim_counties(county_id);