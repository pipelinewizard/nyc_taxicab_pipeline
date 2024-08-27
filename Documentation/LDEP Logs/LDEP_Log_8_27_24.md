LDEP Log
Date: [Enter Date]
Project: [NYC Taxicab Pipeline]

Goals for the Day:
- Add State, County, and City Id's to tables for start and end locations
- Decide how to handle municipality tables ( has multiple levels city, town, village etc.)
- Add a Municipality Type Column??

Blockers Encountered:
- Not able to find any datasets with ct cities and towns split out etc.
-
-

Summary of Progress Made:
- Added Mun_Type column to dim_ct_municiapities table
- Create CT_Wikipedia_Mun_Type table
- Added mun_type data to dim_ct_municipalities table




Next Steps:
-
-
-

General Notes:
- (bash) cut -d',' -f1,2 CT_Mun_type.csv > copyfile.csv - cut additional columns from original table and made a new file
- (postgres extension) \copy ct_wp_mun_type (municipality, mun_type) FROM '/home/isaiah_unix/repos/nyc_taxicab/Data/copyfile.csv' DELIMITER ',' CSV HEADER; - copied the csv into a table in postgresql

-