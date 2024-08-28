-- add reference_ny_counties table to postgres
ogr2ogr -f "PostgreSQL" PG:"dbname=nyc_taxicab_db user=postgres password=postgrespassword" "Data/NYS_Civil_Boundaries_5848232821397896771.geojson" -nln reference_ny_counties -lco GEOMETRY_NAME=geom -lco FID=gid -lco PRECISION=no
