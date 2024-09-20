-- Add Foreign Key Constraints to nyctaxicab_summary_by_start_city table
ALTER TABLE nyctaxicab_summary_by_end_city
ADD CONSTRAINT fk_start_city
FOREIGN KEY (start_city_id)
REFERENCES dim_cities(city_id);