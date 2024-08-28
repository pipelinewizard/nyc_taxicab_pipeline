-- add reference_ny_towns table to postgres
ogr2ogr -f "PostgreSQL" PG:"dbname=nyc_taxicab_db user=postgres password=postgrespassword" "Data/NYS_Civil_Boundaries_-8223716203712523222.geojson" -nln reference_ny_towns -lco GEOMETRY_NAME=geom -lco FID=gid -lco PRECISION=no