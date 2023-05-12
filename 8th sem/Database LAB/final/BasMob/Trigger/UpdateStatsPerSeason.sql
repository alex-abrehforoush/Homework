CREATE OR ALTER TRIGGER UpdateStatsPerSeason
ON StatsPerGame
AFTER INSERT
AS
BEGIN
  SET NOCOUNT ON;

  UPDATE sps
  SET sps.minutes += i.Minutes,
      sps.Points += i.Points,
      sps.rebounds += i.rebounds,
      sps.Assists += i.Assists,
      sps.TurnOvers += i.TurnOvers,
      sps.Steals += i.Steals,
      sps.Blocks += i.Blocks,
      sps.FieldGoalShots += i.FieldGoalShots,
      sps.FieldGoalMade += i.FieldGoalMade,
      sps.ThreeGoalShots += i.ThreeGoalShots,
      sps.ThreeGoalMade += i.ThreeGoalMade,
      sps.FreeThrowShots += i.FreeThrowShots,
      sps.FreeThrowMade += i.FreeThrowMade,
      sps.Fouls += i.Fouls,
      sps.Started += i.Started
  FROM StatsPerSeason sps
  JOIN inserted i ON sps.PlayerID = i.playerid AND sps.TeamID = i.teamid;

END;

INSERT INTO StatsPerGame VALUES (3, 4, 9, 30, 8, 7, 3, 1, 2, 0, 9, 3, 4, 2, 0, 0, 2, 1);

SELECT * FROM game;
SELECT * FROM StatsPerSeason;
SELECT * FROM StatsPerGame;
