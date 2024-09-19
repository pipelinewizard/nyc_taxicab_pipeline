-- Add Foreign Key Constraints to nyctaxicab_weekly_summary_bypayment_type table
ALTER TABLE nyctaxicab_weekly_summary
ADD CONSTRAINT fk_date_id
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);