insert into TeamStat
SELECT teamid,SUM(Points) as points,SUM(rebounds)as rebounds,SUM(Assists)as assists,
SUM(TurnOvers)as TurnOvers,SUM(Steals) as Steals,SUM(Blocks)as Blocks,SUM(FieldGoalShots)as FieldGoalShots,
SUM(FieldGoalMade)as FieldGoalMade,SUM(ThreeGoalShots) as ThreeGoalShots,SUM(ThreeGoalMade)as ThreeGoalMade,SUM(FreeThrowShots)as FreeThrowShots,
SUM(FreeThrowMade)as FreeThrowMade,SUM(Fouls) as Fouls
from StatsPerGame
group by TeamID

