Wizard Log
Date: [8_20_24]
Project: [NYC Taxicab Pipeline]

Goal for the Day:
- Validate Data Model
- Move .pbix file into repository
- Choose Color Scheme of Power BI Report
- Add Place Holder Visuals for Power BI Report
- Organize Report Pages

Blockers Encountered:
- The Power BI FIle would not connect initally, because the PostgreSQL server was not started. Once the server was started we were able toc onect to the databse.
-
-

Summary of Progress Made:

I offically moved the .pbix file into the repository and it will get pushed with this latest commit. Today I worked exclusivley inside the .pbix file. I was able to validate the data model one last time because.. why not. After this I begin to outline the report structure. As I explained in my stream, usually I am in the situation where I have to produce results as quickly as possible - this means progress made looks like data on the page. However, since this is a personal project I can take a different approach and essentially design the report first, by outlining the pages in the report, the visuals that will go on those pages, color scheme and any other additional interactive features that need to be added. I begin this process today and I was able to lock in the color scheme and the report outline.

Next Steps:
- Add visual placeholders
- Add report interactivity functionality
-

General Notes:
- How do you automate the starting the PostgreSQL database - in a real world scenario people will use reports at different times and this would be a blocker if the database had to manually started.
- Does it make sense to use Direct Query in Power BI on a static dataset held in PostgreSQL?
- Also is it okay to bring in the fact table if you are using Direct Query in Power BI?