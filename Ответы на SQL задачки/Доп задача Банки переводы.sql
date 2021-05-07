-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Bank_transfer
@N1 int,
@N2 int,
@S real
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	DECLARE @current_S_firstAccount REAL
DECLARE @current_S_secondAccount REAL


IF EXISTS(select S from dbo.BankAccount where N=@N1 and S>=@S)
BEGIN
PRINT ('Деньги есть')

SET @current_S_firstAccount = (select S from dbo.BankAccount where N=@N1)
SET @current_S_secondAccount = (select S from dbo.BankAccount where N=@N2)

UPDATE dbo.BankAccount
SET S = (@current_S_firstAccount - @S)
where N = @N1

UPDATE dbo.BankAccount
SET S = (@current_S_secondAccount + @S)
where N = @N2

END
ELSE
Print ('Денег нет')

END
GO
