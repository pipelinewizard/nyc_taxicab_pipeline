-- add reference_nj_state table to postgres
ogr2ogr -f "PostgreSQL" PG:"dbname=nyc_taxicab_db user=postgres password=postgrespassword" "Data/State_Boundary_of_NJ.geojson" -nln reference_nj_state -lco GEOMETRY_NAME=geom -lco FID=gid -lco PRECISION=no
