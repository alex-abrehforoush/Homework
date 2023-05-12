insert into StatsPerSeason select playerid,teamid,SUM(Minutes)as minutes,SUM(Points) as points,SUM(rebounds)as rebounds,SUM(Assists)as assists,
SUM(TurnOvers)as TurnOvers,SUM(Steals) as Steals,SUM(Blocks)as Blocks,SUM(FieldGoalShots)as FieldGoalShots,
SUM(FieldGoalMade)as FieldGoalMade,SUM(ThreeGoalShots) as ThreeGoalShots,SUM(ThreeGoalMade)as ThreeGoalMade,SUM(FreeThrowShots)as FreeThrowShots,
SUM(FreeThrowMade)as FreeThrowMade,SUM(Fouls) as Fouls,SUM(Started)as [Started]
from StatsPerGame
group by PlayerID,TeamID

