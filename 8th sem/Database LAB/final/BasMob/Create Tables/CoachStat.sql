--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO
Create Table CoachStat(
CoachID int,
TeamID int,
Wins int,
Losses int,
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
FOREIGN KEY (CoachID) REFERENCES Coach(ID),
PRIMARY KEY(CoachID,TeamID)
);