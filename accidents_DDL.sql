--Create schema for tables


--Create Crashes Table
CREATE TABLE final.Crashes (
    CrashID VARCHAR(10) UNIQUE NOT NULL,
    CrashDateTime DATETIME NOT NULL,
    CONSTRAINT CrashPK PRIMARY KEY (CrashID));

--Create Table for People Involved in Crashes
CREATE TABLE final.People (
    PersonID VARCHAR(10) UNIQUE NOT NULL,
    CrashID VARCHAR(10) NOT NULL,
    Age INT NOT NULL,
    Sex CHAR(1) NOT NULL,
    Type VARCHAR (20) NOT NULL,
    CONSTRAINT PersonSexCheck CHECK (Sex IN ('F','M','U')),
    CONSTRAINT PersonPK PRIMARY KEY (PersonID),
    CONSTRAINT CrashFK FOREIGN KEY (CrashID) REFERENCES final.Crashes(CrashID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION);

--Create Table to house InjuryArea identifiers
CREATE TABLE final.InjuryAreas (
    InjuryAreaID VARCHAR(3) UNIQUE NOT NULL,
    InjuryArea VARCHAR(20) NOT NULL,
    CONSTRAINT InjuryAreaPK PRIMARY KEY (InjuryAreaID));

--Create table for Injuries sustained by People involved in Crashes
CREATE TABLE final.Injuries (
    InjuryID VARCHAR(10) UNIQUE NOT NULL,
    PersonID VARCHAR(10) NOT NULL,
    InjuryAreaID VARCHAR(3) NOT NULL,
    Severity VARCHAR(20) NOT NULL,
    CONSTRAINT InjuryPK PRIMARY KEY (InjuryID),
    CONSTRAINT PersonFK FOREIGN KEY (PersonID) REFERENCES final.People(PersonID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT InjuryAreaFK FOREIGN KEY (InjuryAreaID) REFERENCES final.InjuryAreas(InjuryAreaID)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION);


