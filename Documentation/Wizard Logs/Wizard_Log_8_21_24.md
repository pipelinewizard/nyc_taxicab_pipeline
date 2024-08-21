Wizard Log
Date: [8_21_24]
Project: [NYC Taxicab Pipeline]

Goals for the Day:
- Confirm Location Data Usage - can I show travel path in Power BI - should Location be a dimension?
- Continue Designing Report (i.e., visual placeholders, Report Interactivity,Theme, Color Scheme)
- Ingest NYC Bourough and Neghborhood Boundary in PostgreSQL

Blockers Encountered:
- Peer Authentication Error when trying to connect PostGreSQL using the "ogr2ogr" command
-

Summary of Progress Made:
I stand here humbled because I am now back in the transformation stage, which I thought I had left in the past.

After starting to design the layout of the NYCTaxiCab report, I discovered that I was overlooking a very valuable data point: the location data (i.e., start latitude and longitude and end latitude and longitude).

This led me to consolidate the four location columns in the fact table into two columns: start_location and end_location (previously start_lat, start_lon, end_lat, and end_lon). Next, I ingested borough and neighborhood data using the NYC Open Data website. This was done with the hope of being able to filter the fact data by location, specifically by borough and neighborhood. Latitude and longitude are not very useful in reports unless they are associated with some kind of nomenclature. Below is the code that allowed me to populate the start_location and end_location tables and add them to the database, ans also the bash code to the add the geo.json files to the postgresql database.

-- Add and populate consolidate geometry location columns (SQL)
ALTER TABLE nyctaxicab_2009_01
ADD COLUMN start_location geography(Point, 4326),
ADD COLUMN end_location geography(Point, 4326);

UPDATE nyctaxicab_2009_01
SET start_location = ST_SetSRID(ST_MakePoint(start_lon, start_lat), 4326),
    end_location = ST_SetSRID(ST_MakePoint(end_lon, end_lat), 4326);

-- Add geo.json files to the PostgreSQL database (Bash)


Next Steps:
- Need to add a BRB screen to my stream for 7:45 break
- Add Foreign Key Contraints from the Borough and Neighborhood table to the Main fact table
- Create Summary Tables based on Location - Borough and Neighborhood

General Notes:
- sudo apt-get install gdal-bin - bash command to install GDAL
- From bash - ogr2ogr -f "PostgreSQL" PG:"dbname=nyc_taxicab_db user=postgres password=postgrespassword" "Data/Borough Boundaries.geojson" -nln nyc_boroughs -lco GEOMETRY_NAME=geom -lco FID=gid -lco PRECISION=no