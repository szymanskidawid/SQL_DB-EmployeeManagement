﻿USE [master]
GO
/****** Object:  Database [EmployeeManagement]    Script Date: 24.07.2023 14:55:27 ******/
CREATE DATABASE [EmployeeManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MYSERVER\MSSQL\DATA\EmployeeManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EmployeeManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MYSERVER\MSSQL\DATA\EmployeeManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EmployeeManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeManagement] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EmployeeManagement] SET QUERY_STORE = OFF
GO
USE [EmployeeManagement]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[DepartmentLocation] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DateOfBirth] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[TelephoneNumber] [nvarchar](50) NOT NULL,
	[Address1] [nvarchar](50) NOT NULL,
	[Postcode] [nvarchar](50) NOT NULL,
	[Town] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[JobTitle] [nvarchar](50) NULL,
	[ContractStart] [nvarchar](50) NOT NULL,
	[ContractEnd] [nvarchar](50) NOT NULL,
	[Salary] [nvarchar](50) NOT NULL,
	[Currency] [nvarchar](50) NOT NULL,
	[jobTitleId] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitles]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[JobTitleName] [nvarchar](50) NOT NULL,
	[JobTitleDepartment] [nvarchar](50) NULL,
	[IsSupervisor] [nvarchar](50) NOT NULL,
	[departmentId] [int] NULL,
 CONSTRAINT [PK_JobTitle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginTable]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginTable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__LoginTab__3213E83FA4F76F02] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__LoginTab__F3DBC572F65249AF] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_JobTitle] FOREIGN KEY([jobTitleId])
