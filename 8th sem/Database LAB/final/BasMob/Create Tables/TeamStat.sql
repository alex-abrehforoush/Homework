--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO
Create Table TeamStat(
TeamID int,
Points int,
Rebounds int,
Assists int,
TurnOvers int,
Steals int,
Blocks int,
FieldGoalShots int,
FieldGoalMade int,
ThreeGoalShots int,
ThreeGoalMade int,
FreeThrowShots int,
FreeThrowMade int,
Fouls int,
FOREIGN KEY (TeamID) REFERENCES Team(ID),
PRIMARY KEY(TeamID)
);