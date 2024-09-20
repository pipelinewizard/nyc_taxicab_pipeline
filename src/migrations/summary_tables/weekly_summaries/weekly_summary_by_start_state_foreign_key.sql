-- Add  Start State Foreign Key Constraints to nyctaxicab_weekly_summary_by_start_state table
ALTER TABLE nyctaxicab_weekly_summary_by_start_state
ADD CONSTRAINT fk_start_state
FOREIGN KEY (start_state_id)
REFERENCES dim_cities(city_id);

-- Add Date Foreign Key Constraints to nyctaxicab_weekly_summary_by_start_state table
ALTER TABLE nyctaxicab_weekly_summary_by_start_state
ADD CONSTRAINT fk_date_id
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);