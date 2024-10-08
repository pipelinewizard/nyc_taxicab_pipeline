-- Add Foreign Key Constraints to nyctaxicab_2009_01 table
ALTER TABLE nyctaxicab_2009_01
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_2009_01
ADD CONSTRAINT fk_payment_type
FOREIGN KEY (payment_type_id)
REFERENCES dim_payment_type(payment_type_id);

ALTER TABLE nyctaxicab_2009_01
ADD CONSTRAINT fk_vendor
FOREIGN KEY (vendor_id)
REFERENCES dim_vendor(vendor_id);

ALTER TABLE nyctaxicab_2009_01
ADD CONSTRAINT fk_start_borough
FOREIGN KEY (start_borough_id)
REFERENCES nyc_boroughs(gid);

ALTER TABLE nyctaxicab_2009_01
ADD CONSTRAINT fk_end_borough
FOREIGN KEY (end_borough_id)
REFERENCES nyc_boroughs(gid);

ALTER TABLE nyctaxicab_2009_01
ADD CONSTRAINT fk_start_neighborhood
FOREIGN KEY (start_neighborhood_id)
REFERENCES nyc_neighborhoods(gid);

ALTER TABLE nyctaxicab_2009_01
ADD CONSTRAINT fk_end_neighborhood
FOREIGN KEY (end_neighborhood_id)
REFERENCES nyc_neighborhoods(gid);