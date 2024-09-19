-- Add Foreign Key Constraints to nyctaxicab_summary_by_end_state table
ALTER TABLE nyctaxicab_summary_by_end_state
ADD CONSTRAINT fk_end_state
FOREIGN KEY (end_state_id)
REFERENCES dim_states(state_id);