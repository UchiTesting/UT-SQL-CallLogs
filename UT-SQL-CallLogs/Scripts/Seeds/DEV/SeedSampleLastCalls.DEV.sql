MERGE dbo.LastCalls AS target
USING (VALUES
    (1, '2025-05-01', '{"EUR-D":"2025-04-25","ASI-X":"2025-05-01"}'),    -- Eula
    (2, '2025-02-01', '{"EUR-D":"2025-01-15","AMN-V":"2025-02-20"}'),    -- Alice
    (3, '2025-02-01', '{"ASI-A":"2025-02-10"}'),                        -- Bob
    (4, '2025-04-01', '{"EUR-X":"2025-02-25"}'),                        -- Yoko
    (5, '2025-03-01', '{"AMS-D":"2025-03-15"}'),                        -- Hans
    (6, '2025-03-01', '{"AFR-V":"2025-03-20"}'),                        -- Antonio
    (7, '2025-04-01', '{"EUR-D":"2025-04-15"}'),                        -- Manolita
    (8, '2025-04-01', '{"AMN-A":"2025-04-10"}'),                        -- Michal
    (9, '2025-05-01', '{"ASI-X":"2025-05-01"}')                         -- Han
) AS source (PersonId, LastCallMonth, LastCallPerContinentMode)
ON target.PersonId = source.PersonId
WHEN NOT MATCHED THEN
    INSERT (PersonId, LastCallMonth, LastCallPerContinentMode)
    VALUES (source.PersonId, source.LastCallMonth, source.LastCallPerContinentMode)
WHEN MATCHED THEN
    UPDATE SET LastCallMonth = source.LastCallMonth,
               LastCallPerContinentMode = source.LastCallPerContinentMode;
