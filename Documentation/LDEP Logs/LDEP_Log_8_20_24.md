LDEP Log
Date: [8_20_24]
Project: [NYC Taxicab Pipeline]

Goals for the Day:
- Validate Data Model
- Move .pbix file into repository
- Choose Color Scheme of Power BI Report
- Add Place Holder Visuals for Power BI Report
- Organize Report Pages

Blockers Encountered:
- The Power BI File would not connect initially, because the PostgreSQL server was not started. Once the server was started, we were able toc connect to the database.
- I have a start Latitude and Longitude and an end Latitude and Longitude for nyc taxicab trips - I am not exactly sure what the best way would be to display this data in Power BI
-

Summary of Progress Made:

I officially moved the .pbix file into the repository, and it will be pushed with this latest commit. Today, I worked exclusively inside the .pbix file, validating the data model one last time—because, why not?

After this, I began outlining the report structure. As I explained in my stream, I’m usually in situations where I have to produce results as quickly as possible, which means progress often looks like simply getting data on the page. However, since this is a personal project, I can take a different approach. I can essentially design the report first by outlining the pages, deciding on the visuals for each page, selecting the color scheme, and planning any additional interactive features that need to be added.

I started this process today and was able to lock in the color scheme and finalize the report outline. I also added the PostGIS extension to my PostgreSQL database, which will allow me to work with latitude and longitude data.


Next Steps:
- How should we display location data in Power BI? - Should location be a dim table?
- Add visual placeholders
- Add report interactivity functionality

General Notes:
- How do you automate the starting the PostgreSQL database - in a real-world scenario people will use reports at different times and this would be a blocker if the database had to manually started.
- Does it make sense to use Direct Query in Power BI on a static dataset held in PostgreSQL?
- Also is it okay to bring in the fact table if you are using Direct Query in Power BI?
- bash script to instal postgis extension - sudo apt-get update
sudo apt-get install postgresql-14-postgis-3 postgresql-14-postgis-3-scripts
