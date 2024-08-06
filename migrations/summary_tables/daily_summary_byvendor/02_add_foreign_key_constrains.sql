-- Add Foreign Key Constraints to nyctaxicab_daily_summary_byvendor table
ALTER TABLE nyctaxicab_daily_summary_byvendor
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_daily_summary_byvendor
ADD CONSTRAINT fk_vendor
FOREIGN KEY (vendor_id)
REFERENCES dim_vendor(vendor_id);