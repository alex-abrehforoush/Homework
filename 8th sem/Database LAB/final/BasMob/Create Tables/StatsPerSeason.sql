--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO
Create Table StatsPerSeason(
PlayerID int,
TeamID int,
[Minutes] int,
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
[Started] int,
FOREIGN KEY (TeamID) REFERENCES Team(ID),
FOREIGN KEY (PlayerID) REFERENCES Player(ID),
PRIMARY KEY(PlayerID,TeamID)
);