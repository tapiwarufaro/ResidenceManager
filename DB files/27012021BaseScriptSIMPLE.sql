USE [master]
GO
/****** Object:  Database [ResidenceManager]    Script Date: 27/1/2021 09:14:01 ******/
CREATE DATABASE [ResidenceManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ResidenceManager', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ResidenceManager.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ResidenceManager_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ResidenceManager_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ResidenceManager] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ResidenceManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ResidenceManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ResidenceManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ResidenceManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ResidenceManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ResidenceManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [ResidenceManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ResidenceManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ResidenceManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ResidenceManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ResidenceManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ResidenceManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ResidenceManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ResidenceManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ResidenceManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ResidenceManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ResidenceManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ResidenceManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ResidenceManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ResidenceManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ResidenceManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ResidenceManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ResidenceManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ResidenceManager] SET RECOVERY FULL 
GO
ALTER DATABASE [ResidenceManager] SET  MULTI_USER 
GO
ALTER DATABASE [ResidenceManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ResidenceManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ResidenceManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ResidenceManager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ResidenceManager] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ResidenceManager', N'ON'
GO
USE [ResidenceManager]
GO
/****** Object:  Table [dbo].[Apartment]    Script Date: 27/1/2021 09:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apartment](
	[ApartmentID] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentStatusID] [int] NULL,
	[Unit] [int] NULL,
	[Side] [varchar](10) NULL,
 CONSTRAINT [PK_Apartment] PRIMARY KEY CLUSTERED 
(
	[ApartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentManager]    Script Date: 27/1/2021 09:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentManager](
	[ApartmentManagerID] [int] IDENTITY(1,1) NOT NULL,
	[ManagerID] [int] NULL,
	[ApartmentID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_ApartmentManager] PRIMARY KEY CLUSTERED 
(
	[ApartmentManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentStatus]    Script Date: 27/1/2021 09:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentStatus](
	[ApartmentStatusID] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentStatusName] [varchar](20) NULL,
 CONSTRAINT [PK_ApartmentStatus] PRIMARY KEY CLUSTERED 
(
	[ApartmentStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApartmentTenant]    Script Date: 27/1/2021 09:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentTenant](
	[ApartmentTenantID] [int] IDENTITY(1,1) NOT NULL,
	[ApartmentID] [int] NULL,
	[TenantID] [int] NULL,
	[DateIN] [datetime] NULL,
	[DateOUT] [datetime] NULL,
 CONSTRAINT [PK_ApartmentTenant] PRIMARY KEY CLUSTERED 
(
	[ApartmentTenantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 27/1/2021 09:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[ManagerID] [int] IDENTITY(1,1) NOT NULL,
	[ManagerName] [varchar](50) NULL,
	[ManagerTelephone] [varchar](10) NULL,
	[ManagerEmail] [varchar](50) NULL,
	[ManagerTypeID] [int] NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManagerType]    Script Date: 27/1/2021 09:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManagerType](
	[ManagerTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ManagerTypeName] [varchar](20) NULL,
 CONSTRAINT [PK_ManagerType] PRIMARY KEY CLUSTERED 
(
	[ManagerTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 27/1/2021 09:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[TenantID] [int] IDENTITY(1,1) NOT NULL,
	[TenantName] [varchar](50) NULL,
	[TenantSurname] [varchar](50) NULL,
	[TenantEmail] [varchar](50) NULL,
	[TenantDoB] [datetime] NULL,
	[Gender] [varchar](10) NULL,
	[TenantPhone] [varchar](10) NULL,
	[GuardianName] [varchar](50) NULL,
	[GuardianPhone] [varchar](10) NULL,
	[TenantStatusID] [int] NULL,
	[LeaseStart] [datetime] NULL,
	[LeaseEnd] [datetime] NULL,
 CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED 
(
	[TenantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TenantStatus]    Script Date: 27/1/2021 09:14:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenantStatus](
	[TenantStatusID] [int] IDENTITY(1,1) NOT NULL,
	[TenantStatusName] [varchar](20) NULL,
 CONSTRAINT [PK_TenantStatus] PRIMARY KEY CLUSTERED 
(
	[TenantStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Apartment]  WITH CHECK ADD  CONSTRAINT [FK_Apartment_ApartmentStatus] FOREIGN KEY([ApartmentStatusID])
REFERENCES [dbo].[ApartmentStatus] ([ApartmentStatusID])
GO
ALTER TABLE [dbo].[Apartment] CHECK CONSTRAINT [FK_Apartment_ApartmentStatus]
GO
ALTER TABLE [dbo].[ApartmentManager]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentManager_Apartment] FOREIGN KEY([ApartmentID])
REFERENCES [dbo].[Apartment] ([ApartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApartmentManager] CHECK CONSTRAINT [FK_ApartmentManager_Apartment]
GO
ALTER TABLE [dbo].[ApartmentManager]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentManager_Manager] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Manager] ([ManagerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApartmentManager] CHECK CONSTRAINT [FK_ApartmentManager_Manager]
GO
ALTER TABLE [dbo].[ApartmentTenant]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentTenant_Apartment] FOREIGN KEY([ApartmentID])
REFERENCES [dbo].[Apartment] ([ApartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApartmentTenant] CHECK CONSTRAINT [FK_ApartmentTenant_Apartment]
GO
ALTER TABLE [dbo].[ApartmentTenant]  WITH CHECK ADD  CONSTRAINT [FK_ApartmentTenant_Tenant] FOREIGN KEY([TenantID])
REFERENCES [dbo].[Tenant] ([TenantID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApartmentTenant] CHECK CONSTRAINT [FK_ApartmentTenant_Tenant]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_ManagerType] FOREIGN KEY([ManagerTypeID])
REFERENCES [dbo].[ManagerType] ([ManagerTypeID])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_ManagerType]
GO
ALTER TABLE [dbo].[Tenant]  WITH CHECK ADD  CONSTRAINT [FK_Tenant_TenantStatus] FOREIGN KEY([TenantStatusID])
REFERENCES [dbo].[TenantStatus] ([TenantStatusID])
GO
ALTER TABLE [dbo].[Tenant] CHECK CONSTRAINT [FK_Tenant_TenantStatus]
GO
USE [master]
GO
ALTER DATABASE [ResidenceManager] SET  READ_WRITE 
GO
