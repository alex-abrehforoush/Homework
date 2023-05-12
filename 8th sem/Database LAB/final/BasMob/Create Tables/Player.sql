--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO
Create Table Player(
ID int identity(1,1) not null primary key,
TeamID int,
[Name] varchar(255) not null,
Position varchar(255) not null,
age int,
Height int,
[Weight] int,
DraftYear int,
DraftPick int
FOREIGN KEY (TeamID) REFERENCES Team(ID)
);
--Alter table player 
--ADD constraint unique_player_name unique ([name])
--alter table player 
--add constraint position_check   check (Position='Guard' or Position ='Forward' or position = 'Center')
--alter table player
--add Birthyear int;

--update player
--set Birthyear = YEAR(GETDATE()) - age;
--alter table player drop agecheck
--alter table player drop column age



--alter table player add constraint agecheck check(YEAR(GETDATE()) - birthyear >=18)
