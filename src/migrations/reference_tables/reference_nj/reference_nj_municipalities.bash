-- add reference_nj_municipalities table to postgres
ogr2ogr -f "PostgreSQL" PG:"dbname=nyc_taxicab_db user=postgres password=postgrespassword" "Data/Municipal_Boundaries_of_NJ.geojson" -nln reference_nj_municipalities -lco GEOMETRY_NAME=geom -lco FID=gid -lco PRECISION=no
