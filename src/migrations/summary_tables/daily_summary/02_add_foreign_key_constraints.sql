-- Add Foreign Key Constraints to nyctaxicab_daily_summary table
ALTER TABLE nyctaxicab_daily_summary
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);