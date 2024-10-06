# Title: **Data Engineering with NYC Taxicab Data: A Project Review**

## Introduction
*Why NYC Taxicab Data?: Briefly explain why you chose this dataset and its relevance for your data engineering learning journey.*
The goal of this project was soley to get my feet wet in working with data tools that I would use as a data engineer. I am brand spanking new to the field and don't know my ass from my hat, but I figured if I just dove in head first something good would come, from it, and I was right. I was pointed to the NYCtaxicab dataset by a good friend on my stream, (I dont know if he considers me a good friend we met on my stream LOL but he has been extremely helpful in my learning journey since the beginning). Before I started this project I was studying flashcards preparing for a Power BI certification test, and reading and taking notes on the python glossary, and not actually doing anything, so this was the push I need to go out and actually try and build something.

*Brief Project Overview: Provide context about the project – what it entailed, the primary goal, and the tools you used (e.g., Python, pandas, PostgreSQL, etc.).*
I was able to get the data ingested from a handful of sources into a postgresql database where I was able to transform and model the data to get it prepared for analysis. This transformed data has been conntected to a Power BI report but further work needs to be done for data analysuis and machine learning.

## The Data Pipeline Process

### Data Ingestion

*Sources and Tools: Discuss how you ingested the NYC taxicab data, including the file formats (e.g., CSV, Parquet), tools (Python, pandas), and storage solutions (e.g., PostgreSQL, cloud options).*
There were a few sources for this pipeline, the first source was the NYC Taxi and Limousine Commision website - if you are interested you can find it here - https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page#:~:text=TLC%20Trip%20Record%20Data.%20Yellow%20and%20green%20taxi. I only downloaded the 2009 dataset from this site. It was a parquet file which I found out later down the line had 44 million rows in it. I will touch more on this later. I also collected geojson boundary data from the following websites NYS GIS Clearinghous - https://data.gis.ny.gov/ , NJgin Open Data - https://njogis-newjersey.opendata.arcgis.com/ and CT Geodata portal - https://geodata.ct.gov/ 

