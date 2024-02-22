# Accident-Analysis

This repo contains files relevant to a project completed for analyzing vehicle accident data.
The purpose of this project was to learn how to clean and manipulate data using pandas, create a relational 
database using SQL DDL (database design language) to store the data, query using SQL DML, (database manipulation language)
and create insights through plotting with matplotlib & seaborn.

The first step of this project involved designing a database structure to efficiently store the data contained in 
vehicle_accidents.xlsx. To do so, a conceptual and logical model were developed to guide the implementation of a 
relational database. 

### Conceptual Model (Entity Relationship Diagram - ERD)

![conceptual-model](https://github.com/zbiery/Accident-Analysis/assets/137420393/8873fb8e-6d33-4c99-bf31-6228b0d235fc)

It was found that data within the vehicle accidents file fits into 4 broad categories that allow for the creation
of a relational schema. Those four categories - Crashes, People, Injuries, & Injury Areas - are the tables for the
database.

### Logical Model (Relational Schema)

![logical-model](https://github.com/zbiery/Accident-Analysis/assets/137420393/139b3674-f651-4a4e-a44b-94f4b23bce57)

The logical model incorporates the fields identified in the conceptual model with the addition of foreign keys to allow for the joining of data. 

Some additional notes about why the models are designed this way:
* Focused on using a OLTP database design approach, prioritizing the normalization of data
* Refrained from including calculated fields in database to increase the performance and processing speed 
*	Avoided many to many relationships as it may result in duplication with joining or other errors when attempting to query and analyze the data
* Ensured referential integrity – each foreign key maps to a unique primary key in another table
* Followed linear structure to avoid circular references 

Jupyter notebook was used for the entirety of this project, including the creation and manipulation of the database tables.

Accident_Analysis_P1 imports and cleans the data as well as instantiates the database tables.
Accident_Analysis_P2 retrieves information from the database tables and showcases an analysis of the accident data.
