-- nyctaxicab_weekly_summary table
CREATE TABLE nyctaxicab_weekly_summary AS
SELECT 
    d.week,
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
    d.week;