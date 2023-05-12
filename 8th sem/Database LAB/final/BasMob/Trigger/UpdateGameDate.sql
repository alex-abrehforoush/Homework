CREATE TRIGGER UpdateGameDate
ON Game
AFTER INSERT
AS
BEGIN
  UPDATE Game
  SET GameDate = GETDATE()
  FROM Game
  JOIN inserted ON inserted.ID = Game.ID;
END;


--insert into Game(HostTeamID,GuestTeamID,HostTeamScore,GuestTeamScore,WinnerTeam) values (7,8,100,73,7)
--SELECT * from Game