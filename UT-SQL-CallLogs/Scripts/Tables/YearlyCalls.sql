-- YearlyCalls (Sum per person and per year)
CREATE TABLE [dbo].[YearlyCalls]
(
    [Year] SMALLINT NOT NULL,
    PersonId INT NOT NULL FOREIGN KEY REFERENCES People(PersonId),
    TotalAppels BIGINT NOT NULL,
    PRIMARY KEY ([Year], PersonId)
);
