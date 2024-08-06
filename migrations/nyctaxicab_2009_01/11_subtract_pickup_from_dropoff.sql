-- Subtract Pickup DateTime from Dropoff DateTime
UPDATE nyctaxicab_2009_01
SET duration = "Trip_Dropoff_DateTime" - "Trip_Pickup_DateTime";