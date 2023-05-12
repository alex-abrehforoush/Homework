CREATE OR ALTER PROCEDURE deletePlayer
  @Name VARCHAR(50)
AS
BEGIN
  BEGIN TRY
    DELETE FROM Player WHERE Name = @Name
    PRINT 'Player is deleted'
  END TRY
  BEGIN CATCH
    PRINT 'Error occurred while deleting the player.'
  END CATCH
END;
GO

EXEC deletePlayer @Name = 'Lamelo Ball'

SELECT * FROM Player;
