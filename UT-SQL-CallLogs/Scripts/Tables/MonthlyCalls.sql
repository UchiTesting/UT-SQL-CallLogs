CREATE TABLE [dbo].[MonthlyCalls]
(
    [Year] SMALLINT NOT NULL,
    [Month] TINYINT NOT NULL CHECK ([Month] BETWEEN 1 AND 12),
    CallerId INT NOT NULL FOREIGN KEY REFERENCES People(PersonId),
    CalledId INT NOT NULL FOREIGN KEY REFERENCES People(PersonId),
    ContinentCode CHAR(3) NOT NULL FOREIGN KEY REFERENCES Continents(ContinentCode),
    ModeCode CHAR(1) NOT NULL FOREIGN KEY REFERENCES CommunicationModes(ModeCode),
    TotalCalls BIGINT NOT NULL,
    PRIMARY KEY ([Year], [Month], CallerId, CalledId, ContinentCode, ModeCode)
);