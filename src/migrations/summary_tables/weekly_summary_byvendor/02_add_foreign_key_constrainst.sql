-- Add  VendorForeign Key Constraints to nyctaxicab_weekly_summary_byvendor table
ALTER TABLE nyctaxicab_weekly_summary_byvendor
ADD CONSTRAINT fk_vendor
FOREIGN KEY (vendor_id)
REFERENCES dim_vendor(vendor_id);

-- Add Date Foreign Key Constraints to nyctaxicab_weekly_summary_byvendor table
ALTER TABLE nyctaxicab_weekly_summary_byvendor
ADD CONSTRAINT fk_date_id
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);