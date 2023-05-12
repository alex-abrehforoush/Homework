--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO
Create Table Team(
ID int identity(1,1) not null primary key,
[Name] varchar(255) not null,
Stadium varchar(255) null,
City varchar(255) not null,
DivisionID int,
ConferenceID int,
CoachID int,
FOREIGN KEY (DivisionID) REFERENCES Division(ID),
FOREIGN KEY (ConferenceID) REFERENCES Conference(ID),
FOREIGN KEY (CoachID) REFERENCES Coach(ID)

);
--Alter table team 
--ADD constraint unique_team_name unique ([name])