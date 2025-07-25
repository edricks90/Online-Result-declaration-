USE [master]
GO
/****** Object:  Database [ResultDeclarationBoardDatabase_new]    Script Date: 10/29/2013 21:41:11 ******/
CREATE DATABASE [ResultDeclarationBoardDatabase_new] ON  PRIMARY 
( NAME = N'ResultDeclarationBoardDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ResultDeclarationBoardDatabase_new.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ResultDeclarationBoardDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ResultDeclarationBoardDatabase_new_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ResultDeclarationBoardDatabase_new].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET ARITHABORT OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET  DISABLE_BROKER
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET  READ_WRITE
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET RECOVERY FULL
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET  MULTI_USER
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ResultDeclarationBoardDatabase_new] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'ResultDeclarationBoardDatabase_new', N'ON'
GO
USE [ResultDeclarationBoardDatabase_new]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 10/29/2013 21:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[NoID] [varchar](50) NOT NULL,
	[NoTitle] [varchar](50) NULL,
	[NoInfo] [varchar](max) NULL,
	[NoDate] [datetime] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Notification] ([NoID], [NoTitle], [NoInfo], [NoDate]) VALUES (N'Aptech-Info-03', N'Placement in 2013', N'Dear student 100% placement offers in 2013 for other further detail contact with center faculty  ', CAST(0x0000A1B400000000 AS DateTime))
