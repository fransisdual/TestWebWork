DECLARE @N1 int
DECLARE @N2 int
DECLARE @S REAL

DECLARE @current_S_firstAccount REAL
DECLARE @current_S_secondAccount REAL

SET @N1 = 1
SET @N2 = 2
SET @S = 100


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

