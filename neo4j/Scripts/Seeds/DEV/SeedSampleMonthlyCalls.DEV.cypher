/*
MERGE dbo.MonthlyCalls AS target
USING (VALUES
    (2025, 1, 1, 2, 'EUR', 'D', 50),   -- Janvier, Eula appelle Alice, Digital, Europe
    (2025, 1, 2, 3, 'AMN', 'V', 100),  -- Janvier, Alice appelle Bob, VoIP, Amérique du Nord
    (2025, 2, 3, 4, 'ASI', 'A', 75),   -- Février, Bob appelle Yoko, Analog, Asie
    (2025, 2, 4, 5, 'EUR', 'X', 20),   -- Février, Yoko appelle Hans, X Tech, Europe
    (2025, 3, 5, 6, 'AMS', 'D', 60),   -- Mars, Hans appelle Antonio, Digital, Amérique du Sud
    (2025, 3, 6, 7, 'AFR', 'V', 90),   -- Mars, Antonio appelle Manolita, VoIP, Afrique
    (2025, 4, 7, 8, 'EUR', 'D', 120),  -- Avril, Manolita appelle Michal, Digital, Europe
    (2025, 4, 8, 9, 'AMN', 'A', 30),   -- Avril, Michal appelle Han, Analog, Amérique du Nord
    (2025, 5, 9, 1, 'ASI', 'X', 40)    -- Mai, Han appelle Eula, X Tech, Asie
) AS source ([Year], [Month], CallerId, CalledId, ContinentCode, ModeCode, TotalCalls)
ON target.[Year] = source.[Year] AND target.[Month] = source.[Month] AND target.CallerId = source.CallerId AND target.CalledId = source.CalledId AND target.ContinentCode = source.ContinentCode AND target.ModeCode = source.ModeCode
WHEN NOT MATCHED THEN
    INSERT ([Year], [Month], CallerId, CalledId, ContinentCode, ModeCode, TotalCalls)
    VALUES (source.[Year], source.[Month], source.CallerId, source.CalledId, source.ContinentCode, source.ModeCode, source.TotalCalls);
*/

UNWIND [
  [2025, 1, 'Eula', 'Alice', 'EUR', 'D', 50],
  [2025, 1, 'Alice', 'Bob', 'AMN', 'V', 100],
  [2025, 2, 'Bob', 'Yoko', 'ASI', 'A', 75],
  [2025, 2, 'Yoko', 'Hans', 'EUR', 'X', 20],
  [2025, 3, 'Hans', 'Antonio', 'AMS', 'D', 60],
  [2025, 3, 'Antonio', 'Manolita', 'AFR', 'V', 90],
  [2025, 4, 'Manolita', 'Michal', 'EUR', 'D', 120],
  [2025, 4, 'Michal', 'Han', 'AMN', 'A', 30],
  [2025, 5, 'Han', 'Eula', 'ASI', 'X', 40]
] AS row
MATCH (caller:Person {name: row[2]}),
      (called:Person {name: row[3]})
MERGE (caller)-[c:CALLED {
  year: row[0],
  month: row[1],
  continentCode: row[4],
  modeCode: row[5],
  totalCalls: row[6]
}]->(called);
