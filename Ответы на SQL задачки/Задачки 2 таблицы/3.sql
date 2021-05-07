SELECT        dbo.Table_1.id, dbo.Table_1.text, dbo.Table_2.id AS Expr1, dbo.Table_2.text AS Expr2
FROM            dbo.Table_1 LEFT OUTER JOIN
                         dbo.Table_2 ON dbo.Table_1.id = dbo.Table_2.id
WHERE        (dbo.Table_2.id IS NULL)