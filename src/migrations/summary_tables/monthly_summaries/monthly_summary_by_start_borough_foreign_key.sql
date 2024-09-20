-- Add Foreign Key Constraints to nyctaxicab_monthly_summary_by_start_borough table
ALTER TABLE nyctaxicab_monthly_summary_by_start_borough
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_monthly_summary_by_start_borough
ADD CONSTRAINT fk_start_borough
FOREIGN KEY (start_borough_id)
REFERENCES dim_boroughs(borough_id);