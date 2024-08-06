-- Add Foreign Key Constraints to nyctaxicab_daily_summary_bypayment_type table
ALTER TABLE nyctaxicab_daily_summary_bypayment_type
ADD CONSTRAINT fk_date
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);

ALTER TABLE nyctaxicab_daily_summary_bypayment_type
ADD CONSTRAINT fk_payment_type
FOREIGN KEY (payment_type_id)
REFERENCES dim_payment_type(payment_type_id);