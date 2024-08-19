-- nyctaxicab_monthly_summary table
CREATE TABLE nyctaxicab_monthly_summary AS
SELECT 
    d.month,
    COUNT(*) AS ride_count,
    SUM(f."Trip_Distance") AS total_distance,
    AVG(f."Trip_Distance") AS avg_distance,
    SUM(f."Passenger_Count") AS total_passengers,
    AVG(f."Passenger_Count") AS avg_passengers,
    SUM(f."Tip_Amt") AS total_tip,
    AVG(f."Tip_Amt") AS avg_tip,
    SUM(f."Total_Amt") AS total,
    AVG(f."Total_Amt") AS avg_total,
    SUM(f."Fare_Amt") AS total_fare,
    AVG(f."Fare_Amt") AS avg_fare,
    SUM(f.duration) AS total_duration,
    AVG(f.duration) AS avg_duration,
    SUM(f.surcharge) AS total_surcharge,
    AVG(f.surcharge) AS avg_surcharge,
    SUM(f."Tolls_Amt") AS total_toll,
    AVG(f."Tolls_Amt") AS avg_toll
FROM 
    nyctaxicab_2009_01 f
JOIN 
    dim_date d ON f.date_id = d.date_id
GROUP BY 
    d.month;

    -- Add year and month_start_date Column
ALTER TABLE nyctaxicab_monthly_summary
ADD COLUMN year INT,
ADD COLUMN month_start_date DATE,
ADD COLUMN date_id INT;

-- Populate year column
UPDATE nyctaxicab_monthly_summary ms
SET year = (
    SELECT d.year
    FROM dim_date d
    WHERE d.month = ms.month
    LIMIT 1  -- Ensure only one value is returned
);

-- Populate month_start_date
UPDATE nyctaxicab_monthly_summary ms
SET month_start_date = (
        SELECT MIN(date)
        FROM dim_date d
        WHERE d.month = ms.month
          AND d.year = ms.year
    );

    --Populate date_id column
UPDATE nyctaxicab_monthly_summary ms
SET date_id = (
    SELECT d.date_id
    FROM dim_date d
    WHERE d.date = ms.month_start_date
)

--Drop Year column and week_start_date column
ALTER TABLE nyctaxicab_monthly_summary
DROP COLUMN "year",
DROP COLUMN month_start_date