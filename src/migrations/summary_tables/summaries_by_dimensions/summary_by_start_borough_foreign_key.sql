-- Add Foreign Key Constraints to nyctaxicab_summary_by_start_borough table
ALTER TABLE nyctaxicab_summary_by_start_borough
ADD CONSTRAINT fk_start_borough
FOREIGN KEY (start_borough_id)
REFERENCES dim_boroughs(borough_id);