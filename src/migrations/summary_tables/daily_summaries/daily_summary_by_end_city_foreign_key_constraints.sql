-- Add Foreign Key Constraints to nyctaxicab_daily_summary_by_end_city table
ALTER TABLE nyctaxicab_daily_summary_by_end_city
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_daily_summary_by_end_city
ADD CONSTRAINT fk_end_city
FOREIGN KEY (end_city_id)
REFERENCES dim_cities(city_id);