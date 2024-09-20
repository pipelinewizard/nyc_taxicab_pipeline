-- Add Foreign Key Constraints to nyctaxicab_monthly_summary_by_start_city table
ALTER TABLE nyctaxicab_monthly_summary_by_start_city
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_monthly_summary_by_start_city
ADD CONSTRAINT fk_start_city
FOREIGN KEY (start_city_id)
REFERENCES dim_cities(city_id);