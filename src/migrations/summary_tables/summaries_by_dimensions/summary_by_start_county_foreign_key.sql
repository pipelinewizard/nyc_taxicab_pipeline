-- Add Foreign Key Constraints to nyctaxicab_summary_by_end_county table
ALTER TABLE nyctaxicab_summary_by_start_county
ADD CONSTRAINT fk_start_county
FOREIGN KEY (start_county_id)
REFERENCES dim_counties(county_id);