LDEP Log
Date: [9_10_24]
Project: [NYC Taxicab Pipeline]

Goals for the Day:
- Update Location dim tables SQL Statements with a row for uncategorized information (For phase 2 cloud pipeline)
- Alter Table - Post-Hoc to add uncategorized row for dimension tables

Blockers Encountered:
- PG admin only shows 10k rows for Parquet table that has 14 million rows
- 
-

Summary of Progress Made:
- Removed rows where primary location columns contained nulls (e.g., state, county, city,etc)
- Removed columns where 99% rows were null (e.g., town, township, village, etc.)
-


Next Steps:
- Review KPI's
- Validate Data Model
-

General Notes:
- To handle missing data we could seperate the fact table into a table that has all the data and the rows they dont and then use a tabular model trainied on the first table to fill in the table that does not have all data.
- DDL vs. DML
- When working with null values you cannot set a value to '=' null - you have to say a value 'IS' null