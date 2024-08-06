--Populate payment_type__id field in nyctaxicab_2009_01
UPDATE nyctaxicab_2009_01
SET payment_type_id = dim_payment_type.payment_type_id
FROM dim_payment_type
WHERE dim_payment_type.payment_type = nyctaxicab_2009_01."Payment_Type"