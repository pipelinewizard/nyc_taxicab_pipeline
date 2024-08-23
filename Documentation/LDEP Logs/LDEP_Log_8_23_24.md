LDEP Log
Date: [8_23_24]
Project: [NYC Taxicab Pipeline]

Goals for the Day:
- Resolve Null Values in Borough_id and Neighborhood_id
- Create Summary Tables Grouped by Borough & Neighborhood
- 

Blockers Encountered:
- Data Discrepancies - Ride (us_state) shows New York, but borough and neighborhood shows null
- 

Summary of Progress Made:
- Added US State dim table with geom column
- Added us_start_state_id and us_end_state_id to the nyctaxicab_2009_01
- Validated discrepancies with SQL Statements
- The ride that shows NY state but shows borough and neighborhood null - these rides are either not pickedup or dropped off in New York City (but still New York State)
- There are rides that show not being picked in New York State (Conneticut and New Jersey) 

Next Steps:
- Add NY State (Cities) geojson table to postgres database
- Add city id information to nyctaxicab_2009_01 table
- Add New Jersey and Connecticut geojson Information

General Notes:
- Rename a column: ALTER TABLE nyctaxicab_2009_01
RENAME COLUMN start_neighborhood_id TO nyc_start_neighborhood_id;
- Rename a Table: ALTER TABLE nyc_neighborhoods
RENAME to dim_nyc_neighborhoods;
- 9841 rides picked up in the State of New York
SELECT COUNT(*)
FROM nyctaxicab_2009_01	
WHERE us_start_state_id = 7

- 27 rides not picked up in the state of New York
SELECT COUNT(*)
FROM nyctaxicab_2009_01	
WHERE us_start_state_id <> 7

- 9841 rides dropped off in the State of New York
SELECT COUNT(*)
FROM nyctaxicab_2009_01	
WHERE us_end_state_id = 7 

- 29 rides not dropped off in the state of New York
SELECT COUNT(*)
FROM nyctaxicab_2009_01	
WHERE us_end_state_id <> 7 

- 189 rides not picked up in NYC Borough start borough_id's that are null

- 191 rides not dropped off in NYC Borough end_borough_id's that are null

- 11 rides Not picked up OR Dropped Off in NYC Borough/Neighborhood
SELECT us_start_state_id, nyc_end_borough_id, nyc_start_borough_id
FROM nyctaxicab_2009_01
WHERE us_start_state_id = 7 
AND (nyc_end_borough_id, nyc_start_borough_id) 
IS NULL

SELECT us_start_state_id, nyc_end_neighborhood_id, nyc_start_neighborhood_id
FROM nyctaxicab_2009_01
WHERE us_start_state_id = 7 
AND (nyc_end_neighborhood_id, nyc_start_neighborhood_id) 
IS NULL

- 30 rides Not Picked up in NYC Neighborhood/Borough
SELECT us_start_state_id, nyc_start_neighborhood_id
FROM nyctaxicab_2009_01
WHERE us_start_state_id = 7 AND nyc_start_neighborhood_id IS NULL

- 42 rides Not Dropped Off in NYC Neighborhood/Borough
  SELECT us_start_state_id, nyc_end_neighborhood_id
FROM nyctaxicab_2009_01
WHERE us_start_state_id = 7 AND nyc_end_neighborhood_id IS NULL

Location Data Columns to Add:
- City
- State
- Zip
- County
- Neighborhood
- Address
