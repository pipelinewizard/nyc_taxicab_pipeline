CREATE TABLE dim_date (
    date_id SERIAL PRIMARY KEY,       -- Unique identifier for the date
    full_date DATE NOT NULL,          -- The full date
    year INT NOT NULL,                -- The year part of the date
    month INT NOT NULL,               -- The month part of the date (1-12)
    day INT NOT NULL,                 -- The day part of the date (1-31)
    day_of_week INT NOT NULL,         -- The day of the week (0=Sunday, 1=Monday, etc.)
    month_name VARCHAR(20) NOT NULL,  -- The name of the month
    day_name VARCHAR(20) NOT NULL,    -- The name of the day
    quarter INT NOT NULL,             -- The quarter of the year (1-4)
    is_weekend BOOLEAN NOT NULL       -- Whether the date is a weekend
);
