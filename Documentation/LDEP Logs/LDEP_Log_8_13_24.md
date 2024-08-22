LDEP Log
Date: [8_13_24]
Project: [NYC Taxicab Pipeline]
_________________________________________________
Goal for the Day:
- Re-create Dim Table SQL statements to store for future use
- Add ride_count column in summary tables that calculate ride_count for each day and each week and each dimension if applicable. (e.g., vendor)
- Create KPI Tables
_________________________________________________
Blockers Encountered:
- No Blockers enountered today 
-
-
_________________________________________________
Summary of Progress Made:
- Added the ride_count column to all summary tables weekly, daily, dimension
- Created KPI tables for Sum & Avg for all facts in the fact table
-
_________________________________________________
Next Steps:
- Re-Create DIM table SQL statements to push to Github
- Create Monthly summary tables
-
_________________________________________________
General Notes:
- Contemplating how I should handle measures (KPI's) for example I have a table nyctaxicab_daily_summary - that has the following attributes by day:
- total_distance
- avg_distance
- total passengers
- avg_passegngers
- I am wondering should I make one off tables for things like avg_distance - not broken down by day but just for the entire dataset - OR should I do this in the BI tool?
- When should I create stored procedures vs aggregtion tables?
- Are stored procdues more optimal for KPI's e.g., avg_trip_distance
-------------------------------- ChatGPT ---------------------------------------------
Stored Procedures are optimal when you need dynamic, real-time, or complex KPI calculations that may vary based on different inputs or conditions. They offer flexibility and encapsulate complex logic but may be less performant if used excessively for simple aggregates.

Aggregation Tables are more optimal for scenarios where performance is critical, and the KPI can be precomputed and stored. They are the best choice for static or infrequently changing KPIs, especially in a reporting or dashboard context.

For a KPI like avg_trip_distance, if it's frequently queried and the calculation is straightforward, an aggregation table would likely offer better performance. However, if the calculation is complex or depends on varying parameters, a stored procedure might be more appropriate.