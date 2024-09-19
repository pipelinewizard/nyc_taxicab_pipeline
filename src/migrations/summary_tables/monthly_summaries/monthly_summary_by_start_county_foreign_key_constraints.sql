-- Add Foreign Key Constraints to nyctaxicab_monthly_summary_by_start_county table
ALTER TABLE nyctaxicab_monthly_summary_by_start_county
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_monthly_summary_by_start_county
ADD CONSTRAINT fk_start_county
FOREIGN KEY (start_county_id)
REFERENCES dim_counties(county_id);