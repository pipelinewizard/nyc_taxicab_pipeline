-- Add  End County Foreign Key Constraints to nyctaxicab_weekly_summary_by_end_county table
ALTER TABLE nyctaxicab_weekly_summary_by_end_county
ADD CONSTRAINT fk_end_county
FOREIGN KEY (end_county_id)
REFERENCES dim_counties(county_id);

-- Add Date Foreign Key Constraints to nyctaxicab_weekly_summary_by_county table
ALTER TABLE nyctaxicab_weekly_summary_by_end_county
ADD CONSTRAINT fk_date_id
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);