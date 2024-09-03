LDEP Log
Date: [8_28_24]
Project: [NYC Taxicab Pipeline]

Goals for the Day:
- Organize sql queries in repository
- Delete US State Boundary Table
- Consolidate tables to create single state,l county, city etc tables (Appending)
- Add id columns for start and end locations in nyc_taxicab_2009_01
- Populate id columns

Blockers Encountered:
- reference_ct_state had a duplicate row
-
-

Summary of Progress Made:
- Organized SQL Queries
- added and populated dim_states, and dim_counties table
- added reference_ct_boroughs table

Next Steps:
- Need to document scope of reporting
- create reference_ct_city and reference_ct_town tables
- Breakout reference_nj_municipality table

General Notes:
- Used INSERT function, and UNION Function to add all state boundary data to one table dim_states
--Insert state values into to dim_states
INSERT INTO dim_counties(
    county, geom)
SELECT county, geom
FROM  reference_nj_counties
UNION
SELECT county, geom
from reference_ct_counties
UNION
SELECT name, geom
FROM reference_ny_counties;
-
-