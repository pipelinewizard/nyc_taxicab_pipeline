-- Add  Paymenmt Type Foreign Key Constraints to nyctaxicab_weekly_summary_bypayment_type table
ALTER TABLE nyctaxicab_monthly_summary_bypayment_type
ADD CONSTRAINT fk_payment_type
FOREIGN KEY (payment_type_id)
REFERENCES dim_payment_type(payment_type_id);

-- Add Date Foreign Key Constraints to nyctaxicab_weekly_summary_bypayment_type table
ALTER TABLE nyctaxicab_monthly_summary_bypayment_type
ADD CONSTRAINT fk_date_id
FOREIGN KEY (date_id)
REFERENCES dim_date(date_id);