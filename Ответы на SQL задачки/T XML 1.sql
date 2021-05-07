SELECT        id, Code, Name, StatusId AS XMLData
FROM            dbo.T  T1

FOR XML AUTO, ELEMENTS, root ('Root')