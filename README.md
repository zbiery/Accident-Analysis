# Accident-Analysis

## Project Description ##

Conceptual Model (ERD)
 ![alt](https://github.com/zbiery/Accident-Analysis/blob/conceptual-model.jpg?raw=true)


Logical Model (Relational Schema)
 
The logical model incorporates the fields identified in the conceptual model with the addition of foreign keys to allow for the joining of data. 
Some additional notes about why the models are designed this way:
* Focused on using a OLTP database design approach, prioritizing the normalization of data
* Refrained from including calculated fields in database to increase the performance and processing speed 
*	Avoided many to many relationships as it may result in duplication with joining or other errors when attempting to query and analyze the data
* Ensured referential integrity – each foreign key maps to a unique primary key in another table
* Followed linear structure to avoid circular references 

Accident_Analysis_P1 imports and cleans the data as well as instantiates the database tables used to store the data
Accident_Analysis_P2 retrieves data from the database tables and performs a simple analysis. 
