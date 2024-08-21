Wizard Log

Date: [8-8-24]
Project: [NYC Taxicab Pipeline]
________________________________________
Goal for the Day:
•	Create Weekly aggregation tables for each dimension
•	Create SQL files for Dimension tables
•	Validate SQL File Organization

Blockers Encountered:
•	On the dim_date table the date_id and date columns were populated for the year 2009 but the other columns were not populated e.g., week, is_weekend, year etc.)
•	Realized that aggregation tables don’t have a date_id which would mean it would not be possible to filter from the dim_date table (i.e., Provide weekly summaries for the Month of January for “Total Distance” driven.

Summary of Progress Made:
Populated the dim_date columns for the year 2009, deleted rows with dates beyond '2009-12-31', and created the nyctaxicab_weekly_summary table with columns for year, week start date, and week end date.

Next Steps:
•	Need to join the dim_date table to the nyctaxicab_weekly_summary table using the “week_start_date column…. I think
•	Follow the same process for the other aggregation tables nyctaxicab_weekly_summary_byvendor, and nyctaxicab_weekly_summary_bypayment_type
________________________________________
General Notes:
•	CASE WHEN = IF in SQL
UPDATE dim_date
SET is_weekend = CASE 
                    WHEN EXTRACT(ISODOW FROM date) IN (6, 7) THEN TRUE 
                    ELSE FALSE 
                 END
WHERE is_weekend IS NULL;
Lessons Learned:
•	[Reflect on what you learned today]