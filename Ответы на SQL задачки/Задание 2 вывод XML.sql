DECLARE @Test XML

SET @Test = (SELECT   T1.id, Code, Name, StatusId
FROM            dbo.T  T1


FOR XML AUTO, root ('Root')  )

Select @Test


DECLARE @hdoc int
EXEC sp_xml_preparedocument @hdoc OUTPUT, @Test

SELECT *
FROM OPENXML (@hdoc, 'Root/T1' , 1)
WITH(
    id int,
	Code VARCHAR(100),
    Name VARCHAR(100),
	StatusId int
    )

	where StatusId != 3



--SELECT 
--t.f.value('(Root/T1)[1]', 'varchar(100)') AS Id
--FROM (SELECT @Test AS f) t
