-- LastCalls (date of the last call per person and optionally per continent/mode)
CREATE TABLE [dbo].[LastCalls]
(
    PersonId INT PRIMARY KEY FOREIGN KEY REFERENCES People(PersonId),
    LastCallMonth DATE NULL,  -- Ex: '2025-06-01' for June
    LastCallPerContinentMode NVARCHAR(MAX) NULL  -- JSON keeping precise dates if needs be
);