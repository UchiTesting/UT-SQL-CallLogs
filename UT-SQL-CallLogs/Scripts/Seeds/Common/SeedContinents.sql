MERGE [dbo].[Continents] AS target
USING (VALUES
    ('EUR', 'Europe'),
    ('AMN', 'North America'),
    ('AMS', 'South America'),
    ('AFR', 'Africa'),
    ('ASI', 'Asia')
) AS source (ContinentCode, ContinentName)
ON target.ContinentCode = source.ContinentCode
WHEN NOT MATCHED THEN
    INSERT (ContinentCode, ContinentName) VALUES (source.ContinentCode, source.ContinentName);
