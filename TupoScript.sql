USE [master]
GO
/****** Object:  Database [LibraryBD]    Script Date: 10.04.2025 20:06:03 ******/
CREATE DATABASE [LibraryBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryBD_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LibraryBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryBD_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LibraryBD.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibraryBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryBD] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LibraryBD] SET QUERY_STORE = OFF
GO
USE [LibraryBD]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 10.04.2025 20:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] NOT NULL,
	[Title] [varchar](255) NULL,
	[Author] [varchar](100) NULL,
	[Genre] [varchar](100) NULL,
	[YearPubliched] [int] NULL,
	[AvailavilityStatus] [bit] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 10.04.2025 20:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarian](
	[LibrarianID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NULL,
	[Login] [varchar](255) NULL,
	[Password] [varchar](255) NULL,
 CONSTRAINT [PK_Librarian] PRIMARY KEY CLUSTERED 
(
	[LibrarianID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 10.04.2025 20:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[ReaderID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NULL,
	[BirthDate] [date] NULL,
	[Adress] [varchar](255) NULL,
	[Phone] [varchar](100) NULL,
	[PenaltyAmount] [money] NULL,
 CONSTRAINT [PK_Reader] PRIMARY KEY CLUSTERED 
(
	[ReaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 10.04.2025 20:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[RentalID] [int] NOT NULL,
	[BookID] [int] NOT NULL,
	[ReaderID] [int] NOT NULL,
	[LibrarianID] [int] IDENTITY(1,1) NOT NULL,
	[LoanDate] [date] NULL,
	[ReturnDadte] [date] NULL,
	[ReturnStatus] [int] NULL,
 CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalOfReader]    Script Date: 10.04.2025 20:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalOfReader](
	[RentalID] [int] NOT NULL,
	[ReaderID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_RentalOfReader] PRIMARY KEY CLUSTERED 
(
	[RentalID] ASC,
	[ReaderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 10.04.2025 20:06:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[TransactionID] [int] NOT NULL,
	[RentalID] [int] NOT NULL,
	[LibrarianID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [date] NULL,
	[OperarionType] [bit] NULL,
	[Amount] [money] NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (603, N'Death Note', N'Tsugumi Ohba', N'Manga', 2003, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (604, N'Perfume: The Story of a Murderer', N'Patrick Suskind', N'Horror', 1985, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (605, N'The Shining', N'Stephen King', N'Horror', 1977, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (606, N'World War Z', N'Max Brooks', N'Horror', 2006, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (607, N'Bird Box', N'Josh Malerman', N'Horror', 2014, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (608, N'World War Z', N'Max Brooks', N'Horror', 2006, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (609, N'Hell House', N'Richard Matheson', N'Horror', 1971, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (610, N'Tokyo Ghoul', N'Sui Ishida', N'Manga', 2011, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (611, N'Berserk', N'Kentaro Miura', N'Manga', 1989, 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (612, N'Attack on Titan', N'Hajime Isayama', N'Manga', 2009, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (613, N'Something Wicked This Way Comes', N'Ray Bradbury', N'Horror', 1962, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (614, N'Tomie', N'Junji Ito', N'Manga', 1987, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (615, N'Uzumaki', N'Junji Ito', N'Manga', 1998, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (616, N'House of Leaves', N'Mark Z. Danielewski', N'Horror', 2000, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (617, N'It', N'Stephen King', N'Horror', 1986, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (618, N'The Shining', N'Stephen King', N'Horror', 1977, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (619, N'The Haunting of Hill House', N'Shirley Jackson', N'Horror', 1959, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (620, N'Parasyte', N'Hitoshi Iwaaki', N'Manga', 1988, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (621, N'Attack on Titan', N'Hajime Isayama', N'Manga', 2009, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (622, N'It', N'Stephen King', N'Horror', 1986, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (623, N'Death Note', N'Tsugumi Ohba', N'Manga', 2003, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (624, N'Bird Box', N'Josh Malerman', N'Horror', 2014, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (625, N'Berserk', N'Kentaro Miura', N'Manga', 1989, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (626, N'The Haunting of Hill House', N'Shirley Jackson', N'Horror', 1959, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (627, N'The Pledge', N'Friedrich Durrenmatt', N'Horror', 1958, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (628, N'Parasyte', N'Hitoshi Iwaaki', N'Manga', 1988, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (629, N'Tokyo Ghoul', N'Sui Ishida', N'Manga', 2011, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (630, N'The Pledge', N'Friedrich Durrenmatt', N'Horror', 1958, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (631, N'House of Leaves', N'Mark Z. Danielewski', N'Horror', 2000, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (632, N'Something Wicked This Way Comes', N'Ray Bradbury', N'Horror', 1962, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (633, N'Tomie', N'Junji Ito', N'Manga', 1987, 0)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (634, N'Hell House', N'Richard Matheson', N'Horror', 1971, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (635, N'Perfume: The Story of a Murderer', N'Patrick Suskind', N'Horror', 1985, 1)
INSERT [dbo].[Book] ([BookID], [Title], [Author], [Genre], [YearPubliched], [AvailavilityStatus]) VALUES (636, N'Uzumaki', N'Junji Ito', N'Manga', 1998, 1)
GO
SET IDENTITY_INSERT [dbo].[Librarian] ON 

INSERT [dbo].[Librarian] ([LibrarianID], [FullName], [Login], [Password]) VALUES (1, N'Ivanov Ivan', N'89001234567', N'ivanov@example.com')
INSERT [dbo].[Librarian] ([LibrarianID], [FullName], [Login], [Password]) VALUES (2, N'Petrov Gleb', N'89007654321', N'petrov@example.com')
INSERT [dbo].[Librarian] ([LibrarianID], [FullName], [Login], [Password]) VALUES (3, N'Sidorova Milana', N'89009876543', N'sidorova@example.com')
INSERT [dbo].[Librarian] ([LibrarianID], [FullName], [Login], [Password]) VALUES (4, N'Jiorno Jotaro', N'89003456789', N'jojo@example.com')
INSERT [dbo].[Librarian] ([LibrarianID], [FullName], [Login], [Password]) VALUES (5, N'Smirnov Hariton', N'89004567890', N'smirnov@example.com')
SET IDENTITY_INSERT [dbo].[Librarian] OFF
GO
SET IDENTITY_INSERT [dbo].[Reader] ON 

INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (1, N'Amy Cooley', CAST(N'1952-09-05' AS Date), N'195 Colleen Ford Suite 140, North Kayla, OH 66833', N'357.610.1144x27888', 3615.9400)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (2, N'Terry Gentry', CAST(N'1997-10-31' AS Date), N'479 Peters Isle, South Chelseaburgh, IL 62987', N'+1-103-051-8417x33867', 2824.0600)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (3, N'Antonio Hogan', CAST(N'1949-04-30' AS Date), N'05019 Scott Extension Apt. 867, Lake Erik, GA 13771', N'1655375708', 3006.9300)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (4, N'Brian Smith', CAST(N'1993-03-12' AS Date), N'PSC 1776, Box 8132, APO AA 56898', N'873-533-9050x02893', 4375.6800)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (5, N'Sherry Allison', CAST(N'1972-02-21' AS Date), N'Unit 8977 Box 2425, DPO AE 64513', N'9326958159', 606.1100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (6, N'Kelli Price', CAST(N'2000-05-25' AS Date), N'Unit 9274 Box 6734, DPO AE 31579', N'792-366-5851', 86.3500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (7, N'Lori Jackson', CAST(N'1946-06-21' AS Date), N'23339 Bass Curve Suite 916, Davidton, TN 58957', N'(352)808-6170', 591.0600)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (8, N'Eric Castro', CAST(N'1977-02-18' AS Date), N'099 Colin Flat, Craigshire, DC 03744', N'570.546.7015', 2658.9700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (9, N'Traci Arnold', CAST(N'1998-12-08' AS Date), N'4840 Barrett Dale, Hernandezshire, AR 59001', N'854.817.2500', 4795.4700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (10, N'Jill Taylor', CAST(N'1973-08-22' AS Date), N'5704 Brandon Locks Apt. 772, North Kyletown, SC 31557', N'864.600.3115x875', 2806.6300)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (11, N'Jessica Flores', CAST(N'1967-02-12' AS Date), N'719 Black Burg, Lake Bryanland, WY 17207', N'+1-594-443-2203x789', 2933.3300)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (12, N'Valerie Boone', CAST(N'1987-08-21' AS Date), N'99930 Andrea Mews Suite 006, Larsonburgh, OR 17613', N'937-761-9724', 3898.2300)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (13, N'Sarah Castro', CAST(N'1975-05-09' AS Date), N'189 Debra Villages Apt. 459, Amandabury, NJ 32493', N'6038358380', 797.1500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (14, N'Joshua Kirk', CAST(N'1977-09-11' AS Date), N'779 Morgan Turnpike, Robertsborough, MI 85385', N'+1-876-728-7911x08082', 3477.8200)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (15, N'Andrea Palmer', CAST(N'2005-10-05' AS Date), N'9022 Sharon Knoll Apt. 524, New Dillon, OR 29653', N'(421)046-5821x2534', 105.3600)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (16, N'Angela Perry', CAST(N'2005-07-08' AS Date), N'7085 Christopher Stream Suite 053, Hernandezberg, DC 89923', N'(640)672-4808', 4120.5100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (17, N'Michael Reyes', CAST(N'1965-09-07' AS Date), N'77256 Peters Extensions Suite 321, Lake Danielle, CO 57985', N'591.097.4575', 278.5900)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (18, N'Devin Elliott', CAST(N'1969-10-23' AS Date), N'9340 Martinez Road Suite 342, Kyleport, NV 09580', N'001-143-219-2997x253', 4287.0700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (19, N'Michael Martin', CAST(N'1955-12-25' AS Date), N'6899 Joseph Vista Suite 086, Port Krista, DC 41444', N'001-525-224-1980x9596', 60.9200)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (20, N'Kim Wagner', CAST(N'1999-04-06' AS Date), N'1624 Young Burgs, South Aaronchester, LA 24064', N'349-392-5225x52270', 2372.3700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (21, N'Richard Mcclain', CAST(N'2006-11-26' AS Date), N'922 Jacob Row Apt. 560, West Elizabethstad, SD 73652', N'(422)383-2023', 2804.9000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (22, N'Kayla Keller', CAST(N'1972-03-07' AS Date), N'72691 Haley Junction Suite 759, Chapmanmouth, TX 30100', N'001-095-328-2356x193', 44.3500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (23, N'Tammy Brown', CAST(N'1985-03-09' AS Date), N'7687 Buchanan Walk Suite 549, Tinatown, TX 71032', N'365.862.7933', 200.9100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (24, N'Ross Smith', CAST(N'2000-05-21' AS Date), N'741 Martin Summit, New Kimberly, WV 89924', N'124-913-2593x139', 3134.8800)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (25, N'Edward Thomas', CAST(N'2005-02-20' AS Date), N'5641 Adams Vista, East Richardview, WV 34067', N'001-481-981-8337', 3987.7300)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (26, N'Kimberly Howell', CAST(N'1946-08-24' AS Date), N'91644 William Falls, North Dannyburgh, VT 71236', N'845.309.6951x6616', 1979.9600)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (27, N'Teresa Glenn', CAST(N'1966-01-19' AS Date), N'03442 Michael Forges, Sabrinachester, FL 09713', N'0953414366', 2249.9100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (28, N'Brandon Ortiz', CAST(N'1979-09-29' AS Date), N'PSC 1543, Box 8938, APO AP 27668', N'001-218-757-4568x5069', 4806.5200)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (29, N'Michael Goodwin', CAST(N'1945-02-11' AS Date), N'66455 Ortiz Keys, Brownbury, SC 51259', N'(924)637-1451', 4238.5400)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (30, N'Cynthia Evans', CAST(N'1998-06-10' AS Date), N'429 Gutierrez Bypass Suite 077, Lake Christopherside, MD 76369', N'116-479-1008', 4451.2700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (31, N'Christopher Sanders', CAST(N'1972-03-17' AS Date), N'10564 Marshall Springs, Youngshire, OR 61226', N'(977)905-3517', 2064.7500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (32, N'Douglas Conway', CAST(N'1963-11-15' AS Date), N'85452 Charles Fort, Ryanton, OR 45984', N'+1-084-925-5767', 2749.7200)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (33, N'Katherine Leon', CAST(N'1985-04-29' AS Date), N'1793 Swanson Mountains Apt. 525, South Jason, NV 84678', N'491.859.8653x63816', 3986.8700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (34, N'Julie Mcgee', CAST(N'1981-04-14' AS Date), N'7315 Stuart Coves, Powellhaven, AZ 55548', N'(485)510-8851x6873', 2437.8800)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (35, N'Kristi Gill', CAST(N'1970-12-09' AS Date), N'4170 Martinez Centers Apt. 655, West Jessicafort, OK 57597', N'001-943-182-5273x7879', 1445.2600)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (36, N'Melissa Barron', CAST(N'1944-07-27' AS Date), N'8103 Victoria Fort, West Kevinmouth, NJ 40882', N'001-216-979-1504x213', 2838.2100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (37, N'William Ramos', CAST(N'1962-09-09' AS Date), N'USNS Shields, FPO AA 86242', N'4194455112', 4376.5000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (38, N'Tiffany Stokes', CAST(N'1969-07-12' AS Date), N'064 Ronald Causeway Suite 130, New John, MT 26592', N'405.996.6168x1940', 1005.7400)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (39, N'Joshua Krause', CAST(N'1965-02-24' AS Date), N'299 Frederick Ferry, New Kristen, VT 20620', N'+1-804-931-4919x5555', 3946.9000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (40, N'Alexander Gutierrez', CAST(N'1964-10-21' AS Date), N'3646 Campbell Circle Suite 984, Stokesberg, DE 87033', N'731-868-5781x01341', 836.5100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (41, N'Stephanie Walker', CAST(N'1947-10-02' AS Date), N'PSC 0265, Box 8380, APO AA 86607', N'832.849.2771', 3278.0800)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (42, N'Mathew Collins', CAST(N'1984-09-28' AS Date), N'89769 Potts Ridge, South Monica, ND 39071', N'586.231.5099', 4346.7100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (43, N'David Wilson', CAST(N'1948-02-27' AS Date), N'971 Edwards Corners Apt. 667, Port Jamesview, AR 39715', N'001-405-341-2064x4688', 282.8700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (44, N'Tina Fisher', CAST(N'1969-01-14' AS Date), N'804 Crystal Extension, Port Jerry, CT 04636', N'+1-927-171-2961x780', 4088.2100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (45, N'James Russell', CAST(N'1992-11-11' AS Date), N'175 Janet Mews, Russomouth, TX 31532', N'099-137-4093x0250', 4915.0000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (46, N'Joseph Stanton', CAST(N'1987-11-25' AS Date), N'325 Lisa Loop Suite 118, Anneview, CT 82633', N'705.882.6451x68563', 1257.0800)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (47, N'Anthony Lozano', CAST(N'1975-10-03' AS Date), N'4045 Turner Throughway, West Donna, MA 80402', N'907-242-7196x788', 2605.8800)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (48, N'Jessica Shields', CAST(N'1989-07-06' AS Date), N'605 Myers Ridges, Higginsberg, CA 73230', N'949.801.9596x5060', 844.3200)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (49, N'Jordan Campbell', CAST(N'2001-07-01' AS Date), N'3014 Sarah Oval Apt. 950, Haroldside, WA 56125', N'929-001-5944', 2314.6000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (50, N'Michael Deleon', CAST(N'2000-05-03' AS Date), N'5094 Bell Village, Martintown, FL 70764', N'001-923-585-3826x62455', 683.1000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (51, N'Jacob Curtis', CAST(N'1990-07-26' AS Date), N'Unit 0628 Box 8164, DPO AA 63585', N'001-207-888-2652x90503', 2734.5000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (52, N'Sarah Frazier', CAST(N'1952-05-12' AS Date), N'42540 Briana Villages Apt. 961, Garyton, OH 31503', N'095.463.3386x05943', 3046.7000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (53, N'Joseph Martin MD', CAST(N'1948-05-19' AS Date), N'04532 Howard Rue Suite 342, Brownton, NY 45297', N'(008)468-3694x127', 2973.3100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (54, N'Melanie Schmidt', CAST(N'1957-09-14' AS Date), N'76829 Tiffany Island, Theresashire, MS 25314', N'(198)937-1671x0570', 863.4800)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (55, N'Karen Steele', CAST(N'1986-12-11' AS Date), N'312 Anderson Union Apt. 517, East Brookechester, MS 13046', N'001-845-477-6313x57658', 4002.7300)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (56, N'Charles Wright MD', CAST(N'2002-10-15' AS Date), N'5864 Russell Drives, North Samanthaberg, GA 70896', N'427.591.3413', 2626.7600)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (57, N'Allison Trujillo', CAST(N'1949-08-30' AS Date), N'94626 Barber Ways, Lake Summerburgh, MO 85787', N'052.231.8435x99323', 964.0900)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (58, N'Michael Fields', CAST(N'2006-10-30' AS Date), N'05260 Austin Course, South Patrick, IA 78397', N'(308)076-8202', 553.3900)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (59, N'Timothy Aguirre', CAST(N'1957-03-12' AS Date), N'1626 Richard Ville, Port Paulchester, DE 84835', N'269-433-6867', 1727.6000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (60, N'Matthew Edwards', CAST(N'1980-07-14' AS Date), N'9048 Daniel Streets Apt. 637, Pamelahaven, SD 29887', N'210.099.2981', 4941.7500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (61, N'Justin Maldonado', CAST(N'1967-07-01' AS Date), N'70241 Theresa Island, Dominicton, NM 88304', N'621.093.8813x62169', 2246.7100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (62, N'Wayne Woods', CAST(N'1945-08-21' AS Date), N'95990 Howell Harbor Apt. 974, South Danielside, CT 38876', N'151.013.6303', 2432.0000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (63, N'Steven Diaz', CAST(N'1992-05-26' AS Date), N'51986 Tasha Square Apt. 662, North Brenda, DC 67135', N'3161979877', 4343.7300)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (64, N'Kathleen Atkinson', CAST(N'1964-08-09' AS Date), N'3269 Joseph Place, Ryanview, SD 36035', N'+1-749-160-3570', 1266.7400)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (65, N'Raymond Conrad', CAST(N'1975-05-08' AS Date), N'21458 Rollins Neck, Kingport, AK 42210', N'822-085-9238', 1356.3700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (66, N'Julie Bowman', CAST(N'1949-06-07' AS Date), N'381 Green Creek Apt. 532, East Melissaberg, CA 83768', N'535.999.6127x17854', 809.7500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (67, N'Courtney Delacruz', CAST(N'1965-04-09' AS Date), N'17813 Douglas Ridge Suite 922, Joshuafort, CT 70975', N'071-577-0958x71733', 1593.9400)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (68, N'Alex Huffman', CAST(N'1973-09-01' AS Date), N'050 Moran Isle, Jasonville, SC 85408', N'001-797-734-3152x87401', 1171.4500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (69, N'Clinton Warner', CAST(N'1967-05-28' AS Date), N'2027 White Prairie Apt. 670, Rasmussenmouth, KY 54212', N'(567)894-0615', 135.5900)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (70, N'Ashley Bird', CAST(N'1963-11-02' AS Date), N'5504 Gentry Groves Suite 415, New Eric, OH 05239', N'001-481-028-0261x351', 416.8200)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (71, N'Christine Castillo', CAST(N'2003-09-23' AS Date), N'80398 Julie Station Apt. 556, Denisefurt, AZ 64747', N'087.498.5499x131', 340.3200)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (72, N'Jennifer Becker', CAST(N'1970-12-09' AS Date), N'0219 Kirk Lock Apt. 348, Port Lawrencebury, MS 55654', N'(905)498-9780x543', 4950.6500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (73, N'Meghan Thomas', CAST(N'1976-06-16' AS Date), N'062 Thompson Neck Apt. 665, Catherinefurt, CA 42788', N'(833)610-6944', 3082.3900)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (74, N'Julia Gonzalez', CAST(N'2001-01-15' AS Date), N'9907 Ashley Stravenue Apt. 796, Codyhaven, DC 69905', N'001-330-291-9979x8967', 2690.0500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (75, N'Susan Oconnor', CAST(N'1979-12-14' AS Date), N'96448 Kim Glens Suite 600, South Craig, WY 22944', N'3525147522', 2527.0900)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (76, N'Sarah Robinson', CAST(N'1964-11-18' AS Date), N'34612 Desiree Villages, South Cameron, GA 96393', N'(078)568-5639x360', 3662.1500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (77, N'Kurt Zamora', CAST(N'1966-06-07' AS Date), N'91802 Lee Ports, Lake Lisaport, VA 18662', N'1929093066', 4367.4700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (78, N'Jennifer Brooks', CAST(N'1972-05-07' AS Date), N'312 Stone Forest Apt. 997, Millerchester, NC 63893', N'370.921.8726', 2453.5500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (79, N'Katherine Watson', CAST(N'1998-08-09' AS Date), N'239 Peters Viaduct, Watkinsview, OR 98264', N'001-392-694-7920x5423', 2835.4100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (80, N'Debra Williams', CAST(N'1966-02-22' AS Date), N'02438 David Corner, South Connieview, MA 10961', N'001-684-189-2098', 1506.1300)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (81, N'Thomas Stewart', CAST(N'1987-06-22' AS Date), N'738 John Cape Suite 531, New Michaelborough, UT 90831', N'839-758-8631x53746', 4617.5000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (82, N'Nancy Randall', CAST(N'1981-04-13' AS Date), N'27672 Morgan Unions Suite 922, North Julie, CT 64085', N'+1-646-916-8296x4426', 500.6800)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (83, N'Daniel Harrison', CAST(N'1952-06-18' AS Date), N'4143 Brandon Islands, Austinmouth, IN 55597', N'001-802-094-1350', 765.6400)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (84, N'Lauren Davis', CAST(N'1952-01-20' AS Date), N'Unit 0405 Box 1005, DPO AA 42571', N'+1-041-787-6678x1019', 241.4000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (85, N'Tamara Valencia', CAST(N'1984-02-20' AS Date), N'543 Martinez Freeway Suite 035, Riceton, IL 14386', N'432-001-5198x54254', 3984.9500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (86, N'Justin Moran', CAST(N'1945-02-14' AS Date), N'99566 Vanessa Knolls, Rileyview, MA 14590', N'001-963-553-6581x571', 3464.5000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (87, N'Ashley Willis', CAST(N'2000-02-06' AS Date), N'565 Jennifer Way Apt. 289, Taylorchester, WA 86740', N'001-950-091-7363x241', 2161.3300)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (88, N'James Dixon', CAST(N'1972-10-03' AS Date), N'547 Deborah Squares, East Danielle, AL 73478', N'315.871.8238x568', 602.5500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (89, N'Leslie Graham', CAST(N'1951-04-30' AS Date), N'46464 Chung Drive Apt. 067, Port Denise, MI 69575', N'268.864.4541x48375', 4823.5200)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (90, N'Jill Davidson', CAST(N'1999-02-01' AS Date), N'387 Boyd Ferry, Greentown, NJ 20177', N'+1-133-694-6962x906', 995.7700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (91, N'Austin Webb', CAST(N'1981-12-19' AS Date), N'59226 Bean Wells Apt. 020, West Jeffreybury, ND 39975', N'+1-771-524-2101x209', 3826.8700)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (92, N'Kimberly Warren', CAST(N'1982-10-01' AS Date), N'98714 Pamela Ways Suite 260, West Vincentmouth, VT 04970', N'5855907507', 949.3000)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (93, N'Jennifer Salazar', CAST(N'1982-03-24' AS Date), N'Unit 6945 Box 1413, DPO AE 91982', N'427.138.2453', 1200.6500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (94, N'Michael Evans', CAST(N'1993-08-16' AS Date), N'39613 Middleton Mountains, Riveraburgh, IN 38375', N'359.065.6987', 4308.9100)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (95, N'Scott Key', CAST(N'1997-05-31' AS Date), N'6830 Rhodes Circle Suite 633, East Vicki, CA 17418', N'001-857-820-8400x816', 1710.1600)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (96, N'Andrea Parker', CAST(N'1978-04-15' AS Date), N'6194 Diana Harbors, Johnstad, WV 78754', N'101.430.1748', 1335.8500)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (97, N'Luke Padilla', CAST(N'1961-09-03' AS Date), N'769 Park Road Apt. 426, East Steven, MS 50763', N'+1-215-330-9942x0745', 3958.9900)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (98, N'Reginald Reilly', CAST(N'1995-05-04' AS Date), N'25364 Davis Trail Suite 146, Andersonborough, WY 12930', N'809.835.4743', 4726.8900)
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (99, N'Kevin Morse', CAST(N'1985-12-24' AS Date), N'342 Winters Meadow, Andersonfort, ME 36570', N'(407)806-7097x0088', 300.0500)
GO
INSERT [dbo].[Reader] ([ReaderID], [FullName], [BirthDate], [Adress], [Phone], [PenaltyAmount]) VALUES (100, N'Calvin Taylor', CAST(N'1973-10-01' AS Date), N'8749 Joshua Drive, Cliffordtown, VA 90663', N'152-133-7588x20967', 220.7000)
SET IDENTITY_INSERT [dbo].[Reader] OFF
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Book]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Reader] FOREIGN KEY([RentalID])
REFERENCES [dbo].[Reader] ([ReaderID])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Reader]
GO
ALTER TABLE [dbo].[RentalOfReader]  WITH CHECK ADD  CONSTRAINT [FK_RentalOfReader_Reader] FOREIGN KEY([ReaderID])
REFERENCES [dbo].[Reader] ([ReaderID])
GO
ALTER TABLE [dbo].[RentalOfReader] CHECK CONSTRAINT [FK_RentalOfReader_Reader]
GO
ALTER TABLE [dbo].[RentalOfReader]  WITH CHECK ADD  CONSTRAINT [FK_RentalOfReader_Rental] FOREIGN KEY([RentalID])
REFERENCES [dbo].[Rental] ([RentalID])
GO
ALTER TABLE [dbo].[RentalOfReader] CHECK CONSTRAINT [FK_RentalOfReader_Rental]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Librarian] FOREIGN KEY([LibrarianID])
REFERENCES [dbo].[Librarian] ([LibrarianID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Librarian]
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD  CONSTRAINT [FK_Transaction_Rental] FOREIGN KEY([RentalID])
REFERENCES [dbo].[Rental] ([RentalID])
GO
ALTER TABLE [dbo].[Transaction] CHECK CONSTRAINT [FK_Transaction_Rental]
GO
USE [master]
GO
ALTER DATABASE [LibraryBD] SET  READ_WRITE 
GO
