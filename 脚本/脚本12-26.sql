USE [master]
GO
/****** Object:  Database [AgriculturalResearch]    Script Date: 2018-12-26 17:35:25 ******/
CREATE DATABASE [AgriculturalResearch]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AgriculturalResearch', FILENAME = N'F:\项目数据库\农业科研项目\AgriculturalResearch.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AgriculturalResearch_log', FILENAME = N'F:\项目数据库\农业科研项目\AgriculturalResearch_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AgriculturalResearch] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AgriculturalResearch].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AgriculturalResearch] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET ARITHABORT OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AgriculturalResearch] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AgriculturalResearch] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AgriculturalResearch] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AgriculturalResearch] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AgriculturalResearch] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET RECOVERY FULL 
GO
ALTER DATABASE [AgriculturalResearch] SET  MULTI_USER 
GO
ALTER DATABASE [AgriculturalResearch] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AgriculturalResearch] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AgriculturalResearch] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AgriculturalResearch] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AgriculturalResearch', N'ON'
GO
USE [AgriculturalResearch]
GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 2018-12-26 17:35:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Achievements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NULL,
	[AchTitle] [varchar](50) NULL,
	[AchType] [varchar](20) NULL,
	[AchContent] [varchar](500) NULL,
	[AchTime] [datetime] NULL,
	[AchFile] [varchar](50) NULL,
	[FileName] [varchar](50) NULL,
	[AchTel] [varchar](50) NULL,
	[Honor] [varchar](50) NULL,
	[OperTime] [datetime] NULL,
 CONSTRAINT [PK_Achievements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2018-12-26 17:35:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](50) NULL,
	[Pwd] [varchar](20) NULL,
	[Name] [varchar](20) NULL,
	[Tel] [varchar](20) NULL,
	[Role] [varchar](20) NULL,
	[AddTime] [datetime] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpRecord]    Script Date: 2018-12-26 17:35:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[PersonId] [int] NULL,
	[ExpContent] [varchar](250) NULL,
	[ExpTime] [datetime] NULL,
	[UpFile] [varchar](50) NULL,
	[FileName] [varchar](50) NULL,
	[State] [varchar](10) NULL,
 CONSTRAINT [PK_Exprecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemPersonnel]    Script Date: 2018-12-26 17:35:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemPersonnel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NULL,
	[ItemId] [int] NULL,
	[OperTime] [datetime] NULL,
 CONSTRAINT [PK_ItemPersonnel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 2018-12-26 17:35:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[Account] [varchar](20) NULL,
	[Pwd] [varchar](20) NULL,
	[Name] [varchar](20) NULL,
	[Sex] [varchar](20) NULL,
	[Age] [varchar](20) NULL,
	[Tel] [varchar](20) NULL,
	[Title] [varchar](20) NULL,
	[major] [varchar](20) NULL,
	[College] [varchar](20) NULL,
	[RegTime] [datetime] NULL,
	[State] [varchar](10) NULL,
 CONSTRAINT [PK_AgriculturalPerson] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResearchItem]    Script Date: 2018-12-26 17:35:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResearchItem](
	[Id] [int] IDENTITY(201900,1) NOT NULL,
	[PersonId] [int] NULL,
	[ItemName] [varchar](20) NULL,
	[ItemType] [varchar](20) NULL,
	[ItemCompany] [varchar](20) NULL,
	[MajorPerson] [varchar](20) NULL,
	[ItemPerson] [varchar](20) NULL,
	[Tel] [varchar](20) NULL,
	[Funds] [decimal](18, 2) NULL,
	[ExeYear] [int] NULL,
	[UpFile] [varchar](50) NULL,
	[FileName] [varchar](50) NULL,
	[OperTime] [datetime] NULL,
	[Approval] [varchar](300) NULL,
	[ApprovalTime] [datetime] NULL,
	[State] [varchar](10) NULL,
 CONSTRAINT [PK_AgriculturalItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ResearchPaper]    Script Date: 2018-12-26 17:35:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResearchPaper](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NULL,
	[PaperTitle] [varchar](50) NULL,
	[KName] [varchar](50) NULL,
	[KType] [varchar](50) NULL,
	[DanWei] [varchar](50) NULL,
	[OperTime] [datetime] NULL,
	[UpFile] [varchar](50) NULL,
	[FileName] [varchar](50) NULL,
	[State] [varchar](10) NULL,
 CONSTRAINT [PK_ResearchPaper] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Account], [Pwd], [Name], [Tel], [Role], [AddTime]) VALUES (1, N'admin', N'admin', N'张东', N'15260966227', N'管理员', CAST(0x0000A9C000000000 AS DateTime))
