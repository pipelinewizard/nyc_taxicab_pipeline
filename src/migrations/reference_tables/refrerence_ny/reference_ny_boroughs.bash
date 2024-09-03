-- add reference_ny_boroughs table to postgres
ogr2ogr -f "PostgreSQL" PG:"dbname=nyc_taxicab_db user=postgres password=postgrespassword" "Data/Borough Boundaries.geojson" -nln reference_ny_boroughs -lco GEOMETRY_NAME=geom -lco FID=gid -lco PRECISION=no
