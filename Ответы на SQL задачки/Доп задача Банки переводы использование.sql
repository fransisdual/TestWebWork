USE [XMLTest]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[Bank_transfer]
		@N1 = 1,
		@N2 = 2,
		@S = 100

GO
