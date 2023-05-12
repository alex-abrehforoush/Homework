--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO
Create Table Game(
ID int identity(1,1) not null primary key,
HostTeamID int,
GuestTeamID int,
HostTeamScore int,
GuestTeamScore int,
GameDate date,
WinnerTeam varchar(1),
FOREIGN KEY (HostTeamID) REFERENCES Team(ID),
FOREIGN KEY (GuestTeamID) REFERENCES Team(ID)
);