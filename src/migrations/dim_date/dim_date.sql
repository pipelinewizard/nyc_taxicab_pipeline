-- Create dim_date table
CREATE TABLE dim_date (
    date_id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    year INT NOT NULL,
    month INT NOT NULL,
    day INT NOT NULL,
    quarter INT NOT NULL,
    week INT NOT NULL,
    day_of_week INT NOT NULL,
    is_weekend BOOLEAN NOT NULL
);

-- Populate dim_date table for the year 2009
WITH date_series AS (
    SELECT 
        generate_series(
            '2009-01-01'::date, 
            '2009-12-31'::date, 
            '1 day'::interval
        )::date AS date
)
INSERT INTO dim_date (date, year, month, day, quarter, week, day_of_week, is_weekend)
SELECT 
    date,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    EXTRACT(DAY FROM date) AS day,
    EXTRACT(QUARTER FROM date) AS quarter,
    EXTRACT(WEEK FROM date) AS week,
    EXTRACT(DOW FROM date) AS day_of_week,
    CASE WHEN EXTRACT(DOW FROM date) IN (0, 6) THEN TRUE ELSE FALSE END AS is_weekend
FROM date_series;
