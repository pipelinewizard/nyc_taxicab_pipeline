--Make Payment Type Values Unique
UPDATE nyctaxicab_2009_01
SET "Payment_Type" = UPPER("Payment_Type");