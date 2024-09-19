-- Add Foreign Key Constraints to nyctaxicab_summary_by_end_borough table
ALTER TABLE nyctaxicab_summary_by_end_borough
ADD CONSTRAINT fk_end_borough
FOREIGN KEY (end_borough_id)
REFERENCES dim_boroughs(borough_id);