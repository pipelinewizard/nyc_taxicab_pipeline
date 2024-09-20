-- Add Foreign Key Constraints to nyctaxicab_summary_byvendor table
ALTER TABLE nyctaxicab_summary_byvendor
ADD CONSTRAINT fk_vendor
FOREIGN KEY (vendor_id)
REFERENCES dim_vendor(vendor_id);