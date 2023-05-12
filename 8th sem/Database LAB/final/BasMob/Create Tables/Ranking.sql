--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO
Create Table Ranking(
ConferenceID int,
TeamID int,
Wins int,
Losses int,

FOREIGN KEY (ConferenceID) REFERENCES Conference(ID),
FOREIGN KEY (TeamID) REFERENCES Team(ID),
PRIMARY KEY(ConferenceID,TeamID)
);