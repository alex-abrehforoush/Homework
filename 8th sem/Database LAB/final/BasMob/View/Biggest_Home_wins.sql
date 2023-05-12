IF OBJECT_ID('biggest_homewin', 'V') IS NOT NULL
    DROP VIEW biggest_homewin;
GO

CREATE VIEW biggest_homewin (HostTeamName, GuestTeamName, HostTeamScore, GuestTeamScore, [Difference], GameDate) AS
WITH temp (HostTeamID, maxdifference) AS (
	SELECT HostTeamID, MAX(HostTeamScore - GuestTeamScore)
	FROM Game
	GROUP BY HostTeamID
	HAVING MAX(HostTeamScore - GuestTeamScore) > 0
),
temp2 AS (
	SELECT id, temp.HostTeamID, guestTeamID
	FROM temp
	JOIN Game ON temp.HostTeamID = Game.HostTeamID AND HostTeamScore - GuestTeamScore = maxdifference
)
SELECT t1.Name, t2.Name, HostTeamScore, GuestTeamScore, HostTeamScore - GuestTeamScore, GameDate
FROM Game
JOIN temp2 ON temp2.id = Game.id
JOIN team t1 ON t1.ID = Game.HostTeamID
JOIN team t2 ON t2.ID = Game.GuestTeamID;


--- bazi ke bishtrin ekhtelaf bein teame mizban va mihman hast
	select*from biggest_homewin
