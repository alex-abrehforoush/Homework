CREATE OR ALTER FUNCTION Draft_player(
  @draft_year INT
)
RETURNS @draft_players TABLE (
  Name VARCHAR(150),
  DraftPick INT
)
AS
BEGIN
  INSERT INTO @draft_players
  SELECT [Name], DraftPick
  FROM Player
  WHERE DraftYear = @draft_year

  RETURN;
END;
GO

SELECT *
FROM Draft_player(2019)
ORDER BY DraftPick;
