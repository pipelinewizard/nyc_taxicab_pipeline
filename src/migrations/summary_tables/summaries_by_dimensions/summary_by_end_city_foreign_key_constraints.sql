-- Add Foreign Key Constraints to nyctaxicab_summary_by_end_city table
ALTER TABLE nyctaxicab_summary_by_end_city
ADD CONSTRAINT fk_end_city
FOREIGN KEY (end_city_id)
REFERENCES dim_cities(city_id);