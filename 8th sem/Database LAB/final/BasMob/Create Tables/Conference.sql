--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO
Create Table Conference(
ID int identity(1,1) not null primary key,
[Name] varchar(255) not null
);
--alter table conference 
--add constraint name_check check (name ='West' or name='East')