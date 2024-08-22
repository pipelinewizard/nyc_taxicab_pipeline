LDEP Log
Date: [8_22_24]
Project: [NYC Taxicab Pipeline]

Goals for the Day:
- Update Wizard Log to LDEP Log
- Add BRB and Start Soon Screen to OBS
- Add Borough and Neighborhood id's to the nyctaxicab_2009_01 table
- Add Foreign Key Constraints to nyctaxicab_2009_01 table

Blockers Encountered:
- Unsure are on how to join nyctaxicab_2009_012 table to to nyc_borough table using the geometry fields

- After adding the borough id to the nyctaxicab_2009_01 fact table I noticed that there were some null values in the start_borough_id and end_borough_id  which means that some rides wer either picked up outside of new york or dropped off outside of new york, or at least outside the defined boundaries of NYC Boroughs. Would it make sense to remove the fares that have pick ups and drop offs outside of New York? We could mark all the null values as Outside Borough Boundaries and potentially find geometry data for them down the line. (Leave them as NULL for now)
-

Summary of Progress Made:
I started this stream by taking care of some housekeeping tasks. I renamed the "Wizard Logs" to "LDEP Logs" (Learning Data Engineering in Public). I might change it back because "Wizard Logs" does sound cool, but it might also be a bit confusing. After that, I jumped back into PG Admin to continue working with the location data.

I was able to add the borough and neighborhood IDs for each ride in the nyctaxicab_2009_01 fact table. Now, each ride's start and end locations have a borough and neighborhood ID that connects back to the nyc_neighborhoods and nyc_boroughs dimension tables. However, I encountered an issue where some of the start and end location geometry points were not found within any borough or neighborhood boundaries. This means the trip either picked up or dropped off passengers outside the NYC borough boundaries. I'm still contemplating how to handle this discrepancy.

To address the issue of associating trips with boroughs, I used the following SQL code:
-- Associate each trip with a borough
ALTER TABLE nyctaxicab_2009_01 ADD COLUMN start_borough_id INTEGER;
ALTER TABLE nyctaxicab_2009_01 ADD COLUMN end_borough_id INTEGER;

UPDATE nyctaxicab_2009_01 AS t
SET start_borough_id = b.gid
FROM nyc_boroughs AS b
WHERE ST_Contains(b.geom, t.start_location);

UPDATE nyctaxicab_2009_01 AS t
SET end_borough_id = b.gid
FROM nyc_boroughs AS b
WHERE ST_Contains(b.geom, t.end_location::geometry);

This code first adds two new columns, start_borough_id and end_borough_id, to the nyctaxicab_2009_01 table. It then updates these columns by checking whether the start and end locations of each trip fall within the boundaries of a borough using the ST_Contains function. If the location is within a borough, the corresponding borough ID (gid) is assigned.

To test my understanding of the PostGIS extension that was added to my PostgreSQL database, I'll try to explain it here. The PostGIS extension is used for working with location data. It adds two system tables and additional functions. One function I used is ST_Contains, which takes two parameters (geom A and geom B) and returns true if the second geometry point is found within the first. For example:
WHERE ST_Contains(b.geom, t.end_location::geometry);

This checks whether the end_location from the fact table is within any of the boroughs, returning true if it is, and subsequently providing the borough ID.

Something I learned is that you can change the datatype of an object using the :: operator. For instance:
WHERE ST_Contains(b.geom, t.end_location::geometry);

The end_location field was originally of the geography datatype, which was causing an error. I found that I could change the datatype within the UPDATE statement by using this method.

Next Steps:
- Decide what to do about start and end locations outside of NYC Borough or Neighborhood boundary
- Create Summary tablebles grouped by Borough and Neighborhood
-

General Notes:
- ST_contains: A function that was added by the postgis extension - that takes two geomnetry points and see the if the first point contains the 2nd point - WHERE ST_Contains(b.geom, t.end_location::geometry);
- In order to change the data type of an object within a statement you can add :: e.g., WHERE ST_Contains(b.geom, t.end_location::geometry);