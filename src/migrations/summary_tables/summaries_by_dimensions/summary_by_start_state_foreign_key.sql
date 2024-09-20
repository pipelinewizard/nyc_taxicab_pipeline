-- Add Foreign Key Constraints to nyctaxicab_summary_by_start_state table
ALTER TABLE nyctaxicab_summary_by_start_state
ADD CONSTRAINT fk_start_state
FOREIGN KEY (state_state_id)
REFERENCES dim_states(state_id);