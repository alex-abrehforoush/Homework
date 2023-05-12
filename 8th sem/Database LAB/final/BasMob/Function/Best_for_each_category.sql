create or alter function best_of_categories(
 @name varchar(20)

)
RETURNS @best_players TABLE 
(
  Name varchar(150),
  Ranking int,
  Season_Stat int
)
as
begin
if @name='Points' begin
insert into @best_players select player.[Name],RANK()  over( ORDER BY Points Desc) as Ranking,Points
from player,StatsPerSeason
where StatsPerSeason.PlayerID=player.ID
order by Ranking
end
if @name='Rebounds' begin
insert into @best_players select player.[Name],RANK()  over( ORDER BY Rebounds Desc) as Ranking,Rebounds
from player,StatsPerSeason
where StatsPerSeason.PlayerID=player.ID
order by Ranking
end
if @name='Assists' begin
insert into @best_players select player.[Name],RANK()  over( ORDER BY Assists Desc) as Ranking,Assists
from player,StatsPerSeason
where StatsPerSeason.PlayerID=player.ID
order by Ranking
end
if @name='Steals' begin
insert into @best_players select player.[Name],RANK()  over( ORDER BY Steals Desc) as Ranking,Steals
from player,StatsPerSeason
where StatsPerSeason.PlayerID=player.ID
order by Ranking
end
if @name='Blocks' begin
insert into @best_players select player.[Name],RANK()  over( ORDER BY Blocks Desc) as Ranking,Blocks
from player,StatsPerSeason
where StatsPerSeason.PlayerID=player.ID
order by Ranking
end


return;
END;
GO

SELECT *
FROM best_of_categories('Points')




