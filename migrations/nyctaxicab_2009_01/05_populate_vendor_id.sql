--Populate vendor_id field in nyctaxicab_2009_01
UPDATE nyctaxicab_2009_01
SET vendor_id = dim_vendor.vendor_id
FROM dim_vendor
WHERE dim_vendor.vendor = nyctaxicab_2009_01.vendor_name