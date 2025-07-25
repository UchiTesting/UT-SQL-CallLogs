/*
MERGE dbo.YearlyCalls AS target
USING (VALUES
    (2025, 1, 1234),   -- Eula
    (2025, 2, 2345),   -- Alice
    (2025, 3, 3456),   -- Bob
    (2025, 4, 4567),   -- Yoko
    (2025, 5, 5678),   -- Hans
    (2025, 6, 6789),   -- Antonio
    (2025, 7, 7890),   -- Manolita
    (2025, 8, 8901),   -- Michal
    (2025, 9, 9012)    -- Han
) AS source ([Year], PersonId, TotalAppels)
ON target.[Year] = source.[Year] AND target.PersonId = source.PersonId
WHEN NOT MATCHED THEN
    INSERT ([Year], PersonId, TotalAppels) VALUES (source.[Year], source.PersonId, source.TotalAppels);

*/

UNWIND [
  ['Eula',   1234],
  ['Alice',  2345],
  ['Bob',    3456],
  ['Yoko',   4567],
  ['Hans',   5678],
  ['Antonio',7890],
  ['Manolita',8901],
  ['Michal', 9012],
  ['Han',    9012]
] AS row
MATCH (p:Person {name: row[0]})
SET p.yearlyCalls = 
  CASE 
    WHEN p.yearlyCalls IS NULL THEN '{ "2025": ' + row[1] + ' }' 
    ELSE p.yearlyCalls[0..-1] + ', "2025": ' + row[1] 
  END;
