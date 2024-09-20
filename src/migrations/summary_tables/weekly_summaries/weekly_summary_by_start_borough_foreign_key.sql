-- Add  Start Borough Foreign Key Constraints to nyctaxicab_weekly_summary_by_start_borough table
ALTER TABLE nyctaxicab_weekly_summary_by_start_borough
ADD CONSTRAINT fk_start_borough
FOREIGN KEY (start_borough_id)
REFERENCES dim_boroughs(borough_id);

-- Add Date Foreign Key Constraints to nyctaxicab_weekly_summary_by_start_borough table
ALTER TABLE nyctaxicab_weekly_summary_by_start_borough
ADD CONSTRAINT fk_date_id
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);