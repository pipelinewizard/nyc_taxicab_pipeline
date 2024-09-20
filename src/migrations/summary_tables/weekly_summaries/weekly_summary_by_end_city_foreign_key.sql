-- Add  End City Foreign Key Constraints to nyctaxicab_weekly_summary_by_end_city table
ALTER TABLE nyctaxicab_weekly_summary_by_end_city
ADD CONSTRAINT fk_end_city
FOREIGN KEY (end_city_id)
REFERENCES dim_cities(city_id);

-- Add Date Foreign Key Constraints to nyctaxicab_weekly_summary_by_end_city table
ALTER TABLE nyctaxicab_weekly_summary_by_end_city
ADD CONSTRAINT fk_date_id
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);