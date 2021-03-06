USE [master]
GO
/****** Object:  Database [XMLTest]    Script Date: 07.05.2021 22:00:54 ******/
CREATE DATABASE [XMLTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XMLTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\XMLTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XMLTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\XMLTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [XMLTest] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XMLTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XMLTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XMLTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XMLTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XMLTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XMLTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [XMLTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XMLTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XMLTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XMLTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XMLTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XMLTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XMLTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XMLTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XMLTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XMLTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XMLTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XMLTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XMLTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XMLTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XMLTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XMLTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XMLTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XMLTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XMLTest] SET  MULTI_USER 
GO
ALTER DATABASE [XMLTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XMLTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XMLTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XMLTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [XMLTest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'XMLTest', N'ON'
GO
ALTER DATABASE [XMLTest] SET QUERY_STORE = OFF
GO
USE [XMLTest]
GO
/****** Object:  Table [dbo].[T]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T](
	[id] [int] NOT NULL,
	[Code] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_T] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_T]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_T]
AS
SELECT        id, Code, Name, StatusId
FROM            dbo.T
GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[id] [int] NULL,
	[text] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_2]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_2](
	[id] [int] NULL,
	[text] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TView_1]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TView_1]
AS
SELECT        dbo.Table_2.id, dbo.Table_1.id AS id2, dbo.Table_1.text, dbo.Table_2.text AS text2
FROM            dbo.Table_1 INNER JOIN
                         dbo.Table_2 ON dbo.Table_1.id = dbo.Table_2.id
GO
/****** Object:  View [dbo].[TView_2]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TView_2]
AS
SELECT        dbo.Table_1.id, dbo.Table_2.id AS Expr1
FROM            dbo.Table_1 RIGHT OUTER JOIN
                         dbo.Table_2 ON dbo.Table_1.id = dbo.Table_2.id
GO
/****** Object:  View [dbo].[TView_3]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TView_3]
AS
SELECT        dbo.Table_1.id, dbo.Table_1.text, dbo.Table_2.id AS Expr1, dbo.Table_2.text AS Expr2
FROM            dbo.Table_1 LEFT OUTER JOIN
                         dbo.Table_2 ON dbo.Table_1.id = dbo.Table_2.id
WHERE        (dbo.Table_2.id IS NULL)
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[N] [int] NOT NULL,
	[S] [real] NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[N] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[id] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[author] [varchar](255) NULL,
	[year] [date] NULL,
	[contents] [xml] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[BankAccount] ([N], [S]) VALUES (1, -100)
INSERT [dbo].[BankAccount] ([N], [S]) VALUES (2, 1100)
INSERT [dbo].[BankAccount] ([N], [S]) VALUES (3, 10000)
GO
INSERT [dbo].[Books] ([id], [name], [author], [year], [contents]) VALUES (1, N'Гербердт Шилдт С#', N'Гербердт Шилдт', CAST(N'2006-01-01' AS Date), N'<root><content> Что такое классы?</content><content> Что такое переменные? </content><content> LINQ </content></root>')
INSERT [dbo].[Books] ([id], [name], [author], [year], [contents]) VALUES (2, N'Гербердт Шилдт С++', N'Гербердт Шилдт', CAST(N'2004-01-01' AS Date), N'<root><content> C и С++?</content><content> Шаблоны </content><content> Указатели</content></root>')
INSERT [dbo].[Books] ([id], [name], [author], [year], [contents]) VALUES (3, N'Джедайские техники', N'Максим Дорофеев', CAST(N'2018-01-01' AS Date), N'<root><content> Как не прокрастинировать?</content><content> Задачи, проекты </content><content> Обезъянка удовольствия</content></root>')
INSERT [dbo].[Books] ([id], [name], [author], [year], [contents]) VALUES (4, N'Что нам стоит дом построить', N'Сергей Анатольевич Титов', CAST(N'1991-01-01' AS Date), N'<root><content> Какой дом построить?</content><content> Строим дом </content><content> Что же мы построили? </content></root>')
INSERT [dbo].[Books] ([id], [name], [author], [year], [contents]) VALUES (5, N'Самоучитель', N'Иванов АА', CAST(N'1992-01-01' AS Date), N'<root><content> Учиться</content><content> Учиться!!! </content><content> И еще раз учиться! </content></root>')
INSERT [dbo].[Books] ([id], [name], [author], [year], [contents]) VALUES (6, N'Кулинарная книга', N'Айзеншпис ИМ', CAST(N'1976-01-01' AS Date), N'<root><content> Кошерная еда</content><content> Некошерная еда </content><content> Самое дорогое, но невкусное блюдо </content></root>')
INSERT [dbo].[Books] ([id], [name], [author], [year], [contents]) VALUES (7, N'Война и мир', N'Толстой ЛН', CAST(N'1812-01-01' AS Date), N'')
GO
INSERT [dbo].[T] ([id], [Code], [Name], [StatusId]) VALUES (1, N'agagagfg', N'Запрос предложений 1', 45)
INSERT [dbo].[T] ([id], [Code], [Name], [StatusId]) VALUES (2, N'bsftrfddvshhgss', N'Запрос предложений 2', 2)
INSERT [dbo].[T] ([id], [Code], [Name], [StatusId]) VALUES (3, N'fdgfdgfdgfdgfdg', N'Запрос предложений 3', 45)
INSERT [dbo].[T] ([id], [Code], [Name], [StatusId]) VALUES (4, N'fgfgfdgfdgfdgfh', N'Запрос предложений 4', 3)
INSERT [dbo].[T] ([id], [Code], [Name], [StatusId]) VALUES (5, N'fdgsdgfgjnj', N'Запрос предложений 5', 45)
INSERT [dbo].[T] ([id], [Code], [Name], [StatusId]) VALUES (6, N'gdfsdghj', N'Запрос предложений 6', 2)
GO
INSERT [dbo].[Table_1] ([id], [text]) VALUES (1, N'a1        ')
INSERT [dbo].[Table_1] ([id], [text]) VALUES (2, N'a2        ')
INSERT [dbo].[Table_1] ([id], [text]) VALUES (3, N'a3        ')
INSERT [dbo].[Table_1] ([id], [text]) VALUES (4, N'a4        ')
INSERT [dbo].[Table_1] ([id], [text]) VALUES (5, N'a5        ')
GO
INSERT [dbo].[Table_2] ([id], [text]) VALUES (1, N'b1        ')
INSERT [dbo].[Table_2] ([id], [text]) VALUES (3, N'b3        ')
INSERT [dbo].[Table_2] ([id], [text]) VALUES (6, N'b6        ')
INSERT [dbo].[Table_2] ([id], [text]) VALUES (10, N'b10       ')
GO
/****** Object:  StoredProcedure [dbo].[Bank_transfer]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Bank_transfer]
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
/****** Object:  StoredProcedure [dbo].[DeleteBook]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteBook]
@id int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from dbo.books where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBook]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertBook]
@id int,
@name varchar(255) ,
@author varchar(255) ,
@year date ,
@contents xml 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into dbo.books
	values  (@id, @name, @author, @year, @contents )
END
GO
/****** Object:  StoredProcedure [dbo].[SelectBook]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectBook]
@id int ,
@idRet int OUTPUT,
@name varchar(255) OUTPUT,
@author varchar(255) OUTPUT,
@year date OUTPUT,
@contents xml OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  @idRet = id, @name = name, @author = author, @year = year, @contents = contents from dbo.books where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBook]    Script Date: 07.05.2021 22:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateBook]
@id int,
@name varchar(255) ,
@author varchar(255) ,
@year date ,
@contents xml 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.books
	SET name = @name, author =@author, year = @year, contents = @contents 
	Where id = @id
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Table_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Table_2"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 102
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TView_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TView_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Table_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Table_2"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 102
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TView_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TView_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Table_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Table_2"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 102
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TView_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TView_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "T"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_T'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_T'
GO
USE [master]
GO
ALTER DATABASE [XMLTest] SET  READ_WRITE 
GO
