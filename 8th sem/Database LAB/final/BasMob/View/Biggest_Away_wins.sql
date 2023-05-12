IF OBJECT_ID('biggest_awaywin', 'V') IS NOT NULL
    DROP VIEW biggest_awaywin;
GO

CREATE VIEW biggest_awaywin (GuestTeamName, HostTeamName, GuestTeamScore, HostTeamScore, [Difference], GameDate) AS
WITH temp (GuestTeamId, maxdifference) AS (
	SELECT GuestTeamId, MAX(GuestTeamScore - HostTeamScore)
	FROM Game
	GROUP BY GuestTeamID
	HAVING MAX(GuestTeamScore - HostTeamScore) > 0
),
temp2 AS (
	SELECT id, temp.GuestTeamId, hostTeamid
	FROM temp
	JOIN Game ON temp.GuestTeamId = Game.GuestTeamid AND GuestTeamScore - HostTeamScore = maxdifference
)
SELECT t1.Name, t2.Name, GuestTeamScore, HostTeamScore, GuestTeamScore - HostTeamScore, GameDate
FROM Game
JOIN temp2 ON temp2.id = Game.id
JOIN team t1 ON t1.ID = Game.GuestTeamID
JOIN team t2 ON t2.ID = Game.HostTeamID;



	


--- bazi e ke bishtrin ekhtelaf bein teame mizban va mihman hast
select * from biggest_awaywin