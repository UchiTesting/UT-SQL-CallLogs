/*
MERGE [dbo].[People] AS target
USING (VALUES
    ('Eula'),
    ('Alice'),
    ('Bob'),
    ('Yoko'),
    ('Hans'),
    ('Antonio'),
    ('Manolita'),
    ('Michal'),
    ('Han')
) AS source ([Name])
ON target.[Name]  = source.[Name]
WHEN NOT MATCHED THEN
    INSERT ([Name]) VALUES (source.[Name]);
*/

UNWIND ['Eula', 'Alice', 'Bob', 'Yoko', 'Hans', 'Antonio', 'Manolita', 'Michal', 'Han'] AS name
MERGE (:Person {name: name});
