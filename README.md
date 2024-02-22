# Accident-Analysis

## Project Description ##

Conceptual Model (ERD)
 ![Alt text]("C:\Users\Zbier\OneDrive\Documents\2023-2024\Data MGMT\Python\Final Project\logical-model.jpg"?raw=true "ERD")
When we first approached this problem, we noticed that the fields given in the original data fit into 3 broad categories: (1) Crash specific information such as ‘CRASH_DATE’ and ‘CRASH_TIME, (2) Demographic information such as ‘PERSON_AGE’, ‘PERSON_SEX’ and ‘INJURY_PERSON_TYPE’, and (3) Injury information such as ‘INJURY_AREA’ and ‘INJURY_RESULT.’ We decided to model each of these categories as its own table in our conceptual model. 
This served as a basic outline for our conceptual model; however, our team also made some assumptions about the data that further shaped our model:
1.	Each instance of the same combination of ‘CRASH_DATE’ & ‘CRASH_TIME’ identifies the same crash – each record containing the same ‘CRASH_DATE’ & ‘CRASH_TIME’ is the same crash
2.	Each ‘-’ delimited value for ‘INJURY_AREA’ represents an individual injury area
3.	If the ‘INJURY_AREA’ value is ‘Does not apply’ or ‘Unknown’, no injury was sustained
4.	Data may scale in the future
Assumption 1 served as a basis for determining the cardinality requirements for ‘Crashes’ and ‘People’. Each person must be involved in exactly one crash, and each crash may involve one to many people. Additionally, assumption 1 allowed us to create a unique key (which we call CrashID) to identify each crash.
Assumption 2 helped us determine the cardinality for ‘People’ and ‘Injuries’. If each delimited value in the ‘INJURY_AREA’ field represents a single injury, then a person may have many injuries, but each injury must be associated with exactly 1 person.
Assumption 3 helped us further refine the cardinality requirement for the ‘People’ and ‘Injuries’ tables. Some people may not have an injury record associated with them in the injury table as a result of dropping fields, shifting the cardinality to become 0 to many. 
Assumption 4 served as a basis for our creation of an ‘InjuryAreas’ table. If data were to scale in the future, it is important that data integrity is maintained. By creating another table housing each injury area and assigning it a unique identifier, we ensure each reported injury is associated with an injury area. Additionally, this prevents entries such as the delimited lists found in the original data from being entered in the future. 

Logical Model (Relational Schema)
 
The logical model incorporates the fields identified in our conceptual model with the addition of foreign keys to allow for the joining of data. 
Some additional notes about why models are designed this way:
* Focused on using a OLTP database design approach, prioritizing the normalization of data
* Refrained from including calculated fields in database to increase the performance and processing speed 
*	Avoided many to many relationships as it may result in duplication with joining or other errors when attempting to query and analyze the data
* Ensured referential integrity – each foreign key maps to a unique primary key in another table
* Followed linear structure to avoid circular references 




Accident_Analysis_P1 imports and cleans the data as well as instantiates the database tables used to store the data
Accident_Analysis_P2 retrieves data from the database tables and performs a simple analysis. 
