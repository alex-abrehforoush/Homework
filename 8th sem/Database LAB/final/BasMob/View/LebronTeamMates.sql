CREATE VIEW LebronTeamMates (Name, Position, Age) AS
SELECT p1.Name, p1.Position, p1.Age
FROM Player AS p
JOIN Player AS p1 ON p.TeamID = p1.TeamID
WHERE p.Name = 'LeBron James';
