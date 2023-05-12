
create trigger UpdateRanking
on Game
After INSERT,update
as
DECLARE @host varchar(10)
DECLARE @guest varchar(10)
SET @host = (SELECT HostTeamId from inserted)
SET @guest = (SELECT GuestTeamId from inserted)
begin
if (select WinnerTeam from inserted) = @host
begin
Update Ranking
SET Wins = Wins+1
FROM Ranking
JOIN inserted on inserted.HostTeamID=Ranking.TeamID
Update Ranking
SET Losses = Losses+1
FROM Ranking
JOIN inserted on inserted.GuestTeamID=Ranking.TeamID
end

if (select WinnerTeam from inserted) = @Guest
begin
Update Ranking
SET Wins = Wins+1
FROM Ranking
JOIN inserted on inserted.GuestTeamID=Ranking.TeamID
Update Ranking
SET Losses = Losses+1
FROM Ranking
JOIN inserted on inserted.HostTeamID=Ranking.TeamID
end
end


insert into Game(HostTeamID,GuestTeamID,HostTeamScore,GuestTeamScore,WinnerTeam)values(1,4,50,53,4)
insert into Game(HostTeamID,GuestTeamID,HostTeamScore,GuestTeamScore,WinnerTeam)values(5,4,68,79,5)


select *
from game
select * from Ranking
