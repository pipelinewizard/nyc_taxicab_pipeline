-- Add Foreign Key Constraints to nyctaxicab_monthly_summary_by_end_state table
ALTER TABLE nyctaxicab_monthly_summary_by_end_state
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_monthly_summary_by_end_state
ADD CONSTRAINT fk_end_state
FOREIGN KEY (end_state_id)
REFERENCES dim_states(state_id);