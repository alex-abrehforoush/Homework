create trigger SetWinner
on Game
Instead of INSERT
as
DECLARE @hostTeamID int
DECLARE @guestTeamID int
DECLARE @hostscore int
DECLARE @guestscore int
Declare @winner varchar(10)
SET @hostscore = (SELECT HostTeamScore from inserted)
SET @guestscore = (SELECT GuestTeamScore from inserted)
SET @hostTeamID = (SELECT HostTeamID from inserted)
SET @guestTeamID = (SELECT guestTeamID from inserted)
begin

if @hostscore > @guestscore
begin
set @winner = @hostTeamID
end

if @hostscore < @guestscore
set @winner = @guestTeamID
insert into Game (HostTeamID,GuestTeamID,HostTeamScore,GuestTeamScore,WinnerTeam) 
values (@hostTeamID,@guestTeamID,@hostscore,@guestscore,@winner)

end


insert into Game(HostTeamID,GuestTeamID,HostTeamScore,GuestTeamScore)values(1,3,65,53)
insert into Game(HostTeamID,GuestTeamID,HostTeamScore,GuestTeamScore)values(5,9,93,79)

insert into Game(HostTeamID,GuestTeamID,HostTeamScore,GuestTeamScore)values(2,10,90,53)

select *
from game
select * from Ranking
