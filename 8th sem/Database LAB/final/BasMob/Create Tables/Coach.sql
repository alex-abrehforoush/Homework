--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO
Create Table Coach(
ID int identity(1,1) not null primary key,
[Name] varchar(255) not null,
Birthdate date null,
Experience int null
);

--Alter table coach 
--ADD constraint unique_name unique ([name])




--alter table coach 
--add Birthyear  int;
--UPDATE coach
--SET Birthyear = YEAR(Birthdate)

--alter table coach drop column birthdate