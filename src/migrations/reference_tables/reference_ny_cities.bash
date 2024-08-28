-- add reference_ny_cities table to postgres
ogr2ogr -f "PostgreSQL" PG:"dbname=nyc_taxicab_db user=postgres password=postgrespassword" "Data/NYS_Civil_Boundaries_-1319769592516746101.geojson" -nln reference_ny_cities -lco GEOMETRY_NAME=geom -lco FID=gid -lco PRECISION=no
