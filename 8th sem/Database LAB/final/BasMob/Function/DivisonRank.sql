CREATE OR ALTER FUNCTION Divisions_best(
  @name VARCHAR(20)
)
RETURNS @division_ranking TABLE (
  Name VARCHAR(150),
  Ranking INT
)
AS
BEGIN
  IF NOT EXISTS (SELECT * FROM Division WHERE Name = @name)
  BEGIN
    --RAISERROR('Division not found.', 16, 1)
    RETURN;
  END
  
  INSERT INTO @division_ranking
  SELECT 
    Team.[Name], 
    RANK() OVER (PARTITION BY Ranking.ConferenceID ORDER BY Wins-Losses DESC) AS Ranking
  FROM 
    Ranking 
    JOIN Team ON Team.ID = Ranking.TeamID 
    JOIN Division ON Team.DivisionID = Division.ID 
  WHERE 
    Division.Name = @name 
  ORDER BY 
    Ranking

  RETURN;
END;
GO

SELECT *
FROM Divisions_best('Atlantic');
