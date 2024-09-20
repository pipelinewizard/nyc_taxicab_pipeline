-- Add  End Borough Foreign Key Constraints to nyctaxicab_weekly_summary_by_start_borough table
ALTER TABLE nyctaxicab_weekly_summary_by_end_borough
ADD CONSTRAINT fk_end_borough
FOREIGN KEY (end_borough_id)
REFERENCES dim_boroughs(borough_id);

-- Add Date Foreign Key Constraints to nyctaxicab_weekly_summary_by_end_borough table
ALTER TABLE nyctaxicab_weekly_summary_by_end_borough
ADD CONSTRAINT fk_date_id
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);