REFERENCES [dbo].[JobTitles] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_JobTitle]
GO
ALTER TABLE [dbo].[JobTitles]  WITH CHECK ADD  CONSTRAINT [FK_JobTitle_Departments] FOREIGN KEY([departmentId])
REFERENCES [dbo].[Departments] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[JobTitles] CHECK CONSTRAINT [FK_JobTitle_Departments]
GO
/****** Object:  StoredProcedure [dbo].[spDepartments_Delete]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDepartments_Delete]
	@id int,
	@DepartmentName nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE from dbo.Departments
	where id = @id;

	UPDATE dbo.JobTitles
	SET JobTitleDepartment = NULL
	WHERE JobTitleDepartment = @DepartmentName;
    
END
GO
/****** Object:  StoredProcedure [dbo].[spDepartments_GetAll]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDepartments_GetAll]
	
AS
BEGIN

	SET NOCOUNT ON;

    select *
	from dbo.Departments;
END
GO
/****** Object:  StoredProcedure [dbo].[spDepartments_Insert]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spDepartments_Insert]
	@DepartmentName nvarchar(50),
	@DepartmentLocation nvarchar(50),
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

	insert into dbo.Departments(DepartmentName, DepartmentLocation)
	values(@DepartmentName, @DepartmentLocation);
	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spDepartments_Update]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDepartments_Update]
	@id int,
	@DepartmentName nvarchar(50),
	@DepartmentLocation nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.Departments
	SET DepartmentName = @DepartmentName,
		DepartmentLocation = @DepartmentLocation
	WHERE id = @id;

END
GO
/****** Object:  StoredProcedure [dbo].[spEmployees_Delete]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEmployees_Delete]
	@id int
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE from dbo.Employees
	where id = @id;
    
END
GO
/****** Object:  StoredProcedure [dbo].[spEmployees_GetAll]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEmployees_GetAll]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    select * 
	from dbo.Employees;
END
GO
/****** Object:  StoredProcedure [dbo].[spEmployees_Insert]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEmployees_Insert]
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@DateOfBirth nvarchar(50),
	@Gender nvarchar(50),
	@EmailAddress nvarchar(50),
	@TelephoneNumber nvarchar(50),
	@Address1 nvarchar(50),
	@Postcode nvarchar(50),
	@Town nvarchar(50),
	@Country nvarchar(50),
	@JobTitle nvarchar(50),
	@ContractStart nvarchar(50),
	@ContractEnd nvarchar(50),
	@Salary nvarchar(50),
	@Currency nchar(10),
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    DECLARE @jobTitleId int;


    SELECT @jobTitleId = id
    FROM dbo.JobTitles
    WHERE JobTitleName = @JobTitle;

	insert into dbo.Employees (FirstName, LastName, DateOfBirth, Gender, EmailAddress, 
	TelephoneNumber, Address1, Postcode, Town, Country, JobTitle, ContractStart, 
	ContractEnd, Salary, Currency, jobTitleId)
	values (@FirstName, @LastName, @DateOfBirth, @Gender, @EmailAddress, 
	@TelephoneNumber, @Address1, @Postcode, @Town, @Country, @JobTitle, @ContractStart, 
	@ContractEnd, @Salary, @Currency, @jobTitleId);

	select @id=SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spEmployees_Update]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEmployees_Update]
	@id int,
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@DateOfBirth nvarchar(50),
	@Gender nvarchar(50),
	@EmailAddress nvarchar(50),
	@TelephoneNumber nvarchar(50),
	@Address1 nvarchar(50),
	@Postcode nvarchar(50),
	@Town nvarchar(50),
	@Country nvarchar(50),
	@JobTitle nvarchar(50),
	@ContractStart nvarchar(50),
	@ContractEnd nvarchar(50),
	@Salary nvarchar(50),
	@Currency nchar(10)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @jobTitleId int;

	SELECT @jobTitleId = id
	FROM dbo.JobTitles
	WHERE JobTitleName = @JobTitle;

	UPDATE dbo.Employees 
	SET 
		FirstName = @FirstName,
		LastName = @LastName,
		DateOfBirth = @DateOfBirth,
		Gender = @Gender,
		EmailAddress = @EmailAddress,
		TelephoneNumber = @TelephoneNumber,
		Address1 = @Address1,
		Postcode = @Postcode,
		Town = @Town,
		Country = @Country,
		JobTitle = @JobTitle,
		ContractStart = @ContractStart,
		ContractEnd = @ContractEnd,
		Salary = @Salary,
		Currency = @Currency,
		jobTitleId = @jobTitleId
	WHERE 
		Id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spJobTitles_Delete]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spJobTitles_Delete]
	@id int,
	@JobTitleName nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

	DELETE from dbo.JobTitles
	WHERE id = @id;

	UPDATE dbo.Employees
	SET JobTitle = NULL
	WHERE JobTitle = @JobTitleName;
    
END
GO
/****** Object:  StoredProcedure [dbo].[spJobTitles_GetAll]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spJobTitles_GetAll]

AS
BEGIN

	SET NOCOUNT ON;

	select * 
	from dbo.JobTitles;
END
GO
/****** Object:  StoredProcedure [dbo].[spJobTitles_Insert]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spJobTitles_Insert]
	@JobTitleName nvarchar(50),
	@JobTitleDepartment nvarchar(50),
	@IsSupervisor nvarchar(50),
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @departmentId int;

    SELECT @departmentId = id
    FROM dbo.Departments
    WHERE DepartmentName = @JobTitleDepartment;

	insert into dbo.JobTitles(JobTitleName, JobTitleDepartment, IsSupervisor, departmentId)
	values(@JobTitleName, @JobTitleDepartment, @IsSupervisor, @departmentId);
	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spJobTitles_Update]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spJobTitles_Update]
    @id int,
    @JobTitleName nvarchar(50),
    @JobTitleDepartment nvarchar(50),
    @IsSupervisor nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @departmentId int;

    SELECT @departmentId = id
    FROM dbo.Departments
    WHERE DepartmentName = @JobTitleDepartment;

    UPDATE dbo.JobTitles
    SET
        JobTitleName = @JobTitleName,
        JobTitleDepartment = @JobTitleDepartment,
        IsSupervisor = @IsSupervisor,
		departmentId = @departmentId
    WHERE
        Id = @id;


END
GO
/****** Object:  Trigger [dbo].[tJobTitles_Update]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tJobTitles_Update]
ON [dbo].[Departments]
AFTER UPDATE
AS
BEGIN
    UPDATE jt
    SET jt.JobTitleDepartment = i.DepartmentName
    FROM dbo.JobTitles jt
    INNER JOIN deleted d ON jt.departmentId = d.Id
    INNER JOIN inserted i ON jt.departmentId = i.Id;
END;
GO
ALTER TABLE [dbo].[Departments] ENABLE TRIGGER [tJobTitles_Update]
GO
/****** Object:  Trigger [dbo].[tEmployees_Update]    Script Date: 24.07.2023 14:55:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tEmployees_Update]
ON [dbo].[JobTitles]
AFTER UPDATE
AS
BEGIN
    UPDATE e
    SET e.JobTitle = i.JobTitleName
    FROM dbo.Employees e
    INNER JOIN deleted d ON e.jobTitleId = d.Id
    INNER JOIN inserted i ON e.jobTitleId = i.Id;
END;
GO
ALTER TABLE [dbo].[JobTitles] ENABLE TRIGGER [tEmployees_Update]
GO
USE [master]
GO
ALTER DATABASE [EmployeeManagement] SET  READ_WRITE 
GO
