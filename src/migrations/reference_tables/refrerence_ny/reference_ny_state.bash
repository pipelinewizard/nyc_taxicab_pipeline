-- add reference_ny_state table to postgres
ogr2ogr -f "PostgreSQL" PG:"dbname=nyc_taxicab_db user=postgres password=postgrespassword" "Data/NYS_Civil_Boundaries_6279329592986640096.geojson" -nln reference_ny_state -lco GEOMETRY_NAME=geom -lco FID=gid -lco PRECISION=no