INSERT [dbo].[Notification] ([NoID], [NoTitle], [NoInfo], [NoDate]) VALUES (N'Aptech-Info04', N'Placement In delhi', N'Contact number :8877665544', CAST(0x0000A1B500000000 AS DateTime))
INSERT [dbo].[Notification] ([NoID], [NoTitle], [NoInfo], [NoDate]) VALUES (N'Aptech_INFO01', N'Re-Registration form Available Now', N'Dear Student please contact our acadmey center', CAST(0x0000A15C00000000 AS DateTime))
INSERT [dbo].[Notification] ([NoID], [NoTitle], [NoInfo], [NoDate]) VALUES (N'Aptech_INFO02', N'Tech-NoMind', N'All Student paticipate in techno mind Project', CAST(0x0000A1D400000000 AS DateTime))
/****** Object:  Table [dbo].[ExamMark]    Script Date: 10/29/2013 21:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExamMark](
	[Rollno] [varchar](20) NOT NULL,
	[SubID] [varchar](50) NOT NULL,
	[SemID] [varchar](50) NOT NULL,
	[CurID] [varchar](10) NOT NULL,
	[BranchId] [varchar](50) NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[ExamTimes] [int] NOT NULL,
	[Marks] [float] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateExam] [datetime] NOT NULL,
 CONSTRAINT [PK_ExamMark] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ExamMark] ON
INSERT [dbo].[ExamMark] ([Rollno], [SubID], [SemID], [CurID], [BranchId], [UserName], [ExamTimes], [Marks], [ID], [DateExam]) VALUES (N'Aptech_student4468', N'Subject_Ms-Excel#', N'Sem6', N'gdfg', N'Branch001', N'admin', 1, 82, 1, CAST(0x0000A1B400000000 AS DateTime))
INSERT [dbo].[ExamMark] ([Rollno], [SubID], [SemID], [CurID], [BranchId], [UserName], [ExamTimes], [Marks], [ID], [DateExam]) VALUES (N'Aptech_student4468', N'Subject_Java0056', N'Sem5', N'Cur01', N'Aptech-S.Delhi', N'admin', 1, 56, 2, CAST(0x0000A1C100000000 AS DateTime))
INSERT [dbo].[ExamMark] ([Rollno], [SubID], [SemID], [CurID], [BranchId], [UserName], [ExamTimes], [Marks], [ID], [DateExam]) VALUES (N'Aptech_student4468', N'Subject_Java0057', N'Sem4', N'cur07', N'Aptech-indonesia', N'Pankaj ', 1, 34, 3, CAST(0x0000A1C200000000 AS DateTime))
INSERT [dbo].[ExamMark] ([Rollno], [SubID], [SemID], [CurID], [BranchId], [UserName], [ExamTimes], [Marks], [ID], [DateExam]) VALUES (N'Aptech_student4589', N'Subject_DB.handel', N'Sem6', N'Cur01', N'Aptech-S.Delhi', N'academy', 1, 78, 4, CAST(0x0000A1B300000000 AS DateTime))
INSERT [dbo].[ExamMark] ([Rollno], [SubID], [SemID], [CurID], [BranchId], [UserName], [ExamTimes], [Marks], [ID], [DateExam]) VALUES (N'Aptech_student4569', N'Subject_C++/#rp', N'Sem2', N'cur07', N'Aptech-S.Delhi', N'academy', 1, 88, 5, CAST(0x0000A1B300000000 AS DateTime))
INSERT [dbo].[ExamMark] ([Rollno], [SubID], [SemID], [CurID], [BranchId], [UserName], [ExamTimes], [Marks], [ID], [DateExam]) VALUES (N'Aptech_student4567', N'Subject_Java0055', N'Sem4', N'cur07', N'Aptech-Najiria', N'admin', 2, 67, 6, CAST(0x0000A1C200000000 AS DateTime))
INSERT [dbo].[ExamMark] ([Rollno], [SubID], [SemID], [CurID], [BranchId], [UserName], [ExamTimes], [Marks], [ID], [DateExam]) VALUES (N'Aptech_student4589', N'Subject_Asp.net', N'Sem3', N'cur07', N'Aptech-Mumbai', N'academy', 1, 33, 7, CAST(0x0000A1CF00000000 AS DateTime))
INSERT [dbo].[ExamMark] ([Rollno], [SubID], [SemID], [CurID], [BranchId], [UserName], [ExamTimes], [Marks], [ID], [DateExam]) VALUES (N'Aptech_student4468', N'Subject_Ms-Excel#', N'Sem6', N'gdfg', N'Branch001', N'admin', 1, 97, 8, CAST(0x0000A1B500000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[ExamMark] OFF
/****** Object:  Table [dbo].[Curriculum]    Script Date: 10/29/2013 21:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Curriculum](
	[CurID] [varchar](10) NOT NULL,
	[CurName] [varchar](50) NULL,
	[Period] [varchar](20) NULL,
	[Fee] [int] NULL,
 CONSTRAINT [PK_Curriculum] PRIMARY KEY CLUSTERED 
(
	[CurID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Curriculum] ([CurID], [CurName], [Period], [Fee]) VALUES (N'Cur01', N'B.Sc', N'2', 1000000)
INSERT [dbo].[Curriculum] ([CurID], [CurName], [Period], [Fee]) VALUES (N'Cur012', N'MCA', N'2 Years', 21000)
INSERT [dbo].[Curriculum] ([CurID], [CurName], [Period], [Fee]) VALUES (N'cur07', N'M.Tech', N'2', 1500000)
INSERT [dbo].[Curriculum] ([CurID], [CurName], [Period], [Fee]) VALUES (N'Curri007', N'ACCP Pro', N'3 Years', 1000000)
INSERT [dbo].[Curriculum] ([CurID], [CurName], [Period], [Fee]) VALUES (N'gdfg', N'Short-Term -Course', N'Choice', 600000)
/****** Object:  Table [dbo].[Branch]    Script Date: 10/29/2013 21:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchId] [varchar](50) NOT NULL,
	[BranchName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNo] [varchar](50) NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Branch] ([BranchId], [BranchName], [Address], [Email], [PhoneNo]) VALUES (N'Aptech-indonesia', N'FTP-Indonasia', N'77-J KoKala, New Place', N'Koka@gmail.com', N'9945667788')
INSERT [dbo].[Branch] ([BranchId], [BranchName], [Address], [Email], [PhoneNo]) VALUES (N'Aptech-Mumbai', N'Mumabai ,Andheri', N'K-897 Mumbai', N'Mumbai@gmail.com', N'9988776655')
INSERT [dbo].[Branch] ([BranchId], [BranchName], [Address], [Email], [PhoneNo]) VALUES (N'Aptech-Najiria', N'Branch0067', N'S-789, Najir Place', N'Kaola@gmail.com', N'8877443322')
INSERT [dbo].[Branch] ([BranchId], [BranchName], [Address], [Email], [PhoneNo]) VALUES (N'Aptech-S.Delhi', N'Branch0001', N'A-678, South-Extension', N'South@gmail.com', N'1122334455')
/****** Object:  Table [dbo].[Student]    Script Date: 10/29/2013 21:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Rollno] [varchar](20) NOT NULL,
	[StName] [varchar](30) NULL,
	[Gender] [varchar](10) NULL,
	[Address] [varchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Rollno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Student] ([Rollno], [StName], [Gender], [Address], [Phone], [Email]) VALUES (N'Aptech_student4468', N'Pankuri Singh', N'Female', N'45, D-II Gaziabad enclave                    ', N'6677994435', N'Pankuri@gmail.com')
INSERT [dbo].[Student] ([Rollno], [StName], [Gender], [Address], [Phone], [Email]) VALUES (N'Aptech_student4522', N'Suraj Roy', N'Male', N'AB-787, Sava Nagar', N'5566778855', N'Suraj@gmail.com')
INSERT [dbo].[Student] ([Rollno], [StName], [Gender], [Address], [Phone], [Email]) VALUES (N'Aptech_student4567', N'Vinay', N'Male', N'V-90 Hauz Khas-II                    ', N'8877665544', N'Vinnay@gmail.com')
INSERT [dbo].[Student] ([Rollno], [StName], [Gender], [Address], [Phone], [Email]) VALUES (N'Aptech_student4569', N'Piyush', N'Male', N'F-90, Lajpat Nagar', N'9988776689', N'piyush@gmail.com')
INSERT [dbo].[Student] ([Rollno], [StName], [Gender], [Address], [Phone], [Email]) VALUES (N'Aptech_student4589', N'Trrot', N'Male', N'B-190, Southextension', N'5566778855', N'troth@gmail.com')
INSERT [dbo].[Student] ([Rollno], [StName], [Gender], [Address], [Phone], [Email]) VALUES (N'Aptech_student4590', N'Pankhari', N'Female', N'B-78, Kidwai Nagar', N'5566778855', N'Pankari@gmail.com')
/****** Object:  Table [dbo].[Semester]    Script Date: 10/29/2013 21:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[SemID] [varchar](50) NOT NULL,
	[CurID] [varchar](10) NOT NULL,
	[SemName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[SemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Semester] ([SemID], [CurID], [SemName]) VALUES (N'Sem1', N'Cur01', N'Semester-I')
INSERT [dbo].[Semester] ([SemID], [CurID], [SemName]) VALUES (N'Sem2', N'Cur01', N'Semester-II')
INSERT [dbo].[Semester] ([SemID], [CurID], [SemName]) VALUES (N'Sem3', N'cur07', N'Semester-III')
INSERT [dbo].[Semester] ([SemID], [CurID], [SemName]) VALUES (N'Sem4', N'Cur01', N'Semester-IV')
INSERT [dbo].[Semester] ([SemID], [CurID], [SemName]) VALUES (N'Sem5', N'Curri007', N'Semseter-V')
INSERT [dbo].[Semester] ([SemID], [CurID], [SemName]) VALUES (N'Sem6', N'Cur012', N'Semester-VI')
/****** Object:  Table [dbo].[Users]    Script Date: 10/29/2013 21:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [varchar](20) NOT NULL,
	[Password] [varchar](100) NULL,
	[FullName] [varchar](50) NULL,
	[Address] [varchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[BranchId] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Gender] [varchar](10) NULL,
	[Question] [varchar](50) NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Users] ([UserName], [Password], [FullName], [Address], [Phone], [BranchId], [Email], [Gender], [Question], [Status]) VALUES (N'academy', N'6297796e54283fdfb3589d492a929641', N'Sarabjit Singh', N'A-678, South-Extension', N'6575675675', N'Aptech-S.Delhi', N'Sarab@gmail.com', N'Male', N'Yes', N'Academic')
INSERT [dbo].[Users] ([UserName], [Password], [FullName], [Address], [Phone], [BranchId], [Email], [Gender], [Question], [Status]) VALUES (N'admin', N'6297796e54283fdfb3589d492a929641', N'Rakesh chander', N'C-176, Kidwai Nagar-23', N'9988776655', N'Aptech-Mumbai', N'Rakesh@gmail.com', N'Male', N'Yes', N'Admin')
/****** Object:  Table [dbo].[Subject]    Script Date: 10/29/2013 21:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[SubID] [varchar](50) NOT NULL,
	[SemID] [varchar](50) NULL,
	[SubName] [varchar](20) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Subject] ([SubID], [SemID], [SubName]) VALUES (N'Subject_Asp.net', N'Sem4', N'Asp.net')
INSERT [dbo].[Subject] ([SubID], [SemID], [SubName]) VALUES (N'Subject_C++/#rp', N'Sem2', N'C++/CSharp')
INSERT [dbo].[Subject] ([SubID], [SemID], [SubName]) VALUES (N'Subject_DB.handel', N'Sem6', N'Database Handling')
INSERT [dbo].[Subject] ([SubID], [SemID], [SubName]) VALUES (N'Subject_Java0055', N'Sem3', N'Core Java')
INSERT [dbo].[Subject] ([SubID], [SemID], [SubName]) VALUES (N'Subject_Java0056', N'Sem5', N'Advance Java')
INSERT [dbo].[Subject] ([SubID], [SemID], [SubName]) VALUES (N'Subject_Ms-Excel#', N'Sem1', N'Microsoft Office')
/****** Object:  Table [dbo].[Schedules]    Script Date: 10/29/2013 21:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedules](
	[ScheID] [varchar](50) NOT NULL,
	[ScheName] [varchar](100) NOT NULL,
	[SubID] [varchar](50) NOT NULL,
	[Fee] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DateExam] [datetime] NOT NULL,
 CONSTRAINT [PK_Schedules] PRIMARY KEY CLUSTERED 
(
	[ScheID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Schedules] ([ScheID], [ScheName], [SubID], [Fee], [StartDate], [EndDate], [DateExam]) VALUES (N'Accp Pro_89', N'BCA', N'Subject_Asp.net', 140000, CAST(0x0000A1AD00000000 AS DateTime), CAST(0x0000A1C100000000 AS DateTime), CAST(0x0000A1B100000000 AS DateTime))
INSERT [dbo].[Schedules] ([ScheID], [ScheName], [SubID], [Fee], [StartDate], [EndDate], [DateExam]) VALUES (N'Accp Pro_90', N'Ms-Excel', N'Subject_Ms-Excel#', 2000, CAST(0x0000A1B400000000 AS DateTime), CAST(0x0000A1BB00000000 AS DateTime), CAST(0x0000A1DE00000000 AS DateTime))
/****** Object:  Table [dbo].[ReRegistration]    Script Date: 10/29/2013 21:41:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReRegistration](
	[RegID] [varchar](10) NOT NULL,
	[Rollno] [varchar](20) NOT NULL,
	[ScheID] [varchar](50) NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_ReRegistration] PRIMARY KEY CLUSTERED 
(
	[RegID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ReRegistration] ([RegID], [Rollno], [ScheID], [Status], [Date]) VALUES (N'Accp0023', N'Aptech_student4468', N'Accp Pro_89', N'Re-evaluation', CAST(0x0000A1AC00000000 AS DateTime))
INSERT [dbo].[ReRegistration] ([RegID], [Rollno], [ScheID], [Status], [Date]) VALUES (N'Accp0024', N'Aptech_student4468', N'Accp Pro_89', N'Re-evaluation', CAST(0x0000A1B100000000 AS DateTime))
/****** Object:  ForeignKey [FK_Semester_Curriculum]    Script Date: 10/29/2013 21:41:14 ******/
ALTER TABLE [dbo].[Semester]  WITH CHECK ADD  CONSTRAINT [FK_Semester_Curriculum] FOREIGN KEY([CurID])
REFERENCES [dbo].[Curriculum] ([CurID])
GO
ALTER TABLE [dbo].[Semester] CHECK CONSTRAINT [FK_Semester_Curriculum]
GO
/****** Object:  ForeignKey [FK_Subject_Semester]    Script Date: 10/29/2013 21:41:14 ******/
ALTER TABLE [dbo].[Semester]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Semester] FOREIGN KEY([SemID])
REFERENCES [dbo].[Semester] ([SemID])
GO
ALTER TABLE [dbo].[Semester] CHECK CONSTRAINT [FK_Subject_Semester]
GO
/****** Object:  ForeignKey [FK_Users_Branch]    Script Date: 10/29/2013 21:41:14 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Branch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Branch]
GO
/****** Object:  ForeignKey [FK_Subject_Semesters]    Script Date: 10/29/2013 21:41:14 ******/
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Semesters] FOREIGN KEY([SemID])
REFERENCES [dbo].[Semester] ([SemID])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Semesters]
GO
/****** Object:  ForeignKey [FK_Schedules_Subject]    Script Date: 10/29/2013 21:41:14 ******/
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_Schedules_Subject] FOREIGN KEY([SubID])
REFERENCES [dbo].[Subject] ([SubID])
GO
ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_Schedules_Subject]
GO
/****** Object:  ForeignKey [FK_ReRegistration_Schedules]    Script Date: 10/29/2013 21:41:14 ******/
ALTER TABLE [dbo].[ReRegistration]  WITH CHECK ADD  CONSTRAINT [FK_ReRegistration_Schedules] FOREIGN KEY([ScheID])
REFERENCES [dbo].[Schedules] ([ScheID])
GO
ALTER TABLE [dbo].[ReRegistration] CHECK CONSTRAINT [FK_ReRegistration_Schedules]
GO
/****** Object:  ForeignKey [FK_ReRegistration_Student]    Script Date: 10/29/2013 21:41:14 ******/
ALTER TABLE [dbo].[ReRegistration]  WITH CHECK ADD  CONSTRAINT [FK_ReRegistration_Student] FOREIGN KEY([Rollno])
REFERENCES [dbo].[Student] ([Rollno])
GO
ALTER TABLE [dbo].[ReRegistration] CHECK CONSTRAINT [FK_ReRegistration_Student]
GO
