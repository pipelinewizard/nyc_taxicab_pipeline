-- nyctaxicab_monthly_summary_bypayment_type
CREATE TABLE nyctaxicab_monthly_summary_bypayment_type AS
SELECT 
    d.month, payment_type_id,
    COUNT(*) AS ride_count,
    SUM("Trip_Distance") AS total_distance,
    AVG("Trip_Distance") AS avg_distance,
    SUM("Passenger_Count") AS total_passengers,
    AVG("Passenger_Count") AS avg_passengers,
    SUM("Tip_Amt") AS total_tip,
    AVG("Tip_Amt") AS avg_tip,
    SUM("Total_Amt") AS total,
    AVG("Total_Amt") AS avg_total,
    SUM("Fare_Amt") AS total_fare,
    AVG("Fare_Amt") AS avg_fare,
    SUM(duration) AS total_duration,
    AVG(duration) AS avg_duration,
    SUM(surcharge) AS total_surcharge,
    AVG(surcharge) AS avg_surcharge,
    SUM("Tolls_Amt") AS total_toll,
    AVG("Tolls_Amt") AS avg_toll
FROM nyctaxicab_2009_01 f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.month, payment_type_id;

-- Add year and month_start_date Column
ALTER TABLE nyctaxicab_monthly_summary_bypayment_type
ADD COLUMN year INT,
ADD COLUMN month_start_date DATE,
ADD COLUMN date_id INT;

-- Populate year column
UPDATE nyctaxicab_monthly_summary_bypayment_type mspt
SET year = (
    SELECT d.year
    FROM dim_date d
    WHERE d.month = mspt.month
    LIMIT 1  -- Ensure only one value is returned
);

-- Populate month_start_date
UPDATE nyctaxicab_monthly_summary_bypayment_type mspt
SET month_start_date = (
        SELECT MIN(date)
        FROM dim_date d
        WHERE d.month = mspt.month
          AND d.year = mspt.year
    );

--Populate date_id column
UPDATE nyctaxicab_monthly_summary_bypayment_type mspt
SET date_id = (
    SELECT d.date_id
    FROM dim_date d
    WHERE d.date = mspt.month_start_date
)

--Drop year column and week_start_date column
ALTER TABLE nyctaxicab_monthly_summary_bypayment_type
DROP COLUMN "year",
DROP COLUMN month_start_date;