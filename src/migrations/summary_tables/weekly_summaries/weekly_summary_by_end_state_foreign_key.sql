-- Add  End State Foreign Key Constraints to nyctaxicab_weekly_summary_by_end_state table
ALTER TABLE nyctaxicab_weekly_summary_by_end_state
ADD CONSTRAINT fk_end_state
FOREIGN KEY (end_state_id)
REFERENCES dim_states(state_id);

-- Add Date Foreign Key Constraints to nyctaxicab_weekly_summary_by_end_state table
ALTER TABLE nyctaxicab_weekly_summary_by_end_state
ADD CONSTRAINT fk_date_id
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);