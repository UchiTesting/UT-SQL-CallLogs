/*
MERGE dbo.CommunicationModes AS target
USING (VALUES
    ('D', 'Digital'),
    ('A', 'Analog'),
    ('X', 'X Tech'),
    ('V', 'VoIP')
) AS source (ModeCode, ModeName)
ON target.ModeCode = source.ModeCode
WHEN NOT MATCHED THEN
    INSERT (ModeCode, ModeName) VALUES (source.ModeCode, source.ModeName);
*/

UNWIND [
  ['D', 'Digital'],
  ['A', 'Analog'],
  ['X', 'X Tech'],
  ['V', 'VoIP']
] AS row
MERGE (:CommunicationMode {code: row[0], name: row[1]});