INSERT [dbo].[Admin] ([Id], [Account], [Pwd], [Name], [Tel], [Role], [AddTime]) VALUES (2, N'xueqiang', N'123456', N'薛强', N'13620502207', N'管理员', CAST(0x0000A9C00108CF1A AS DateTime))
INSERT [dbo].[Admin] ([Id], [Account], [Pwd], [Name], [Tel], [Role], [AddTime]) VALUES (3, N'xiaoyao', N'123456', N'肖瑶', N'13860626509', N'管理员', CAST(0x0000A9C001092930 AS DateTime))
INSERT [dbo].[Admin] ([Id], [Account], [Pwd], [Name], [Tel], [Role], [AddTime]) VALUES (4, N'zhangxiang', N'123456', N'张翔', N'13860606209', N'管理员', CAST(0x0000A9C00109668A AS DateTime))
INSERT [dbo].[Admin] ([Id], [Account], [Pwd], [Name], [Tel], [Role], [AddTime]) VALUES (5, N'xuemnegyao', N'123456', N'薛梦瑶', N'13620502207', N'管理员', CAST(0x0000A9C00109942A AS DateTime))
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[ExpRecord] ON 

INSERT [dbo].[ExpRecord] ([Id], [ItemId], [PersonId], [ExpContent], [ExpTime], [UpFile], [FileName], [State]) VALUES (3, 201910, 1001, N'杂交育种第一次试验', CAST(0x0000A9C200F09686 AS DateTime), N'/UpFile/63681431747900.txt', N'新建文本文档.txt', N'正常')
INSERT [dbo].[ExpRecord] ([Id], [ItemId], [PersonId], [ExpContent], [ExpTime], [UpFile], [FileName], [State]) VALUES (7, 201910, 1001, N'杂交育种第一次试验', CAST(0x0000A9C200F18548 AS DateTime), N'/UpFile/63681431960986.txt', N'新建文本文档.txt', N'正常')
INSERT [dbo].[ExpRecord] ([Id], [ItemId], [PersonId], [ExpContent], [ExpTime], [UpFile], [FileName], [State]) VALUES (8, 201910, 1001, N'杂交育种第一次试验', CAST(0x0000A9C200F2B08B AS DateTime), N'/UpFile/63681432216355.docx', N'实验记录.docx', N'正常')
SET IDENTITY_INSERT [dbo].[ExpRecord] OFF
SET IDENTITY_INSERT [dbo].[ItemPersonnel] ON 

INSERT [dbo].[ItemPersonnel] ([Id], [PersonId], [ItemId], [OperTime]) VALUES (8, 1001, 201910, CAST(0x0000A9C200F001CE AS DateTime))
INSERT [dbo].[ItemPersonnel] ([Id], [PersonId], [ItemId], [OperTime]) VALUES (9, 1001, 201911, CAST(0x0000A9C200F2A18B AS DateTime))
SET IDENTITY_INSERT [dbo].[ItemPersonnel] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [Account], [Pwd], [Name], [Sex], [Age], [Tel], [Title], [major], [College], [RegTime], [State]) VALUES (1001, N'zhangwei', N'123456', N'张伟', N'男', N'20', N'13860606209', N'教授', N'农业自动化', N'农业科学院', CAST(0x0000A9C000F4AF8F AS DateTime), N'正常')
INSERT [dbo].[Person] ([Id], [Account], [Pwd], [Name], [Sex], [Age], [Tel], [Title], [major], [College], [RegTime], [State]) VALUES (1002, N'xiaoxue', N'123456', N'晓雪', N'女', N'18', N'13860606209', N'讲师', N'自动化', N'农业机械专业', CAST(0x0000A9C000FF948B AS DateTime), N'正常')
INSERT [dbo].[Person] ([Id], [Account], [Pwd], [Name], [Sex], [Age], [Tel], [Title], [major], [College], [RegTime], [State]) VALUES (1003, N'xiaoxie', N'123456', N'小谢', N'男', N'40', N'13860606209', N'教授', N'杂交培育', N'农业科学院', CAST(0x0000A9C000FFC35F AS DateTime), N'正常')
INSERT [dbo].[Person] ([Id], [Account], [Pwd], [Name], [Sex], [Age], [Tel], [Title], [major], [College], [RegTime], [State]) VALUES (1004, N'chendong', N'123456', N'陈懂', N'男', N'18', N'13860606209', N'教授', N'自动化', N'农业专科院', CAST(0x0000A9C001005E96 AS DateTime), N'正常')
INSERT [dbo].[Person] ([Id], [Account], [Pwd], [Name], [Sex], [Age], [Tel], [Title], [major], [College], [RegTime], [State]) VALUES (1005, N'linwan', N'123456', N'林菀', N'女', N'23', N'15260966558', N'教授', N'农业自动化', N'农业科学院', CAST(0x0000A9C0010082D5 AS DateTime), N'正常')
INSERT [dbo].[Person] ([Id], [Account], [Pwd], [Name], [Sex], [Age], [Tel], [Title], [major], [College], [RegTime], [State]) VALUES (1006, N'zhangquan', N'123456', N'张权', N'男', N'45', N'18620500912', N'教授', N'农业自动化', N'农业科学院', CAST(0x0000A9C00100A6C7 AS DateTime), N'正常')
INSERT [dbo].[Person] ([Id], [Account], [Pwd], [Name], [Sex], [Age], [Tel], [Title], [major], [College], [RegTime], [State]) VALUES (1007, N'zhouda', N'123456', N'周达', N'男', N'21', N'152609666542', N'教授', N'种子培育', N'农业工程学院', CAST(0x0000A9C100AA84FF AS DateTime), N'正常')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[ResearchItem] ON 

