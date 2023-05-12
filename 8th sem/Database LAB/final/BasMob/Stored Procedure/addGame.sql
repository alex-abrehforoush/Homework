CREATE OR ALTER PROCEDURE addGame 
  @HostTeamId INT,
  @GuestTeamId INT,
  @HostTeamScore INT,
  @GuestTeamScore INT
AS
BEGIN
  BEGIN TRY
    INSERT INTO Game (HostTeamID, GuestTeamID, HostTeamScore, GuestTeamScore)
    VALUES (@HostTeamId, @GuestTeamId, @HostTeamScore, @GuestTeamScore);
    
    PRINT 'Game added successfully.';
  END TRY
  BEGIN CATCH
    PRINT 'Error occurred while adding the game.';
  END CATCH
END;
GO

EXEC addGame
  @HostTeamId = 9,
  @GuestTeamId = 12,
  @HostTeamScore = 121,
  @GuestTeamScore = 109;

SELECT * FROM Game;
SELECT * FROM team;
SELECT * FROM Ranking;
