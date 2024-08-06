import os
import pandas as pd
from sqlalchemy import create_engine
import psycopg2

#Define Path to Parquet File
parquet_file = r'Data/yellow_tripdata_2009-01.parquet'

# Check if the file exists
if not os.path.exists(parquet_file):
    raise FileNotFoundError(f"The file {parquet_file} does not exist.")

#Read Parquet File
try:
    df = pd.read_parquet(parquet_file)
    print("Parquet file read successfully.")
except Exception as e:
    print(f"Error reading Parquet file: {e}")
    raise

#Create connection to the PostgreSQL database
try:
    engine = create_engine('postgresql+psycopg2://postgres:postgrespassword@localhost/nyc_taxicab_db')
    print("PostgreSQL Database Connected Successfully.")
except Exception as e:
    print(f"Error connecting to PostgreSQL: {e}")
    raise

#Load the DataFrame into the PostGreSQL table
try:
    df.head(10000).to_sql('nyctaxicab_2009_01', engine, if_exists='append', index=False)
    print("Data loaded into PostgreSQL table successfully.")
except Exception as e:
    print(f"Error loading data into PostgreSQL: {e}")
    raise

# Print the first few rows of the DataFrame
print(df.head())