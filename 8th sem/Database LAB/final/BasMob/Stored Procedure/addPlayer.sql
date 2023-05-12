CREATE OR ALTER PROCEDURE addPlayer
  @Name VARCHAR(50),
  @TeamID INT,
  @Age INT,
  @Position VARCHAR(10),
  @Height INT,
  @Weight INT,
  @DraftYear INT,
  @DraftPick INT
AS
BEGIN
  BEGIN TRY
    INSERT INTO Player (Name, TeamID, Age, Position, Height, Weight, DraftYear, DraftPick)
    VALUES (@Name, @TeamID, @Age, @Position, @Height, @Weight, @DraftYear, @DraftPick)
  
    PRINT 'Player added successfully.'
  END TRY
  BEGIN CATCH
    PRINT 'Error occurred while adding the player.'
  END CATCH
END;
GO

EXEC addPlayer 
  @Name = 'Lamelo Ball',
  @TeamID = 8,
  @Age = 19,
  @Position = 'Guard',
  @Height = 199,
  @Weight = 80,
  @DraftYear = 2020,
  @DraftPick = 1;

EXEC addPlayer 
  @Name = 'Luka Doncic',
  @TeamID = 12,
  @Age = 22,
  @Position = 'Guard',
  @Height = 204,
  @Weight = 86,
  @DraftYear = 2019,
  @DraftPick = 3;

SELECT * FROM Player;
SELECT * FROM team;
