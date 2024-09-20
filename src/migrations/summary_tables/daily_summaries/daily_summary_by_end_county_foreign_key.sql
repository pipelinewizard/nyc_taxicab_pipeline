-- Add Foreign Key Constraints to nyctaxicab_daily_summary_by_end_county table
ALTER TABLE nyctaxicab_daily_summary_by_end_county
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_daily_summary_by_end_county
ADD CONSTRAINT fk_start_county
FOREIGN KEY (end_county_id)
REFERENCES dim_counties(county_id);