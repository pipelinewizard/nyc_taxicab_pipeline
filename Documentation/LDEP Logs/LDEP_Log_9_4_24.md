LDEP Log
Date: [9_4_24]
Project: [NYC Taxicab Pipeline]

Goals for the Day:
- Associate each trip with a State, County, City, Borough, and Town
- Associate trips that apply to a neighborhood, township and village
-

Blockers Encountered:
- 129 NULL start_state_id
- 126 NULL end_state_id
- 134 NULL start_county_id
- 130 NULL end_county_id
- 155 NULL start_city_id
- 154 NULL end_city_id
- 184 NULL start_borough_id
- 186 NULL end_borough_id
- 189 NULL start_neighborhood_id
- 191 NULL end_neighborhood_id
- 9989 NULL start_town_id
- 9985 NULL end_town_id
- 9995 NULL start_township_id
- 9996 NULL end_township_id
- 9999 NULL start_village_id
- 9994 NULL end_village_id
- Some geomtric points are invalid (In the ocean)
- Can not categorize invalid geometry points. Need to create uncategorized dimension for each dim table



Summary of Progress Made:
- Associated rides with location id's (There are some null rows in nyctaxicab_2009_01 for different location attributes)
- Checked column quality - listed those in blockers
-


Next Steps:
- Update Location dim tables SQL Statements with a row for uncategorized information (For phase 2 cloud pipeline)
- Alter Table - Post-Hoc to add uncategorized row for dimension tables
-

General Notes:
- Potential Solution to handle uncategorized location information
-- Insert borough values into dim_boroughs
INSERT INTO dim_boroughs (borough, geom)
SELECT boro_name, geom
FROM reference_ny_boroughs
UNION
SELECT borough, geom
FROM reference_ct_boroughs
UNION
SELECT borough, geom
FROM reference_nj_boroughs
UNION ALL
SELECT 'Uncategorized', 'Default';

-
-