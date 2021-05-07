SELECT        dbo.Table_1.id
FROM            dbo.Table_1 LEFT OUTER JOIN
                         dbo.Table_2 ON dbo.Table_1.id = dbo.Table_2.id

UNION 

SELECT         dbo.Table_2.id 
FROM            dbo.Table_2 LEFT OUTER JOIN
                         dbo.Table_1 ON dbo.Table_1.id = dbo.Table_2.id
where dbo.Table_1.id IS NULL