*Challenges Faced: Any initial struggles with data ingestion or file handling? Mention specific tools or techniques that were difficult to master.*
The learning curve made itself extremnely evident from the beginning. I had never worked with postgresql and had literally no idea where to start. Luckliy some members of my stream help get me set up. Using the terminal was something completely;brand new to me. After installing WSL on my machine because it is... how do i say this superior to all other operating systems LOL ( i dont really believe that I'm just trying toi start drama) I was able to get the Postgresql database set up on my machine, I was able to create a database for the NYC taxicab dataset, and using a python script that I completely ripped from chatgpt I was able to load the data into this newly created database. Loading the geojson data was actually a bit more difficult than this because of the file format. I had to use the bash terminal to load this data  into my database here is the bash code for that - - sudo apt-get install gdal-bin - bash command to install GDAL

*Lessons Learned*
The biggest thing I learned from working on the ingestion process is that in order to get all the data you need in one place, you will have to use different tools due to the dynami9c nature of each source. I was able to load parquet files fairly easily into the Postgres db using python, but for the geojson files I had to use the bash terminal to get these files loaded.

- From bash - ogr2ogr -f "PostgreSQL" PG:"dbname=nyc_taxicab_db user=postgres password=postgrespassword" "Data/Borough Boundaries.geojson" -nln nyc_boroughs -lco GEOMETRY_NAME=geom -lco FID=gid -lco PRECISION=no

*Lessons Learned*

### Data Transformation

*Transformations Applied: Detail the process of transforming the data (cleaning, restructuring, creating dimension tables, etc.).*
So I was really excited about the transformation process because I had some experience performing `transformations in Power BI. Working on transforming data in Power BI is actually what got me interested in Data Engineering. Myt initial intention was to create a local  pipeline using only the 2009 taxicab dataset, and then later down the line pulling in all the data , up until 2024 - and use cloud based data engineering tools. This will not be happening anytime soon, because I am moving on to another proiject that I am bit more interested in. With this being said I only performed transformations on the 2009 data, I updated some of data types, filled in missing data with default values.

*Transformations Applied: Detail the process of transforming the data (cleaning, restructuring, creating dimension tables, etc.).*

*Key Challenges: Discuss challenges such as handling NULL values, issues with data consistency, or any other roadblocks during this phase.*

*Lessons Learned: What did you learn about efficient transformation techniques or specific tools (e.g., pandas, SQL)?*

### Data Modeling
*Creating Dimension and Fact Tables: Walk through the modeling phase where you created tables such as dim_date, dim_payment_type, and nyctaxicab_2009_01.*
 I knew that I wanted to create a dimensional model, essentially splitting the data into Dimension tables and Fact tables. Dimensions tables would hold ther categporical data used to filter and aggregate, some examples of this were payment type, vendor, and the large dimension of location, which hence the geojson files. The fact table which held actual observational data, like truip duration, passengfer count, fair amoutn. There was a row in ther fact table for each ride in the year of 2009. I begin by seperating out my Dimension data: Payment Type, Vendor, Location. I created seperate tables for these dimensions, made the rows unique and added foreign key into the fact table that represnted the dimension instead of the actual categorical string. This was all done to the large fact table... the one that had 44 million rows

 *Challenges: Discuss any difficulties in building relationships between tables, indexing, or ensuring data integrity.*
 After this I begin wrestling with the idea of creating metrics. Things like weekly average fare amount. In Power BI you are able to create what they call measures, which perform calculations on the entire dataset and then stores the results in the data engines cache until you need them, so even though it is a calculation performed on the entire dataset, it is stored in cache which is a good thing. However, I wasnt very keen on trying to pull in all 44 million rows into a BI tool, I didnt know much, but I understod that this was not considered best practice. So I started to aggregate tables in the Postgreslq db - ( I am aware that this was probably not the best option as this was now pulling more resources from my databse engine - another option to this was to use materiualized views, but I still need to do more research on how this actually works) - either way I created aggregate tables for the measures I wanted, becasue my thought was, instead of loading the entire fact table into the BI tool, I would just load aggregation tables into the BI tool, this would give me all the measures I wanted and not put as much strain on the BI tool. SO thats what I did, I created yearly, monthly, weekly, and daily aggregate tables split by the following dimensions , vendor, payment type, and location.

 *Lessons Learned: Highlight what you learned about good data modeling practices, particularly in handling large datasets.*
 Something that I did take away from this phase of the project was that it is a hard balance between optimizing one tool vs. another. I am worried about optimizing my BI tool that I may have given my database an uncessary load. There are techniques for optimiZation, like I know that the fact that nyc taxicab dataset is formatted as a parquet file gives us compression optimization rightr off the bat. These are things that I need to dive into a bit more.

## Overcoming Challenges

### Technical Roadblocks

*Detail any major technical challenges, such as working with large datasets, optimizing performance, or issues with specific tools.*
It seemed like there were technical roadblocks at every turn. You gotta understand this was my first ill fated attempot at building out a pipeline, I am like below an ameature using Python SQL and bash so this was a technical roadblock like everyday, but it is one that I really enjoy. I feel like I was able to learn alot, especiallly in writing SQL. 

*How did you overcome these issues? Were there any creative solutions or workarounds you used?*

### Learning Curve

*Discuss any steep learning curves with new tools (e.g., Docker, WSL, PostgreSQL).*

*Share how you improved your skills through problem-solving or external resources.*

## Key Takeaways

### Data Engineering Concepts

*Summarize the most important concepts or techniques you mastered during the project (e.g., ETL/ELT processes, database design, indexing).*

### Soft Skills

*What did you learn about project management, problem-solving, or debugging? How did you handle setbacks?*

## Future Directions

*Next Steps in the Project: What’s the next phase for this project? Will you integrate machine learning, new datasets, or improve your data pipeline?*

*New Skills to Learn: Mention any tools or concepts you plan to dive into next (e.g., cloud computing, orchestration tools like Airflow, or scaling pipelines).*

## Conclusion
*Wrap up by reflecting on how this project has advanced your data engineering skills and how it aligns with your broader goals.*

*Encourage readers to engage by asking questions or sharing their own experiences with similar projects.*