INSERT [dbo].[ResearchItem] ([Id], [PersonId], [ItemName], [ItemType], [ItemCompany], [MajorPerson], [ItemPerson], [Tel], [Funds], [ExeYear], [UpFile], [FileName], [OperTime], [Approval], [ApprovalTime], [State]) VALUES (201910, 1001, N'杂交玉米', N'国家科技重大专项课题', N'福州农林大学', N'张伟', NULL, N'15260966227', CAST(5000000.00 AS Decimal(18, 2)), 3, N'/UpFile/63681431609627.docx', N'科研计划.docx', CAST(0x0000A9C200EFFD17 AS DateTime), NULL, NULL, N'暂存')
INSERT [dbo].[ResearchItem] ([Id], [PersonId], [ItemName], [ItemType], [ItemCompany], [MajorPerson], [ItemPerson], [Tel], [Funds], [ExeYear], [UpFile], [FileName], [OperTime], [Approval], [ApprovalTime], [State]) VALUES (201911, 1001, N'杂交萝卜', N'国家科技重大专项课题', N'福州农林大学', N'张伟', NULL, N'15260966227', CAST(5000000.00 AS Decimal(18, 2)), 3, N'/UpFile/63681432200738.docx', N'实验记录.docx', CAST(0x0000A9C200F2A140 AS DateTime), NULL, NULL, N'同意')
SET IDENTITY_INSERT [dbo].[ResearchItem] OFF
ALTER TABLE [dbo].[Achievements]  WITH CHECK ADD  CONSTRAINT [FK_Achievements_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Achievements] CHECK CONSTRAINT [FK_Achievements_Person]
GO
ALTER TABLE [dbo].[ExpRecord]  WITH CHECK ADD  CONSTRAINT [FK_ExpRecord_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[ExpRecord] CHECK CONSTRAINT [FK_ExpRecord_Person]
GO
ALTER TABLE [dbo].[ExpRecord]  WITH CHECK ADD  CONSTRAINT [FK_Exprecord_ResearchItem] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ResearchItem] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExpRecord] CHECK CONSTRAINT [FK_Exprecord_ResearchItem]
GO
ALTER TABLE [dbo].[ItemPersonnel]  WITH CHECK ADD  CONSTRAINT [FK_ItemPersonnel_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[ItemPersonnel] CHECK CONSTRAINT [FK_ItemPersonnel_Person]
GO
ALTER TABLE [dbo].[ItemPersonnel]  WITH CHECK ADD  CONSTRAINT [FK_ItemPersonnel_ResearchItem] FOREIGN KEY([ItemId])
REFERENCES [dbo].[ResearchItem] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ItemPersonnel] CHECK CONSTRAINT [FK_ItemPersonnel_ResearchItem]
GO
ALTER TABLE [dbo].[ResearchItem]  WITH CHECK ADD  CONSTRAINT [FK_ResearchItem_ResearchlPerson] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResearchItem] CHECK CONSTRAINT [FK_ResearchItem_ResearchlPerson]
GO
ALTER TABLE [dbo].[ResearchPaper]  WITH CHECK ADD  CONSTRAINT [FK_ResearchPaper_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ResearchPaper] CHECK CONSTRAINT [FK_ResearchPaper_Person]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'专业' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Person', @level2type=N'COLUMN',@level2name=N'major'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刊物名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResearchPaper', @level2type=N'COLUMN',@level2name=N'KName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'刊物类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResearchPaper', @level2type=N'COLUMN',@level2name=N'KType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主办单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ResearchPaper', @level2type=N'COLUMN',@level2name=N'DanWei'
GO
USE [master]
GO
ALTER DATABASE [AgriculturalResearch] SET  READ_WRITE 
GO
