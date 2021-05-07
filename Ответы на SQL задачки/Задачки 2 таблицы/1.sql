SELECT        dbo.Table_2.id, dbo.Table_1.id AS id2, dbo.Table_1.text, dbo.Table_2.text AS text2
FROM            dbo.Table_1 INNER JOIN
                         dbo.Table_2 ON dbo.Table_1.id = dbo.Table_2.id