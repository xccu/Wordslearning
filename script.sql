USE [master]
GO
/****** Object:  Database [Test]    Script Date: 12/21/2015 4:19:19 PM ******/
CREATE DATABASE [Test] ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Test.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Test_log.ldf' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Test] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test] SET RECOVERY FULL 
GO
ALTER DATABASE [Test] SET  MULTI_USER 
GO
ALTER DATABASE [Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test] SET DB_CHAINING OFF 
GO
USE [Test]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 12/21/2015 4:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[MarkId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[WordId] [int] NOT NULL,
	[Marked] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Marks] PRIMARY KEY CLUSTERED 
(
	[MarkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Musics]    Script Date: 12/21/2015 4:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musics](
	[MusicId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Singer] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[Lrc] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Musics] PRIMARY KEY CLUSTERED 
(
	[MusicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 12/21/2015 4:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageId] [int] IDENTITY(1,1) NOT NULL,
	[ActionName] [nvarchar](max) NULL,
	[ControllerName] [nvarchar](max) NULL,
	[Power] [int] NOT NULL,
	[PageName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Pages] PRIMARY KEY CLUSTERED 
(
	[PageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Readings]    Script Date: 12/21/2015 4:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Readings](
	[ReadingId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[From] [nvarchar](max) NULL,
	[Url] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Readings] PRIMARY KEY CLUSTERED 
(
	[ReadingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Scores]    Script Date: 12/21/2015 4:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scores](
	[ScoreId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SpellCount] [int] NOT NULL,
	[FalseSpell] [int] NOT NULL,
	[TransCount] [int] NOT NULL,
	[FalseTrans] [int] NOT NULL,
	[SCorrectRate] [real] NOT NULL,
	[TCorrectRate] [real] NOT NULL,
	[CorrectRate] [real] NOT NULL,
 CONSTRAINT [PK_dbo.Scores] PRIMARY KEY CLUSTERED 
(
	[ScoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Spells]    Script Date: 12/21/2015 4:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spells](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[wordspell] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Spells] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Testeds]    Script Date: 12/21/2015 4:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Testeds](
	[TestedId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[WordId] [int] NULL,
	[tag] [int] NULL,
 CONSTRAINT [PK_dbo.Testeds] PRIMARY KEY CLUSTERED 
(
	[TestedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/21/2015 4:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Age] [int] NOT NULL,
	[Sex] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Imgurl] [nvarchar](max) NULL,
	[Power] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Words]    Script Date: 12/21/2015 4:19:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[WordId] [int] IDENTITY(1,1) NOT NULL,
	[spell] [nvarchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[speak] [nvarchar](500) NULL,
	[translate] [nvarchar](500) NULL,
	[sentence] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Words] PRIMARY KEY CLUSTERED 
(
	[WordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Marks] ON 

INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (1, 2, 2, 0)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (3, 2, 6, 1)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (4, 2, 19, 1)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (5, 2, 67, 1)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (6, 2, 18, 1)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (7, 2, 16, 0)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (8, 1, 67, 1)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (9, 1, 68, 0)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (10, 1, 80, 0)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (11, 2, 68, 0)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (1011, 2, 141, 0)
INSERT [dbo].[Marks] ([MarkId], [UserId], [WordId], [Marked]) VALUES (1012, 2, 145, 1)
SET IDENTITY_INSERT [dbo].[Marks] OFF
SET IDENTITY_INSERT [dbo].[Musics] ON 

INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (1, N'Angenehm Ziege und Bigbig Wolf', N'Guitar', N'music/Angenehm Ziege und Big big Wolf-guitar.mp3', NULL, CAST(N'2015-09-30 15:51:05.377' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (3, N'Fighting Shadows -Terminator5 ', N'张靓颖', N'music/Fighting Shadows.mp3', N'[00:01.00]Fighting Shadows

[00:02.42]电影《终结者：创世纪》全球主题曲

[00:04.12]
[00:06.31]作词：Eric Dawkins , Jane Zhang

[00:08.51]作曲：King Logan

[00:10.36]演唱：张靓颖 ,Big Sean

[00:12.10]
[00:14.37]No more running

[00:19.28]We are on the edge of what could be the end

[00:28.87]Don''t come any closer to me

[00:31.97]I guarantee you that''s not what you want

[00:35.97]I''m sure you thought that I would just lay down

[00:39.44]But you were wrong

[00:42.20]Give me all you got, don''t hold nothin'' back

[00:45.36]Promise you you''re gonna need it

[00:48.84]Take your best shot, I''ll just give it back

[00:52.31]I''m on the winning side, we won''t be defeated

[00:56.12]I''m not afraid to die cause life is a battle

[01:07.33]And fighting me, it''ll be like fighting shadows

[01:16.25]No surrender

[01:21.00]I know how this ends, have been there

[01:24.63]And it doesn''t look good for you

[01:30.68]Don''t come any closer to me

[01:33.76]I guarantee you that''s not what you want

[01:37.82]I''m sure you thought that I would just lay down

[01:41.23]But you were wrong

[01:43.80]Give me all you got, don''t hold nothin'' bac
k
[01:47.11]Promise you you''re gonna need it

[01:50.74]Take your best shot, I''ll just give it back

[01:54.07]I''m on the winning side, we won''t be defeated

[02:02.75]I''m not afraid to die cause life is a battle

[02:08.98]And fighting me, it''ll be like fighting shadows

[02:10.60]It''s all about survival, I''m doin'' whatever''s liable

[02:13.52]To spend a day and a night with me, prolly could write a novel

[02:16.89]I''m goin'' through Hell and back so every room got a Bible

[02:21.30]My enemies and my rivals is prolly within a mile

[02:24.79]I''m ready

[02:25.11]They want me to lay down or stay down but that ain''t my fate now

[02:27.57]I''m a hundred percent if you''re testin'' my faith
[
02:29.71]That I''m from a city where war is a playground

[02:31.21]I''ve been livin'' right and wrong, honestly it''s just so much to say

[02:34.96]But only God can judge me, if I die today it''s judgement day, straight up

[02:38.84]Give me all you got, don''t hold nothin'' back

[02:42.19]Promise you you''re gonna need it

[02:45.46]Take your best shot, I''ll just give it back

[02:48.74]I''m on the winning side, we won''t be defeated

[02:57.55]I''m not afraid to die cause life is a battle

[03:03.81]And fighting me, it''ll be like fighting shadows

[03:09.47]', CAST(N'2015-11-11 09:02:58.787' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (4, N'Tonight，I Feel Close To You', N'孙燕姿', N'music/Tonight，I Feel Close To You.mp3', N'[ti:Tonight, I feel close to you] 
[ar:仓木麻衣&孙燕姿] 
[by:jadesky] 
[offset:500] 
[00:01.93]Tonight, I feel close to you 
[00:02.91]Lyric: Kuraki Mai 
[00:04.09]Music: Ohno Aika 
[00:05.32] 
[00:06.25]Close my eyes and feel your mind 
[00:10.91]Time has passed 
[00:13.72]I walk like a shadow 
[00:16.56]Never knew what I am going through 
[00:21.48]You touch my heart and take my breath away 
[00:25.76] 
[00:27.01]Whisper on the wind so softly 
[00:32.20]Let the bright stars fill our dreams with love 
[00:37.18]Reach for your hand (You''re holding my key) 
[00:40.50]And you show me the way 
[00:43.77] 
[00:47.00]Tonight, I feel close to you 
[00:50.87]You open my door and light the sky above 
[00:57.05]When I need a friend, you are there right by my side 
[01:02.40]I wish we could stay as one 
[01:07.60]I wish we could stay forever as one 
[01:15.99] 
[01:19.16]All the tears that haunt my past 
[01:24.15]You promised it''ll be better tomorrow 
[01:29.83]Play that song 
[01:31.60]You and I listened to 
[01:34.59]And let it gently ease our pain 
[01:38.75] 
[01:39.93]Tender rain drops from the blue sky 
[01:45.23]Flowers blooming, life is so divine 
[01:50.02]Like sunlight on a stream (You''re holding my key) 
[01:52.67]You show the world to me 
[01:57.34] 
[01:59.82]Tonight, I feel close to you 
[02:04.29]You open my door and light the sky above 
[02:10.54]When I need a friend, you are there right by my side 
[02:15.76]I wish we could stay as one 
[02:21.16] 
[02:21.75]So much love in this beautiful world 
[02:26.40]Search for the brightest star in the sky 
[02:31.78]You will find the meaning of love 
[02:36.90]Don''t be afraid (Don''t be afraid) 
[02:39.31]Just be yourself (Just be yourself) 
[02:45.87]We need this love... I''ve never knew 
[02:53.71] 
[03:08.40]Tonight, I feel close you 
[03:15.85]You open my door and light the sky above 
[03:20.48]When I need a friend, you are there right by my side 
[03:25.79]I wish we could stay as one 
[03:30.32] 
[03:31.10]Tonight, I feel close to you 
[03:35.50]You open my door and light the sky above 
[03:41.40]When I need a friend, you are there right by my side 
[03:46.86]I wish we could stay as one 
[03:51.02]I wish we could stay forever as one', CAST(N'2015-09-27 00:00:00.000' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (5, N'Священная война', NULL, N'music/神圣的战争.mp3', N'[00:00.00]Священная война
[00:03.10]Вставай，страна огромная
[00:09.07]Вставай на смертный бой
[00:12.98]С фашистской силой тёмною，С проклятою ордой

[00:21.54]Пусть ярость благородная，Вскипает，как волна！

[00:32.47]Идёт война народная，
[00:37.32]Священная война！

[00:41.02]Пусть ярость благородная，Вскипает，как волна！
[00:52.47]Идёт война народная

[00:57.09]Священная война！
[01:00.02]Дадим отпор душителям，всех пламенных идей
[01:09.12]Насильникам грабителям мучителям людей
[01:19.39]
[01:20.43]Пусть ярость благородная，Вскипает，как волна！
[01:30.00]Идёт война народная

[01:34.32]Священная война！

[01:38.31]Не смеют крылья чёрные Над Родиной летать
[01:48.09]Поля её просторные，Не смеет враг топтать！
[01:57.74]Пусть ярость благородная，Вскипает，как волна！

[02:08.82]Идёт война народная！

[02:13.88]Священная война！

[02:17.75]Гнилой фашистской нечисти，Загоним пулу в лоб

[02:28.88]Отребью человечества，Сколотим крепкий гроб！
[02:38.01]Пусть ярость благородная，Вскипает，как волна！
[02:49.00]Идёт война народная，
[02:52.05]Священная война！

[02:58.01]Пусть ярость благородная，Вскипает，как волна！
[03:09.47]Идёт война народная

[03:14.00]Священная война！
[03:26.00]', CAST(N'2015-11-11 09:10:14.197' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (6, N'Never Had  Dream Come True', N'S Club 7', N'music/Never Had  Dream Come True.mp3', N'
[00:00.94]Never Had a Dream Come True
[00:03.45]演唱：S Club 7
[00:05.61]
[00:09.31]Oooh-oooh
[00:17.11]Everybody′s got something
[00:20.47]They had to leave behind
[00:24.77]One regret from yesterday
[00:27.83]That just seems to grow with time
[00:31.74]There′s no use looking back or wondering
[00:35.26](Or wondering)
[00:36.01]How it could be now or might have been
[00:39.00](Or might have been)
[00:40.26]All this I know but still I can′t find ways
[00:45.06]To let you go
[00:46.42]
[00:46.87]I never had a dream come true
[00:50.42]′Til the day that I found you
[00:54.29]Even though I pretend that I′ve moved on
[00:59.17]You′ll always be my baby
[01:02.35]I never found the words to say
[01:06.01]You′re the one I think about each day
[01:09.91]And I know no matter where life takes me to
[01:14.76]A part of me will always be with you, yeah
[01:23.68]
[01:27.04]Somewhere in my memory
[01:30.04]I′ve lost all sense of time (ah-ha, ha-ha)
[01:35.33]And tommorow can never be
[01:37.74]′Cos yesterday is all that fills my mind
[01:42.32]There′s no use looking back or wondering
[01:45.08](Wondering)
[01:45.83]How it should be now or might have been
[01:48.82](Or might have been)
[01:49.82]All this I know but still I can′t find ways
[01:54.77]To let you go
[01:58.28]
[01:58.69]I never had a dream come true
[02:02.12]′Til the day that I found you
[02:05.98]Even though I pretend that I′ve moved on
[02:10.97]You′ll always be my baby
[02:14.39]I never found the words to say
[02:18.10]You′re the one I think about each day
[02:21.71]And I know no matter where life takes me to
[02:26.54]A part of me will always be
[02:32.27]You′ll always be the dream that fills my head
[02:36.21]Yes you will, say you will
[02:38.10]You know you will, oh baby
[02:39.75]You′ll always be the one I know I′ll never forget
[02:46.93]It′s no use looking back or wondering
[02:49.97](Or wondering)
[02:50.57]Because love is a strange and funny thing
[02:53.83](And funny thing)
[02:54.63]No matter how I try and try
[02:58.26]I just can′t say goodbye, no, no, no, no
[03:05.53]
[03:05.73]I never had a dream come true
[03:08.93]′Til the day that I found you
[03:13.01]Even though I pretend that I′ve moved on
[03:17.66]You′ll always be my baby
[03:21.13]\I never found the words
[03:25.03](Never found the words to say) to say
[03:25.53]You′re the one I think about each day (each day)
[03:28.63]And I know no matter where life takes me to
[03:33.28]A part of me will always be
[03:37.38]A part of me will always be with you, ooh
[03:51.37]
', CAST(N'2015-09-29 13:47:23.610' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (7, N'Don''t Push Me', N'Sweetbox', N'music/Don''t Push Me.mp3', NULL, CAST(N'2015-09-29 14:18:17.993' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (8, N'Here With You', N'Asher Book', N'music/892_Here With You.mp3', N'[ti:Here With You]
[ar:asher book]
[al:]
[00:00.05]Here With You
[00:07.05]To all my friends
[00:08.50]The night is young
[00:10.29]The music’s loud
[00:12.09]They playing our song
[00:14.21]Nowhere else that I belong
[00:17.65]Than here with you
[00:21.68]Than here with you
[00:23.37]Oh oh  oh  oh ~~~~~
[00:35.56]
[00:36.14]Ain’t felt this good since I remember
[00:39.41]This night got started when you entered
[00:43.02]I hope we can get a little closer
[00:46.71]Maybe even get to know you name
[00:50.54]I wanna hear the music so loud
[00:54.25]Get some drinks inside me right now
[00:57.93]So baby let it go
[01:00.17]You had me at hello
[01:01.94]Let’s raise our glass and toast
[01:03.86]DJ play that once more
[01:05.10]
[01:05.90]To all my friends
[01:07.46]The night is young
[01:09.34]The music’s loud
[01:11.13]They playing our song
[01:13.00]Nowhere else that I belong
[01:16.81]Than here with you
[01:20.42]Than here with you
[01:22.34]Oh oh  oh  oh ~~~~~
[01:34.21]
[01:35.06]Gonna see the sun
[01:36.07]Before we know it
[01:38.45]If you got some money
[01:39.28]Time to blow it
[01:42.08]Gril,way you got me feeling So sick
[01:45.87]Dancing the night
[01:46.95]Away with you,with you, with you yeah
[01:50.18]Nobody here is soher
[01:53.69]Last call don’t mean it’s over yeah
[01:57.37]So bady let it go
[01:59.19]You had me at hello
[02:01.04]Let’s raise our glass and toast
[02:02.85]
[02:05.04]To all my friends
[02:07.69]The night is young
[02:08.50]The music’s loud
[02:10.31]They playing our song
[02:12.34]Nowhere else that I belong
[02:15.93]Than here with you
[02:19.80]Than here with you
[02:21.79]Oh oh  oh  oh ~~~~~
[02:23.78]
[02:24.04]Than here with you
[02:27.36]Than here with you
[02:29.97]Oh oh  oh  oh ~~~~~
[02:34.14]I wanna hear the music so loud yeah
[02:38.27]
[02:53.00]To all my friends
[02:54.68]The night is young
[02:56.56]The music’s loud
[02:58.33]They playing our song
[03:00.23]Nowhere else that I belong
[03:04.91]Than here with you
[03:07.69]Than here with you
[03:10.08]Oh oh  oh  oh ~~~~~', CAST(N'2015-09-30 11:27:23.830' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (9, N'blue mountain river', N'Cara Dillon', N'music/blue mountain river.mp3', N'[offset:500]
[00:00.00]Blue Mountain River - Cara Dillon

[00:01.93]Blue mountain river,
[00:04.93]if only for a while,
[00:09.26]Take me to the river,
[00:13.24]I lay down by your side,
[00:17.53]The world is full of madness and I find it hard to smile,
[00:25.69]Sleep with you through winter
[00:29.93]and wait for summer time
[00:34.55]Blue mountain river,
[00:38.65]comfort me a while,
[00:43.00]I ''ll follow down the river,
[00:46.85]I follow you til night,
[00:50.86]I listen to you whispers,
[00:54.60]you dance in time to mine,
[00:58.96]We''ll stay awake together watching silver in the sky.
[01:06.98]Blue mountain river,
[01:10.89]I wanna rest a while,
[01:14.99]You''re changing my reflection and the seasons in my mind,
[01:22.64]Let these days go on forever,
[01:27.30]I ''ll leave in my own time,
[01:31.35]Take me where you''re going and I ''ll be right by your side.
[01:37.78]wu na na......wu na na......
[02:12.38]BLUE......
[02:25.46]Blue mountain river,
[02:28.26]I went there for a while,
[02:32.41]I listened for an answer and I found it deep inside,
[02:40.08]When I''m lost behind the shadows and I wanna run and hide,
[02:48.82]Blue mountain river is there right by my side.
[02:55.61]', CAST(N'2015-09-30 11:35:26.407' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (10, N'Craigie Hill.mp3', N'Cara Dillon', N'music/Craigie Hill.mp3', N'[00:16.51]It being in the springtime
[00:20.41]and the small birds they were singing, 
[00:24.74]Down by yon shady harbour
[00:29.33]I carelessly did stray, 
[00:33.32]The thrushes they were warbling, 
[00:37.88]The violets they were charming 
[00:41.57]To view fond lovers talking,
[00:46.01]a while I did delay. 
[00:50.05]She said, my dear
[00:52.31]don''t leave me all
[00:54.86]for another season, 
[00:58.77]Though fortune does be pleasing
[01:03.12]I''ll go along with you, 
[01:07.03]I''ll forsake friends
[01:09.15]and relations and bid this Irish nation, 
[01:15.46]And to the bonny Bann banks forever
[01:20.17]I''ll bid adieu. 
[01:24.06]He said, my dear
[01:26.23]don''t grieve
[01:28.54]or yet annoy my patience, 
[01:32.89]You know I love you dearly
[01:37.16]the more I''m going away, 
[01:41.04]I''m going to a foreign nation
[01:45.59]to purchase a plantation, 
[01:49.55]To comfort us hereafter
[01:54.01]all in Amerika. 
[02:13.19]Then after a short
[02:18.01]while a fortune does be pleasing, 
[02:21.61]T''will cause them for smile
[02:25.70]at our late going away, 
[02:29.83]We''ll be happy as Queen Victoria,
[02:34.29]all in her greatest glory, 
[02:38.22]We''ll be drinking wine
[02:40.69]and porter all in Amerika. 
[02:47.08]If you were in your bed
[02:49.87]lying and thinking on dying, 
[02:55.56]The sight of the lovely Bann banks,
[03:00.14]your sorrow you''d give over, 
[03:03.95]Or if you were down one hour,
[03:08.23]down in yon shady bower, 
[03:12.82]Pleasure would surround you,
[03:16.72]you''d think on death no more. 
[03:37.75]Then fare you well,
[03:39.99]sweet Craigie Hills, where often times 
[03:44.80]I''ve roved, 
[03:46.60]I never thought my childhood days
[03:50.60]I''d part you any more, 
[03:54.67]Now we''re sailing on the ocean
[03:59.18]for honour and promotion, 
[04:03.74]And the bonny boats are sailing,
[04:08.22]way down by Doorin shore.', CAST(N'2015-09-30 11:35:19.347' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (11, N'Cry On My Shoulder', N'Deutschland Sucht Den Superstar ', N'music/Deutschland Sucht Den Superstar - Cry On My Shoulder.mp3', N'[ti:Cry on my Shoulder]
[ar:Superstar]
[al:Cry on my Shoulder]
[00:02.00]Cry On My Shoulder
[00:05.00]Deutschland Sucht Den Superstar
[00:08.00]
[00:26.94]If the hero never comes to you
[00:32.91]If you need someone you''re feeling blue
[00:38.96]If you''re away from love and you''re alone
[00:44.70]If you call your friends and nobody''s home
[00:50.45]You can run away but you can''t hide
[00:56.48]Through a storm and through a lonely night
[01:02.53]Then I show you there''s a destiny
[01:07.21]The best things in life
[01:10.14]They''re free
[01:13.12]
[01:14.39]But if you wanna cry
[01:17.43]Cry on my shoulder
[01:20.81]If you need someone who cares for you
[01:26.49]If you''re feeling sad your heart gets colder
[01:33.81]Yes I show you what real love can do
[01:38.03]
[01:44.00]If your sky is grey oh let me know
[01:49.92]There"s a place in heaven where we"ll go
[01:55.79]If heaven is a million years away
[02:01.18]Oh just call me and I make your day
[02:07.69]When the nights are getting cold and blue
[02:13.66]When the days are getting hard for you
[02:19.41]I will always stay here by your side
[02:24.04]I promise you I"ll never hide
[02:31.58]But if you wanna cry
[02:34.36]Cry on my shoulder
[02:37.58]If you need someone who cares for you
[02:43.57]If you''re feeling sad your heart gets colder
[02:50.91]Yes I show you what real love can do
[02:55.21]But if you wanna cry
[02:58.06]Cry on my shoulder
[03:01.45]If you need someone who cares for you
[03:07.40]If you''re feeling sad your heart gets colder
[03:14.63]Yes I show you what real love can do
[03:19.23]What real love can do
[03:25.15]What real love can do
[03:31.39]What love can do
[03:36.62]What love can do
[03:43.27]love can do 
[03:46.09]', CAST(N'2015-09-30 11:36:57.850' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (12, N'Under The Iron Sky', N'Laibach', N'music/Unter Dem Iron Sky.mp3', N'[00:01.55]Under The Iron Sky - Laibach
[00:46.41]Now that you have gone away
[00:51.28]
[00:53.59]I feel so cold, why did I stay?
[01:00.52]
[01:01.70]Remember, I''ll remember your face so pale
[01:07.69]
[01:09.75]when you left me on that gloomy day
[01:16.24]
[01:20.99]Time goes by, memories are mine
[01:27.29]
[01:27.97]Still waiting for the moment I''ll see you again
[01:35.03]
[01:36.66]Times are changing, memories are fading
[01:42.72]
[01:43.84]I''m waiting for another chance
[01:47.77]to tell you belong to me
[01:52.07]
[01:53.13]One day
[01:56.50]I know we''ll meet again
[02:00.31]Under the Iron Sky
[02:09.08]
[03:05.36]Time goes by, memories are mine
[03:10.80]
[03:12.42]Still waiting for the moment I''ll see you again
[03:18.96]
[03:21.02]Times are changing, memories are fading
[03:27.33]
[03:27.96]I''m waiting for another chance
[03:31.94]to tell you belong to me
[03:36.44]
[03:37.25]One day
[03:41.12]I know we''ll meet again
[03:44.55]Under the Iron Sky
[03:55.84]
[03:56.78]Now that you have gone away
[04:02.02]
[04:04.27]I feel so cold, why did I stay?
[04:11.07]
[04:12.19]Remember, I''ll remember your face so pale
[04:18.49]
[04:20.30]when you left me on that gloomy day', CAST(N'2015-09-30 11:39:09.710' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (13, N'Always come back to your love', N'Samantha Mumba', N'music/always come back to your love.mp3', N'[00:02.00]Always come back to your love
[00:03.00]Samantha Mumba
[00:04.00]
[00:04.38]Yeah, check it out
[00:05.45]What, what, what, what
[00:08.50]Uh, you like that? Uh
[00:15.87]Come on yeah
[00:17.63]Uh, no doubt
[00:23.49]Break it
[00:25.37]I''ve been up and down (uh, what)
[00:29.58]Been going round and round (uh)
[00:34.06]I''ve been all over town (wha-what,uh)
[00:39.30]But I''ll never ever find somebody new for sure
[00:44.38](Yes, yes you are, left to right, yes
[00:47.00]Yes you are and rock you all night)
[00:49.12]Show me where I belong tonight (all night)
[00:53.67]Give me a reason to stay
[00:57.94]No matter if I go left or right (left to right)
[01:02.39]I always come back to your love
[01:11.27]I''ve been high and low (uh)
[01:15.55]I don''t know where to go (no, baby)
[01:20.35]Because I love you so (you like that)
[01:25.11]And I''ll never ever find someone like you for sure
[01:30.26](Yes, yes you are, left to right, yes
[01:32.68]Yes you are and rock you all night)
[01:35.05]Show me where I belong tonight (all night)
[01:39.84]Give me a reason to stay (I need a reason, yeah)
[01:43.72]No matter if I go left or right (left to right)
[01:48.31]I always come back to your love
[01:56.49](Back to your love, yeah)
[01:58.45]Woah
[02:00.43]
[02:02.57]No matter if I go left or right (left to right)
[02:07.01]I always come back to your love (yeah)
[02:16.69]Woah
[02:20.87]Show me love tonight
[02:23.23]I''m going left to right
[02:25.58]No matter where I go
[02:27.90]I always find your love
[02:30.43]Show me where I belong tonight (all night)
[02:35.13]Give me a reason to stay
[02:39.54]No matter if I go left or right (left to right)
[02:43.52]I always come back to your love
[02:49.21]Show me where I belong tonight (all night)
[02:53.66]Give me a reason to stay
[02:57.96]No matter if I go left or right (left to right)
[03:02.18]I always come back to your love
[03:09.61]
[03:11.98]Woah
[03:14.46]
[03:16.53]Woah
[03:19.36]
[03:20.85]I always come back to your love
[03:28.14]
[03:30.00]Woah......
[03:39.29]I always come back to your love
[03:46.66]', CAST(N'2015-09-30 11:47:33.567' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (14, N'My Heart Will Go On', N'Celine Dion', N'music/My Heart Will Go On.mp3', N'[00:02.00]My Heart Will Go On
[00:10.00]
[00:18.40]Every night in my dreams
[00:24.41]I see you,I feel you
[00:29.80]That is how I know you go on
[00:39.50]Far across the distance
[00:43.69]And spaces between us
[00:49.22]You have come to show you go on
[00:58.60]Near far
[01:03.10]Wherever you are
[01:07.67]I believe
[01:10.14]That the heart does go on
[01:18.12]Once more you open the door
[01:26.90]And you''re here in my heart
[01:32.23]And my heart will go on and on
[01:40.09]Love can touch us one time
[01:44.46]And last for a lifetime
[01:49.96]And never let go till were one
[01:59.62]Love was when I loved you
[02:03.85]One true time I hold to
[02:09.34]In my life well always go on
[02:19.09]Near far
[02:23.25]Wherever you are
[02:27.47]I believe
[02:30.09]That the heart does go on
[02:38.35]Once more you open the door
[02:46.96]And you''re here in my heart
[02:51.73]And my heart will go on and on
[03:00.83]
[03:16.95]you''re here
[03:21.64]Theres nothing I fear
[03:26.03]And I know
[03:28.72]That my heart will go on
[03:36.67]Well stay forever this way
[03:46.04]You are safe in my heart
[03:50.85]And my heart will go on and on
[04:02.75]', CAST(N'2015-09-30 11:49:14.250' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (15, N'Midnight breakout', N'Qin''s Moon', N'music/Midnight breakout（秦时明月片尾曲）.mp3', N'[00:01.31]Midnight  Breakout
[00:16.96]
[01:03.45]Midnight on the sidewalk
[01:07.30]Feel the sick and pain
[01:12.15]No one can realize
[01:25.55]Hey   we all can see
[01:29.12]Nobody live forever man
[01:32.77]How can we wasting it
[01:38.54]Build destroy  At the same times
[01:42.19]Lust greed  Always surround you
[01:45.74]Living existing  Is not the same
[01:48.84]Dream forever you''ll die
[01:51.20]Hey   Hey   Hey   Thrill~~
[01:58.18]
[02:04.70]Forget the mirror
[02:08.66]Got to feel real
[02:13.86]Moving on a road trip
[02:17.89]Breakout of the dream
[02:24.69]Hey    don''t get stuck in the past
[02:30.38]Nightmare will never end
[02:33.58]If you don''t snake a leg
[02:38.95]Build destroy  At the same times
[02:41.91]Lust greed  Always surround you
[02:46.80]Living existing  Is not the same
[02:50.15]Dream forever you''ll die
[02:52.53]Hey   Hey   Hey   Thrill~~
[03:00.91]
[04:48.89]Build destroy  At the same times
[04:51.43]Lust greed  Always surround you
[04:55.20]Living existing  Is not the same
[04:58.56]Dream forever you''ll die
[05:00.54]Hey   Hey   Hey   Thrill~~
[05:07.53]', CAST(N'2015-09-30 11:51:15.087' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (16, N'Always Getting Over You', N'Angela Ammons', N'music/Always Getting Over You.mp3', N'[00:02.40]Always Getting Over You
[00:04.68]Angela Ammons
[00:06.51]
[00:09.46]Do do do do do
[00:12.07]Do do do do
[00:14.13]Do do do do do
[00:19.70]Do do do do do
[00:21.86]Do do do do
[00:24.39]Do do do do do
[00:32.03]Was I not enough stimulation
[00:36.07]Hit by a brake the other day
[00:38.61]Just when I thought that I''m okay
[00:42.69]You didn''t like my conversation
[00:46.69]I can''t come up with something new
[00:49.27]It doesn''t really matter what I do
[00:53.14]So here''s my observation
[00:57.17]You could never see it through my eyes
[00:59.59]And I''m too tired to try
[01:02.22]So don''t call and say your coming back for me
[01:08.04]Don''t mean nothing
[01:09.79]I''m always getting over you
[01:12.56]And don''t lie and say your over me
[01:17.60]Don''t mean nothing
[01:20.08]I''m always getting over you
[01:24.29]Do do do do
[01:26.81]Do do do do do
[01:33.99]Was it too much aggrevation
[01:38.16]Your telling me the way that I won''t see
[01:40.80]And then I change my mind you disagree
[01:44.38]I used to be our inspiration
[01:48.51]You chase your mind you disappear
[01:51.19]And I know it''s never over
[01:53.84]So don''t call and say your coming back for me
[01:59.92]Don''t mean nothing
[02:01.23]I''m always getting over you
[02:04.03]And don''t lie and say your over me
[02:09.65]Don''t mean nothing
[02:12.08]I''m always getting over you
[02:16.18]Do do do do
[02:18.80]Do do do do do
[02:24.34]Do do do do do
[02:26.65]Do do do do
[02:29.14]Do do do do do
[02:36.63]Was I not enough stimulation
[02:40.79]Hit by a brake the other day
[02:43.26]Just when I thought that I''m okay
[02:47.07]You didn''t like my conversation
[02:50.99]And I can''t come up with something new
[02:53.47]It doesn''t really matter what I do
[02:56.28]So don''t call and say your coming back for me
[03:02.31]Don''t mean nothing
[03:04.23]I''m always getting over you
[03:07.07]And don''t lie and say your over me
[03:12.48]Don''t mean nothing
[03:14.51]I''m always getting over you
[03:16.52]Do do do do do
[03:18.11]Do do do do
[03:20.77]Do do do do do
[03:26.43]So don''t call and say your coming back for me
[03:33.34]Don''t mean nothing
[03:34.93]I''m always getting over you
[03:37.88]And don''t lie and say your over me
[03:43.59]Don''t mean nothing
[03:45.14]I''m always getting over you
[03:47.94]So don''t call and say your coming back for me
[03:55.46]I''m always getting over you
[03:58.97]', CAST(N'2015-09-30 11:58:45.377' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (17, N'Right here waiting', N'Michael Bolton', N'music/How Am I Supposed To Live Without You (Michael Bolton).mp3', NULL, CAST(N'2015-09-30 12:00:40.437' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (18, N'Numb', N'Linkin Park', N'music/Numb.mp3', N'[00:19.98]I''m tired of being what you want me to be
[00:23.79]Feeling so faithless lost under the surface
[00:28.17]Don''t know what you''re expecting of me
[00:32.11]Put under the pressure of walking in your shoes
[00:38.48]（Caught in the undertow just caught in the undertow）
[00:40.23]Every step I take is another mistake to you
[00:46.42]（Caught in the undertow just caught in the undertow）
[00:49.47]
[00:50.48]I''ve become so numb I can''t feel you there
[00:55.04]I''ve become so tired so much more aware
[00:59.30]I''ve becoming this all I want to do
[01:03.61]Is be more like me and be less like you
[01:08.36]Can''t you see that you''re smothering me
[01:11.48]Holding too tightly afraid to lose control
[01:16.49]Cause everything that you thought I would be
[01:19.74]Has fallen apart right in front of you
[01:24.74]（Caught in the undertow just caught in the undertow）
[01:28.41]
[01:28.99]Every step that I take is another mistake to you
[01:33.43]（Caught in the undertow just caught in the undertow）
[01:37.42]And every second I waste is more than I can take
[01:41.18]I''ve become so numb I can''t feel you there
[01:47.43]I''ve become so tired so much more aware
[01:51.55]I''ve becoming this all I want to do
[01:56.05]Is be more like me and be less like you
[02:00.41]
[02:01.05]And I know
[02:02.54]
[02:03.43]I may end up failing too
[02:09.05]
[02:09.68]But I know
[02:11.11]
[02:11.87]You were just like me with someone disappointed in you
[02:17.85]
[02:19.55]I''ve become so numb I can''t feel you there
[02:24.37]I''ve become so tired so much more aware
[02:28.68]I''ve becoming this all I want to do
[02:33.05]Is be more like me and be less like you
[02:37.49]I''ve become so numb
[02:39.86]
[02:42.26]Is everything what you want me to be
[02:45.26]I''ve become so numb
[02:48.57]Is everything what you want me to be', CAST(N'2015-09-30 12:01:43.973' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (19, N'What I''ve Done', N'Linkin Park', N'music/What I''ve Done - Linkin Park.mp3', N'[00:01.42]What I''Ve Done
[00:03.62]Linkin Park
[00:05.64]
[00:41.05]In this farewell
[00:44.36]There''s no blood
[00:46.35]There''s no alibi
[00:49.34]''Cause I''ve drawn regret
[00:52.30]From the truth
[00:54.33]Of a thousand lies
[00:57.39]So let mercy come
[01:00.70]And wash away
[01:05.09]What I''ve done
[01:08.99]I''ll face myself
[01:11.44]To cross out what I''ve become
[01:16.91]Erase myself
[01:19.48]And let go of what I''ve done
[01:24.49]Put to rest
[01:26.29]What you thought of me
[01:29.24]While I clean this slate
[01:32.39]With the hands of uncertainty
[01:37.31]So let mercy come
[01:40.92]And wash away
[01:45.00]What I''ve done
[01:48.89]I''ll face myself
[01:51.41]To cross out what I''ve become
[01:56.95]Erase myself
[01:59.43]And let go of what I''ve done
[02:10.79]
[02:20.10]For what I''ve done
[02:24.94]I start again
[02:27.41]And whatever pain may come
[02:32.92]Today this ends
[02:35.37]I''m forgiving what I''ve done
[02:42.87]I''ll face myself
[02:45.34]To cross out what I''ve become
[02:50.88]Erase myself
[02:53.30]And let go of what I''ve done
[03:02.99]What I''ve done
[03:09.54]Forgiving what I''ve done
[03:17.32]', CAST(N'2015-09-30 12:03:00.830' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (20, N'亡灵序曲', N'Dreamtale', N'music/亡灵序曲-World Of Warcraft.mp3', NULL, CAST(N'2015-09-30 15:33:43.957' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (21, N'Seasons in the sun', N'westlife', N'music/阳光之季-Seasons in the sun.mp3', N'[00:11.57]Kian: 
[00:13.12]Goodbye to you my trusted friend 
[00:18.66]We''ve known each other since we were nine or ten 
[00:24.15]Together we''ve climbed hills and trees 
[00:29.82]Learned of love and ABC''s 
[00:32.53]Skinned our hearts and skinned our knees 
[00:34.84] 
[00:35.12]Bryan: 
[00:35.30]Goodbye my friend it''s hard to die 
[00:40.33]When all the birds are singing in the sky 
[00:45.81]Now that spring is in the air 
[00:51.56]Pretty girls are everywhere 
[00:57.07]Think of me and I''ll be there 
[00:59.36] 
[00:59.70]All: 
[01:00.02]We had joy we had fun we had seasons in the sun 
[01:05.11]But the hills that we climbed were just seasons out of time 
[01:12.50] 
[01:12.98]Shane: 
[01:13.21]Goodbye Papa please pray for me 
[01:18.52]I was the black sheep of the family 
[01:23.95]You tried to teach me right from wrong 
[01:29.42]Too much wine and too much song 
[01:32.43]Wonder how I got along 
[01:34.71] 
[01:34.91]Mark: 
[01:35.07]Goodbye papa it''s hard to die 
[01:40.38]When all the birds are singing in the sky 
[01:45.98]Now that the spring is in the air 
[01:51.40]Little children everywhere 
[01:57.21]When you see them I''ll be there 
[01:59.41] 
[01:59.64]All: 
[01:59.85]We had joy we had fun we had seasons in the sun 
[02:05.21]But the wine and the song like the seasons have all gone 
[02:10.68]We had joy we had fun we had seasons in the sun 
[02:16.07]But the wine and the song like the seasons have all gone 
[02:23.15] 
[02:24.81]Nicky: 
[02:26.69]Goodbye Michelle my little one 
[02:32.09]You gave me love and helped me find the sun 
[02:37.75]And every time that I was down 
[02:43.31]You would always come around 
[02:45.81]And get my feet back on the ground 
[02:48.15] 
[02:48.40]Shane: 
[02:48.59]Goodbye Michelle it''s hard to die 
[02:53.87]When all the birds are singing in the sky 
[02:59.40]Now that the spring is in the air 
[03:04.88]With the flowers everywhere 
[03:10.39]I wish that we could both be there 
[03:13.69] 
[03:13.83]All: 
[03:14.20]We had joy we had fun we had seasons in the sun 
[03:18.80]But the hills that we climbed were just seasons out of time 
[03:24.36]We had joy we had fun we had seasons in the sun 
[03:30.20]But the wine and the song like the seasons have all gone 
[03:35.17]We had joy we had fun we had seasons in the sun 
[03:40.62]But the hills that we climbed were just seasons out of time 
[03:46.14]We had joy we had fun we had seasons in the sun 
[03:51.59]But the wine and the song like the seasons have all gone', CAST(N'2015-09-30 15:36:21.407' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (22, N'小苹果', N'筷子兄弟', N'music/小苹果-筷子兄弟.mp3', N'[00:00.91]小苹果
[00:01.75]作词：王太利 作曲：王太利
[00:02.47]演唱：筷子兄弟
[00:03.32]
[00:17.40]我种下一颗种子
[00:19.12]终于长出了果实
[00:21.04]今天是个伟大日子
[00:25.10]摘下星星送给你
[00:26.79]拽下月亮送给你
[00:28.77]让太阳每天为你升起
[00:31.25]
[00:32.67]变成蜡烛燃烧自己
[00:34.47]只为照亮你
[00:36.44]把我一切都献给你
[00:38.22]只要你欢喜
[00:40.19]你让我每个明天都
[00:42.15]变得有意义
[00:44.04]生命虽短爱你永远
[00:46.08]不离不弃
[00:47.81]
[00:48.15]你是我的小呀小苹果儿
[00:51.92]怎么爱你都不嫌多
[00:55.26]红红的小脸儿温暖我的心窝
[00:59.33]点亮我生命的火  火火火火
[01:03.45]你是我的小呀小苹果儿
[01:07.06]就像天边最美的云朵
[01:10.61]春天又来到了花开满山坡
[01:14.70]种下希望就会收获
[01:18.70]
[01:34.12]从不觉得你讨厌
[01:35.92]你的一切都喜欢
[01:37.89]有你的每天都新鲜
[01:41.84]有你阳光更灿烂
[01:43.58]有你黑夜不黑暗
[01:45.50]你是白云我是蓝天
[01:48.09]
[01:49.42]春天和你漫步在盛开的 花丛间
[01:53.23]夏天夜晚陪你一起看 星星眨眼
[01:57.04]秋天黄昏与你徜徉在 金色麦田
[02:00.92]冬天雪花飞舞有你 更加温暖
[02:04.66]
[02:04.96]你是我的小呀小苹果儿
[02:08.49]怎么爱你都不嫌多
[02:12.02]红红的小脸儿温暖我的心窝
[02:16.15]点亮我生命的火  火火火火
[02:20.22]你是我的小呀小苹果儿
[02:23.88]就像天边最美的云朵
[02:27.19]春天又来到了花开满山坡
[02:31.45]种下希望就会收获
[02:35.14]
[02:50.98]你是我的小呀小苹果儿
[02:54.56]怎么爱你都不嫌多
[02:57.93]红红的小脸儿温暖我的心窝
[03:02.18]点亮我生命的火  火火火火
[03:06.15]你是我的小呀小苹果儿
[03:09.93]就像天边最美的云朵
[03:13.27]春天又来到了花开满山坡
[03:17.52]种下希望就会收获
[03:21.43]', CAST(N'2015-09-30 15:57:54.137' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (23, N'知己-国语版', N'李紫昕', N'music/知己-国语版.mp3', N'[00:00.00]知己 - 李紫昕
[00:01.34]Angenehm Ziege und Bigbig Wolf
[00:06.89]词：李紫昕
[00:08.10]曲：李紫昕
[00:09.48]
[00:10.80]蓝蓝天空有着我和你
[00:14.66]青青草原结伴的知己
[00:18.67]好朋友 相遇相知
[00:22.69]同闯天与地
[00:26.74]路上跌倒我俩相扶持
[00:30.65]遇上困难我俩不放弃
[00:34.64]好朋友风雨不分离
[00:38.51]最好知己
[00:42.10]一起的时光
[00:44.26]一起的成长
[00:46.50]牵手勇敢前往
[00:50.02]一起的泪光
[00:52.30]一起笑容展
[00:54.62]知己像阳光
[00:58.57]
[01:10.78]蓝蓝天空有着我和你
[01:14.65]青青草原结伴的知己
[01:18.77]好朋友 相遇相知
[01:22.54]同闯天与地
[01:26.45]路上跌倒我俩相扶持
[01:30.64]遇上困难我俩不放弃
[01:34.68]好朋友风雨不分离
[01:38.37]最好知己
[01:42.18]一起的时光
[01:44.24]一起的成长
[01:46.45]牵手勇敢前往
[01:49.98]一起的泪光
[01:52.26]一起笑容展
[01:54.58]知己像阳光
[01:58.37]
[02:02.09]一起的时光
[02:04.20]一起的成长
[02:06.62]牵手勇敢前往
[02:10.03]一起的泪光
[02:12.30]一起笑容展
[02:14.58]知己像阳光
[02:18.14]', CAST(N'2015-09-30 16:04:06.683' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (24, N'夜曲', N'Jay', N'music/夜曲.mp3', NULL, CAST(N'2015-09-30 17:19:41.103' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (25, N'黑色毛衣', N'Jay', N'music/黑色毛衣.mp3', NULL, CAST(N'2015-09-30 17:46:48.937' AS DateTime))
INSERT [dbo].[Musics] ([MusicId], [Name], [Singer], [Url], [Lrc], [Date]) VALUES (26, N'Little Apple', N'T-ara,筷子兄弟', N'music/Little Apple.mp3', N'[00:00.00]Little Apple
[00:05.00]Tara/筷子兄弟
[00:10.00]
[00:19.59]첫눈에 난 반했어
[00:21.54]나는 빠져버렸어
[00:23.36]사랑이란 이런걸까
[00:26.08]
[00:27.24]너에게 난 다가가
[00:29.07]확 말하고 싶어져
[00:30.98]가슴 설레고 있다고
[00:33.65]마음이 그렇다고
[00:34.89]하루하루 함께라면 행복할 꺼야 Hey
[00:38.67]너는 내 모든 삶 속에 기쁨이었어 Ho
[00:42.47]너의 옆에서면 자꾸 작아지나봐 Hey
[00:46.30]혹시 나를 잊을까봐
[00:48.20]不离不弃
[00:50.07]你是我的小呀小苹果
[00:53.79]怎么爱你都不嫌多
[00:57.15]애타는 내 마음을 어떡해요
[01:01.28]너에게 빠졌나봐
[01:03.87]봐 봐 봐 봐 봐
[01:05.37]你是我的小呀小苹果
[01:09.04]就像天边最美的云朵
[01:12.44]알아주지 않아도 난 괜찮아
[01:16.42]너의 마음 난 읽으니까요
[01:20.83]
[01:35.77]내 맘 몰라준다고
[01:37.67]왜 난 안봐주냐고
[01:39.49]투정부리지 않을게
[01:42.23]
[01:43.41]하루종일 생각나
[01:45.30]머리 속에 나타나
[01:47.22]너의 모습이 보고파
[01:49.61]지금 그렇다고
[01:51.07]비가오나 눈이오나 지켜줄 꺼야 Hey
[01:54.86]해와 달이 사라지면 별이 되겠지 Ho
[01:58.64]언제라도 니 옆에만 있게 된다면 Hey
[02:02.50]아침부터 저녁까지
[02:04.30]更加温暖
[02:06.20]你是我的小呀小苹果
[02:09.99]怎么爱你都不嫌多
[02:13.45]애타는 내 마음을 어떡해요
[02:17.43]너에게 빠졌나봐
[02:20.13]봐 봐 봐 봐 봐
[02:21.54]你是我的小呀小苹果
[02:25.23]就像天边最美的云朵
[02:28.65]알아주지 않아도 난 괜찮아
[02:32.67]너의 마음 난 읽으니까요
[02:37.08]
[02:51.91]你是我的小呀小苹果
[02:55.67]怎么爱你都不嫌多
[02:59.11]애타는 내 마음을 어떡해요
[03:03.09]너에게 빠졌나봐
[03:05.81]봐 봐 봐 봐 봐
[03:07.28]你是我的小呀小苹果
[03:10.94]就像天边最美的云朵
[03:14.31]알아주지 않아도 난 괜찮아
[03:18.47]너의 마음 난 읽으니까요
[03:23.02]
', CAST(N'2015-10-15 10:21:23.747' AS DateTime))
SET IDENTITY_INSERT [dbo].[Musics] OFF
SET IDENTITY_INSERT [dbo].[Pages] ON 

INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (2, N'WordsList', N'Words', 1, N'Words List')
INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (3, N'Manage', N'Words', 0, N'Words Manage')
INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (4, N'UserManage', N'User', 0, N'User Manage')
INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (5, N'TransTest', N'Words', 1, N'Translate Test')
INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (8, N'SpellTest', N'Words', 1, N'Spell Test')
INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (10, N'Reading', N'Media', 1, N'Reading')
INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (11, N'Music', N'Media', 1, N'Music')
INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (12, N'ReadingManage', N'Media', 0, N'Reading Manage')
INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (13, N'MusicManage', N'Media', 0, N'Music Manage')
INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (14, N'PageManage', N'Page', 0, N'Page Manage')
INSERT [dbo].[Pages] ([PageId], [ActionName], [ControllerName], [Power], [PageName]) VALUES (1014, N'Translate', N'Words', 1, N'Translate')
SET IDENTITY_INSERT [dbo].[Pages] OFF
SET IDENTITY_INSERT [dbo].[Readings] ON 

INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1, N'A Dog''s Sniffer Could Be Your Best Friend in Disaster 
', N'VOA', N'audio/A-Dogs-Sniffer-Could-Be-Your-Best-Friend-in-Disaster.mp3', N'When devastating earthquakes hit Haiti, Japan and Nepal, rescue dogs were among the first to arrive.
American search-and-rescue teams and their specially trained dogs also helped during U.S. hurricanes Katrina and Sandy.
Ron Sanders and his 6-year old Labarador, Pryse, were part of a U.S. team to help find survivors in Nepal.
Sanders, a retired firefighter, says Pryse and the other special canines, are essential to the team.
“The dogs obviously have a wonderful sense of smell. So they can quickly determine where the scent is coming from and hone in that location that we need to dig down.”
The dogs can also navigate quickly through collapsed buildings and squeeze through tight spots to find victims.
For the dogs, the job is a fun and playful adventure. “They want to go find that person, to play with that person."
But becoming a rescue dog is serious business. To become certified, the dogs train long and hard for six to 12 months.
What helps them get there is lots of practice.
They train in Virginia. A former prison has been made to look like a disaster site. The dogs learn to follow hand signals and voice commands while running on narrow planks of wood. They go up and down ladders, walk over rough terrain, and search in the rubble for survivors.
Finding one, which they almost always do, is the ultimate reward.
"So we''re looking for that ability to play, intelligence, great agility, of course, because we''re going to ask them to climb on things that are very unnatural for a dog to climb on.”
The dogs also train on helicopters because roads might be impassable in a disaster. The dogs are taught to get in and out of a helicopter while it''s on the ground and running. They become used to the noise, the vibrations, and the wind from the helicopter blades.
They are picked up from the ground in a special harness, too, and lifted through the air into the helicopter.
“It teaches them to trust us and to know that it will be all right,” says Sanders.
At the end of the day, it''s all about trust between the trainers and the dogs, says Sanders. Being trained and ready can make the difference between life and death, he says.
I''m Mario Ritter.
This story was first reported by Julie Taboh of VOA News. Kathleen Struck adapted the story.', CAST(N'2015-10-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (3, N'Amazing Animals Make the World Records Book ', N'VOA', N'audio/Amazing-Animals-Make-the-World-Records-Book.mp3', N'The Guinness Book of World Records has sold 132 million copies across more than 100 countries since it first appeared in 1955.
The book is now known as Guinness World Records. It tells us who is the best, fastest, biggest, most or smallest in the world.
You can read about superhuman efforts and the extremes of the natural world in Guinness World Records. You might think they are unbelievable but the publishers confirmed all of them.
Recently, the Guinness World Records announced the new record holders for 2016.
Bertie is a tortoise. Bertie broke a record set in 1977 for the world''s fastest tortoise. His top speed was 0.28 meters a second.
Marco Calzini is Bertie''s owner. He says that it is uncommon for such an animal to be fast.
"A lot of people noticed that he was very fast and the staff as well noticed he was very quick so we looked at this and we thought yeah, he is for a tortoise. It''s very unusual for a tortoise to be so active."
Another record-setting animal is a beagle named Purin, from Chiba, Japan. Many dogs can catch a ball, but not like Purin. She became a world record holder. She caught 14 balls in one minute with her paws.
Guinness World Records also is recognizing Lazy J''s Bluegrass, a steer from the American state of Kansas. He has the longest horns in the world. They are nearly three meters long, from end to end.
Finally, the American state of Texas is known for having many big things. You can find some really big cowboy boots in San Antonio, Texas.
Bob Wade is an artist who creates sculptures. He says that people are surprised that his cowboy boots are so huge. You only realize how big they are when you walk up to them.
"People are pretty amazed because they don''t realize until they park and walk right up to them how big they are. You go down the highway, you can see them from a distance but unless you come to the mall and park and come over there you have no idea how big they are."
Guinness World Records celebrates its 60th anniversary this year.
I''m Jill Robbins.VOA''s Faiza Elmasry reported this story. Haruka Takeuchi adapted her report for Learning English. George Grow was the editor.', CAST(N'2015-10-03 00:00:00.000' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (4, N'Afghan Refugee Wins UN Award for Teaching ', N'VOA', N'audio/Afghan-Refugee-Wins-UN-Award-for-Teaching.mp3', N'Aqeela Asifi, who fled to Pakistan as a young woman, has spent her life teaching other Afghan refugees.
Aqeela Asifi
For her efforts, Ms. Asifi, who is 49, has won the 2015 UNHCR Nansen Refugee award. She also gets $100,000 to help pay for her education projects.
Asifi faced many problems in Afghanistan before she fled to Pakistan. Resources were limited and education for women was discouraged.
However, in Pakistan, the 49 year old was able to bring change to her conservative Afghan community. She persuaded parents to send their daughters to school in a tent at the Kot Chandana refugee village. The village was in the Punjab province of Pakistan. 
Since then, Ms. Asifi has guided more than a thousand refugee girls through their primary education.
“When I began my mission to educate Afghan girls, I could not have imagined that one day it will win me this award. I cannot express my happiness,” she told VOA.
There are almost 1.5 million recorded Afghan refugees in Pakistan, the United Nation High Commissioner for Refugees says. Nearly half are school-aged children. But almost 80 percent of them don''t attend school.
Ms. Asifi was a teacher in Kabul when she fled with her family in 1992.
“In Afghanistan I was teaching both boys and girls,” she told VOA. “When I left Afghanistan and ended up in this refugee village with my family, I was [saddened] to find out there were no facilities here, particularly for women and girls.”
They made their home in the distant refugee community in Kot Chandana. There she began teaching a small number of students in her tent. She made teaching materials by hand.
Her tent school has led to the opening of several permanent schools in the village. These schools teach more than one thousand children. Support from the UNHCR, local government, and non-governmental organizations helped make these new schools possible.
UNHCR''s Nansen Refugee Award honors extraordinary service to people who have been forced from their homes. Eleanor Roosevelt, Graca Machel and Luciano Pavarotti are some of the other winners of the award. The 2015 award ceremony will be held on October 5 in Geneva.
Ms. Asifi is a mother of six children. She has worked hard to pay for their education. She spends almost all her income to pay her son''s tuition to study engineering at Kabul University.
But seeking higher education for her four daughters is difficult. There is not enough money or secondary schools for girls in the village.
The Afghan teacher hopes more and more children will receive an education in Afghanistan. She hopes her home country becomes better known for higher levels of education, instead of war.
“I want my [goal] to be introduced in parts of Afghanistan where conservative traditions and customs still prevent parents from sending their daughters to outdoor schools,” she said.
I''m Peter Musto.', CAST(N'2015-10-12 16:18:34.817' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (5, N'''A Pair of Silk Stockings'' by Kate Chopin ', N'VOA', N'audio/A-Pair-of-Silk-Stockings-by-Kate-Chopin.mp3', N'Our story is called "A Pair of Silk Stockings." It was written by Kate Chopin. Here is Barbara Klein with the story.

Little Missus Sommers one day found herself the unexpected owner of fifteen dollars. It seemed to her a very large amount of money. The way it filled up her worn money holder gave her a feeling of importance that she had not enjoyed for years.

The question of investment was one she considered carefully. For a day or two she walked around in a dreamy state as she thought about her choices. She did not wish to act quickly and do anything she might regret. During the quiet hours of the night she lay awake considering ideas.

A dollar or two could be added to the price she usually paid for her daughter Janie''s shoes. This would guarantee they would last a great deal longer than usual. She would buy cloth for new shirts for the boys. Her daughter Mag should have another dress. And still there would be enough left for new stockings — two pairs per child. What time that would save her in always repairing old stockings! The idea of her little family looking fresh and new for once in their lives made her restless with excitement.

The neighbors sometimes talked of the "better days" that little Missus Sommers had known before she had ever thought of being Missus Sommers. She herself never looked back to her younger days. She had no time to think about the past. The needs of the present took all her energy.

Missus Sommers knew the value of finding things for sale at reduced prices. She could stand for hours making her way little by little toward the desired object that was selling below cost. She could push her way if need be.

But that day she was tired and a little bit weak. She had eaten a light meal—no! She thought about her day. Between getting the children fed and the house cleaned, and preparing herself to go shopping, she had forgotten to eat at all!

When she arrived at the large department store, she sat in front of an empty counter. She was trying to gather strength and courage to push through a mass of busy shoppers. She rested her hand upon the counter.

She wore no gloves. She slowly grew aware that her hand had felt something very pleasant to touch. She looked down to see that her hand lay upon a pile of silk stockings. A sign nearby announced that they had been reduced in price. A young girl who stood behind the counter asked her if she wished to examine the silky leg coverings.

She smiled as if she had been asked to inspect diamond jewelry with the aim of purchasing it. But she went on feeling the soft, costly items. Now she used both hands, holding the stockings up to see the light shine through them.

Two red marks suddenly showed on her pale face. She looked up at the shop girl.

"Do you think there are any size eights-and-a-half among these?"

There were a great number of stockings in her size. Missus Sommers chose a black pair and looked at them closely.

"A dollar and ninety-eight cents," she said aloud. "Well, I will buy this pair."

She handed the girl a five dollar bill and waited for her change and the wrapped box with the stockings. What a very small box it was! It seemed lost in her worn old shopping bag.

Missus Sommers then took the elevator which carried her to an upper floor into the ladies'' rest area. In an empty corner, she replaced her cotton stockings for the new silk ones.

For the first time she seemed to be taking a rest from the tiring act of thought. She had let herself be controlled by some machine-like force that directed her actions and freed her of responsibility.

How good was the touch of the silk on her skin! She felt like lying back in the soft chair and enjoying the richness of it. She did for a little while. Then she put her shoes back on and put her old stockings into her bag. Next, she went to the shoe department, sat down and waited to be fitted.

The young shoe salesman was unable to guess about her background. He could not resolve her worn, old shoes with her beautiful, new stockings. She tried on a pair of new boots.

She held back her skirts and turned her feet one way and her head another way as she looked down at the shiny, pointed boots. Her foot and ankle looked very lovely. She could not believe that they were a part of herself. She told the young salesman that she wanted an excellent and stylish fit. She said she did not mind paying extra as long as she got what she desired.

After buying the new boots, she went to the glove department. It was a long time since Missus Sommers had been fitted with gloves. When she had bought a pair they were always "bargains," so cheap that it would have been unreasonable to have expected them to be fitted to her hand.

Now she rested her arm on the counter where gloves were for sale. A young shop girl drew a soft, leather glove over Missus Sommers''s hand. She smoothed it down over the wrist and buttoned it neatly. Both women lost themselves for a second or two as they quietly praised the little gloved hand.

There were other places where money might be spent. A store down the street sold books and magazines. Missus Sommers bought two costly magazines that she used to read back when she had been able to enjoy other pleasant things.

She lifted her skirts as she crossed the street. Her new stockings and boots and gloves had worked wonders for her appearance. They had given her a feeling of satisfaction, a sense of belonging to the well-dressed crowds.

She was very hungry. Another time she would have ignored the desire for food until reaching her own home. But the force that was guiding her would not permit her to act on such a thought.

There was a restaurant at the corner. She had never entered its doors. She had sometimes looked through the windows. She had noted the white table cloths, shining glasses and waiters serving wealthy people.

When she entered, her appearance created no surprise or concern, as she had half feared it might.

She seated herself at a small table. A waiter came at once to take her order. She ordered six oysters, a chop, something sweet, a glass of wine and a cup of coffee. While waiting to be served she removed her gloves very slowly and set them beside her. Then she picked up her magazine and looked through it.

It was all very agreeable. The table cloths were even more clean and white than they had seemed through the window. And the crystal drinking glasses shined even more brightly. There were ladies and gentlemen, who did not notice her, lunching at the small tables like her own.

A pleasing piece of music could be heard, and a gentle wind was blowing through the window. She tasted a bite, and she read a word or two and she slowly drank the wine. She moved her toes around in the silk stockings. The price of it all made no difference.

When she was finished, she counted the money out to the waiter and left an extra coin on his tray. He bowed to her as if she were a princess of royal blood.

There was still money in her purse, and her next gift to herself presented itself as a theater advertisement. When she entered the theater, the play had already begun. She sat between richly dressed women who were there to spend the day eating sweets and showing off their costly clothing. There were many others who were there only to watch the play.

It is safe to say there was no one there who had the same respect that Missus Sommers did for her surroundings. She gathered in everything —stage and players and people -- in one wide sensation. She laughed and cried at the play. She even talked a little with the women. One woman wiped her eyes with a small square of lace and passed Missus Sommers her box of candy.

The play was over, the music stopped, the crowd flowed outside. It was like a dream ended. Missus Sommers went to wait for the cable car.

A man with sharp eyes sat opposite her. It was hard for him to fully understand what he saw in her expression. In truth, he saw nothing -- unless he was a magician. Then he would sense her heartbreaking wish that the cable car would never stop anywhere, but go on and on with her forever.

"A Pair of Silk Stockings" was written by Kate Chopin. Your storyteller was Barbara Klein. Dana Demange adapted and produced it.
', CAST(N'2015-10-12 16:20:37.597' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (6, N'A Story of Refugees Arriving in Greece', N'VOA', N'audio/A-Story-of-Refugees-Arriving-in-Greece.mp3', N'The following story is based on a web blog from VOA''s Heather Murdock in Greece.

The first picture message was sent on social media at 3:51 in the morning. It appeared on the messaging software WhatsApp.

The picture showed a group of eight men with wet clothes on a dark beach. The night before, the men had left with backpacks and life jackets on a dangerous trip: They planned to be smuggled from Turkey to Greece by rubber boat.

The eight men hardly knew each other before deciding to travel together. Omar and Monaf are two college students. They were the youngest in the group. They smiled and stuck out their chests, pleased to be making the trip.

The International Organization for Migration says nearly 3,000 people have died while trying to reach Europe this year. Thousands have drowned. Smugglers or others have taken the life''s savings of migrants, leaving them trapped in war zones with no money.

The eight men who made the crossing in a small boat were lucky. The group had survived years of war, escaped from Syria and had spent days planning. The men had slept in the street the night before. They were about to attempt the trip from Greece to Germany, where they hope to find a future.

On arriving, they sent a text message. It said, “We made it.”

All full at the hotel

A commercial ferry ride from Greece to Turkey cost the VOA reporter $20. Each of the men had paid smugglers $1,200 to travel between the two countries. The men walked for two and a half hours from the coast to the town of Mytilene on the Greek island of Lesbos. Mobile phones with global positioning system links are very important for the refugees.

“The city is not safe and the hotels are all full,” said a taxi driver outside the customs office. He motioned with his hands at the refugees, some with plastic tents. “These people,” he said, with exasperation.

The streets of Mytilene were crowded with refugees. Arabic was the only language heard in the town.

The first hotel was only minutes from the port. Two young men entered wearing backpacks.

“All full?” the men said in English.

“Full,” the hotel employee said.

When it was her turn to help the next person, our reporter (Heather Murdock) told her: “I know you are full, but ..."

She interrupted. “You need a room? I have a balcony room with a sea view. It is 72 Euros.” The reporter felt uneasy, but took the room.

Trying to move on to the next border 

One of the eight men, Modar, formerly worked as an iPhone repairman. Now, he is a refugee. On WhatsApp, he reported that the men were sitting in an outdoor ice cream parlor.

The group, now larger, had just finished their coffees and waters. Omar was sleeping in a chair. Other men excitedly told their stories.

After driving four hours, carefully avoiding the police, they had walked through the woods for an hour in the darkness. Smugglers hurriedly gave directions to the 32 passengers in English. They repeated, “Go, go, go!” at every new phase of the trip.

Modar said that one of the smugglers was a blonde Turkish woman about 30 years old.

When the men arrived on the island, they saw four people sleeping near the water. Even 8-year-old Mohammed knew why they were there. “Their smuggler had stolen their money from them,” he later said.

“Go, go, go,” the smugglers repeated, pushing the group into the boat and ignoring the four sleepers.

The sea was smooth and the trip short -- only an hour and a half on the water. If the men were frightened, they would not admit it. On the road from Syria to Europe, fear is dismissed as something only for the weak. And after more than four years of living out a humanitarian disaster, many people say they are too numb to feel much of anything.

Now that they had finally arrived in Greece, they were in a hurry to get to the next border. Everyone knows Hungary is passing new anti-immigration laws and building a wall. They wanted to get in and out of the country while it is still possible. They said they have come so far, the idea of failing in Hungary is unbearable.

“Hungary is hard,” said Omar, now awake, placing his forehead into his hands.

Heather Murdock reported this story. Mario Ritter adapted it for VOA Learning English. George Grow was the editor.', CAST(N'2015-10-12 16:22:40.923' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1005, N'Angenehm Ziege und Bigbig Wolf', N'CPE', N'audio/Angenehm Ziege und Big big Wolf-guitar.mp3', N'123', CAST(N'2015-10-20 15:25:34.950' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1006, N'Chinese President Meets with Obama, US Tech Leaders ', N'VOA', N'/audio/Chinese-President-Meets-with-Obama-US-Tech-Leaders.mp3', N'Chinese President Xi Jinping is on his first state visit to the United States.
The Chinese leader spent his first two days meeting with the leaders of America''s largest technology companies. They include Amazon, Apple and Microsoft. Mr. Xi said he wants to improve intellectual property rights, such as patents for inventions and industrial designs.
Property rights have been a tense issue between China and the U.S. China has been accused of copying American products without credit or fee to the American makers.
Mr. Xi also said he wants to make it easier for foreign companies to do business in China.
“We are working to create a new open economic system, push forward reform of foreign investment management, and greatly reduce the restrictions on foreign investment,” he said.
Mr. Xi visited the headquarters of Microsoft Corporation and a nearby Boeing factory in Seattle. Chinese companies have agreed to buy 300 jets from the U.S. airplane maker. The aircraft reportedly cost about $38 billion. The deal also calls for Boeing to build a factory in China.
U.S. business leaders want Mr. Xi to promise that their companies will be treated fairly when they do business in China. They want China to reduce the theft of business secrets from American computer networks, too. Those cyberattacks have cost companies billions of dollars in recent years.
Cyberattacks on U.S. government computers
In a policy speech Tuesday, President Xi said China wanted to cooperate with the United States to prevent cyberattacks. He said China is not the aggressor, and was attacked, as well.
But many American officials do not believe that. President Obama has said he is considering taking action against China because of the attacks.
This week, a U.S. government agency released its inquiry of an attack on the personnel records of millions of government workers. The Office of Personnel Management found that more than 5.5 million fingerprint records were stolen in the cyberattack. That is more than five times as many as officials first reported.
The attack was discovered earlier this year. It affected about 22-million federal workers, applicants, and their families.
Investigators have told reporters privately they believe the Chinese government is responsible for the attack. But U.S. officials have not yet made this accusation public.
Federal experts say that, “as of now, the ability to misuse fingerprint data is limited. However, this probability could change over time as technology evolves.”
The attack could put at risk any U.S. intelligence officers or individuals working secretly overseas.
American businesswoman detained
President Xi''s visit comes only days after Chinese officials arrested and jailed an American businesswoman from Texas. Chinese officials say the woman -- Sandy Phan-Gillis -- is suspected of spying and stealing state secrets.
Ms. Phan-Gillis operates a service that helps set up business deals between U.S. and Chinese companies. Chinese officials detained her when she was on a trip to China in March.
Her husband, Jeff Gillis, says it has been difficult to get information about her. Ms. Phan-Gillis sent a message to her husband this week that said: “This is a political case. I hope you can lobby for an exchange of political prisoners. I know it''s not easy.”
Mr. Gillis has publicly asked President Obama to bring up the case with Mr. Xi.
State Department official Mark Toner says U.S. officials have talked about the case with the Chinese government.
He says "we, obviously, are monitoring this case very closely. We''ve been to visit her six times since her arrest, and we''ve raised her case with Chinese government officials on multiple occasions at a very senior level.”
The arrest of Sandy Phan-Gillis shocked the Vietnamese and Chinese communities in Houston, Texas. Although Ms. Phan-Gillis has Chinese ancestors, she was born in Vietnam and came to the U.S. as a refugee 40 years ago
Over the years, many Texas businesses have developed relationships with Chinese companies. But the arrest of Sandy Phan-Gillis has made some of them feel uneasy now.
I''m Christopher Jones-Cruise.', CAST(N'2015-11-09 15:04:17.020' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1007, N'Baseball Legend Yogi Berra Leaves Wonderful Expressions', N'VOA', N'/audio/Baseball-Legend-Yogi-Berra-Leaves-Wonderful-Expressions.mp3', N'Yogi Berra – a baseball catcher who later managed the ever-winning New York Yankees -- died Tuesday. He was 90.
Yogi Berra was short, thick and had a plain face. But he was a legendary member of the Yankees baseball team. He helped the team reach 14 World Series during his 18 seasons with the team.
Berra played in more World Series games than any other major league player. He was chosen Most Valuable Player for the American League three times.
Berra played for the Yankees from 1949 through 1963. He played for the New York Mets in 1965. His teammates were famous for their athletic baseball talent: Joe DiMaggio, Mickey Mantle and Whitey Ford.
In 1956, he was the catcher behind the plate in the only perfect game in World Series history. When the last play ended, he leaped into pitcher Don Larsen''s arms. The famous moment was captured in photographs published in newspapers around the world.
After he stopped playing baseball, Berra was a coach or manager for the Yankees, New York Mets and Houston Astros. He led both the Yankees and Mets to pennants, the step just before the World Series.
Yogi Berra''s special way of speaking
Berra became as famous for how he spoke as his baseball talent. His name appears almost as often in “Bartlett''s Famous Quotations” as it does in baseball''s record books. Bartlett''s is a collection of well-known phrases and proverbs.
"It ain''t over ''til it''s over," is one of eight "Yogi-isms" included in Bartlett''s.
Another of his famous expressions was “This is like déj&agrave; vu all over again.” Déj&agrave; vu is the feeling that you''ve experienced a moment in time more than once. It feels as if you''ve seen the exact same thing before. Yogi Berra used it when he watched Mickey Mantle and Roger Maris hit home runs over and over in the 1960s.
"When I''m sittin'' down to dinner with the family, stuff just pops out,” Berra said in an interview. “And they''ll say, ''Dad, you just said another one.'' And I don''t even know what the heck I said!"
He amused TV viewers in recent years by using his malapropisms, or mixed-up words, on an advertisement for an insurance company.
“They give you cash,” says a duck, “which is just as good as money."
Cash is money. It usually takes a second to realize Berra fooled you for a moment or two.
Yogi Berra, the philosopher
Some called Yogi Berra “the philosopher of baseball.” He gave good advice about life. “You can observe a lot by just watching.” Since “observe” means to watch, he probably meant that you could learn much by watching.
He once said, “Always go to other people''s funerals, otherwise they won''t come to yours.” Since a funeral is a ceremony for someone who has died, it would be impossible for that person to attend someone else''s funeral. But he was right that he gained the good will of friends by attending important events with them.
Mr. Berra''s wisdom included, "If you don''t know where you are going, you will wind up somewhere else." This means that it is good to know your direction in life. If you don''t have a clear image of your goal, you will not achieve much in your life.
While his expressions seemed simple-minded, they carried a lot of wisdom. "When you come to a fork in the road, take it," he said. A fork in the road means you have a decision to make. When the time comes to make a choice, pick a direction and go forward, Berra meant.
Other Yogi-isms were:
''''The other teams could make trouble for us if they win.”
"It ain''t over ''til it''s over."
Sometimes people thought Yogi Berra said clever expressions that someone else said. His comment on that was, "I didn''t really say everything I said."
His unusual nickname
Berra was the son of Italian immigrants. He got his nickname, “Yogi” while growing up in St. Louis, from a character in a movie.
He was a fan favorite, especially with children, and a popular cartoon character of the 1960s, “Yogi Bear,” was named after him.
Son of Italian immigrants
His real name was Lawrence Peter Berra. He was born May 12, 1925. Berra left school in the eighth grade to work to help support his family. He took jobs in a coal yard, as a truck driver and in a shoe factory.
He played amateur baseball before scouts from major league teams found him. He played with a semi-professional team in 1943, until World War II.
He joined the Navy and served on a gunboat on a major invasion called D-Day. Troops landed on the coast of France to fight the Nazis.
In 1946, he played for the Yankees'' professional team. He hit a home run the first time he stepped up to bat.
He was inducted into the Hall of Fame in 1972.
"You never think of that when you''re a kid," Berra said. "But egads, you gotta be somethin'' to get in."
Berra married his wife, Carmen, in 1949. They had three sons, including Dale Berra, who played in the major leagues as an infielder.
He published three books that were very popular. In 1996, he was awarded an honorary doctorate degree from the state university in Montclair, N.J., where he and his family lived. The baseball stadium there is named for him. The Yogi Berra Museum opened beside the stadium in 1998.
His wife once asked him where he wanted to be buried: In St. Louis, New York or Montclair?
"I don''t know," he said. "Why don''t you surprise me?"
I''m Jim Tedder.
', CAST(N'2015-10-27 12:56:13.530' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1008, N'Beijing Turns Air Pollution On and Off ', N'VOA', N'/audio/Beijing-Turns-Air-Pollution-On-and-Off.mp3', N'Many Beijing residents were surprised when its polluted air was cleared in the past few weeks.

The air in Beijing is well-known for being thick and polluted because of smoke, or emissions, from factories and power plants. But two weeks before the country''s massive military parade, the skies became clear.

The day after the military parade, the combination of smoke and fog, called smog, returned. The Los Angeles Times reported the story after the military parade last week.

What happened?

China''s state-run Global Times reported that officials shut down 10,000 factories and 9,000 construction sites around Beijing and nearby areas. Authorities also restricted millions of cars to driving every other day. Those restrictions started in late August to ensure that the sky over Beijing would be what is now known as “parade blue.”

Air quality measured 17 on a scale of 500 the day of the parade. The day after, it rose to 160. The U.S.Environmental Protection Agency says, at those levels, “everyone may begin to experience some adverse health effects.”

Chinese authorities have cleaned the air for special events in the past, as well. They restricted pollution during the Asia-Pacific Economic Cooperation summit last August for “APEC blue.”

The 2008 Olympics that were hosted by the Chinese also saw cleaner air. Studies after the Olympics showed a relation between the restricted pollution and an improvement in heart disease.

I''m Jonathan Evans.', CAST(N'2015-10-27 12:59:07.487' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1009, N'Brazil Announces Spending Cuts, New Taxes ', N'VOA', N'/audio/Brazil-Announces-Spending-Cuts-New-Taxes.mp3', N'On Monday, the government announced spending cuts and tax increases totaling almost $17 billion. The government said it plans to bring back the CPMF, a tax on financial transactions. The government hopes to raise more than $8 billion next year if Congress accepts the tax. However, many lawmakers oppose the measure.

Other proposed cuts would reduce government aid for farmers, infrastructure improvements and pay for government employees. Public health and low-cost housing programs could also face cuts. The government reduced tax subsidies for the chemical industry. It also reduced aid for exporters of manufactured goods and raised taxes on capital gains, profits from sales of investments.

The most recent measures are meant to cut a deficit in the budget next year. Brazil''s economy has shrunk for the past six months. That means its economy is in recession.

At the same time, President Dilma Rousseff has experienced a drop in popularity. Opposition members in Congress dismissed the cost-cutting measures as too little. Some are calling for the president to resign.

与此同时，总统Dilma Rousseff支持率也在下滑。反对党成员在国会表示总统提出的削减成本措施太少，还有一些人则表示总统应该赶紧辞职。

The Reuters news service reports that economists have say the expected savings look promising. However, it remains unclear if the measures will clear Congress without amendments. The speaker of Brazil''s lower house of Congress, Eduardo Cunha, said the president''s administration lacked the support needed in Congress to approve the proposed return of the CPMF tax.

The head of the Brazilian Senate, Renan Calheiros, said deeper cuts were needed to reduce the size of the federal government before Congress will agree to more taxes.

Government officials also say 10 ministries will be closed to save money.

The proposed reduction in public health and housing spending will be difficult for supporters of President Rousseff. Her Workers'' Party has resisted cuts to social programs.

Predictions of a big budget deficit in 2016 caused Brazil to lose its high credit rating last week. The rating agency Standard & Poor''s no longer considers the country''s credit rating as investment grade.

The downgrade means some foreign investment funds and other large investors may be forced to sell Brazilian government bonds. However, the value of Brazilian money, the real, increased on news of the cost cutting measures to reduce the deficit.

I''m Mario Ritter.', CAST(N'2015-11-09 15:02:29.717' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1010, N'Calais School Offers Migrants Help in Time of Crisis ', N'VOA', N'/audio/Calais-School-Offers-Migrants-Help-in-Time-of-Crisis.mp3', N'This is the Education Report.

Those sounds you hear are from the Chemins des Dunes School in France. The school serves a camp for migrants near the port of Calais. The students sit on chairs in a tent or outside in the sunshine. They do not pay to attend the school. Their teachers and the head of the school are all volunteers.

At a French language class, the students are learning terms for the weather, like rain and wind. Many of the migrants are from Sudan and Eritrea. They will soon see snow for the first time.

They are here to study art, Tai Chi and especially, French and English. Knowing one of those languages can help migrants in their efforts to live legally in France or in Britain, just across the English Channel.

Nigerian migrant Zimako Jones started the school. He says it is bringing together members of the city''s different migrant communities.

"Maybe you saw the Kosovar. He comes to school to sit down with blacks from Sudan, sometimes Afghan, two, three Afghan. For me, it''s (a) pleasure for me to see them live together, unite together."

The school opened two months ago in this Calais migrant camp that people have started calling "The Jungle." Today, classes are full and more people want to sign up. Some classes are held outside of the tent, where the school began.

The school has a growing number of teachers. They work as volunteers without pay. One is speech therapist Virginie Tiberghien, who lives in the area. Some local residents have protested against the migrants. But others, like her, want to help the new arrivals.

"I often see people on the road so I wanted to meet them, to know the way they were living here. The school is a way to restore humanity. And so it''s a good thing."

Volunteers are also coming from Britain. Science teacher Niamh McMahon is from Kent. She heard about the school on Facebook. She crossed the English Channel with food, clothing and school supplies for the many migrants.

"I just felt really emotional about what''s going on here, how these people are being treated. They''re desperate, they''re running away from war and torture and suffering. And in a lot of cases, caused by Western policies. So I wanted to do what I could."

Zimako Jones wants to launch another school program just for women and children. He says the school shows that migrants can create something good in "The Jungle" of Calais. He hopes that Europe and its migrants can build a future together.

And that''s the Education Report. I''m Jill Robbins.
', CAST(N'2015-10-27 13:14:30.567' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1011, N'Countries Compete for Oil in the Arctic ', N'VOA', N'/audio/Countries-Compete-for-Oil-in-the-Arctic.mp3', N'Russia, the United States and other countries are hurrying to control Earth''s northernmost territory: the Arctic. It is rich in oil and natural gas. The countries want to use these and other natural resources for their citizens and to sell overseas.

Russia has claimed a large part of the Arctic to develop natural resources, including oil. President Barack Obama recently approved proposed drilling in an area under U.S. control. The project was the idea of the Shell Oil Company.

Bill Arnold once worked for the Shell Oil Company. But he now teaches at Rice University in Texas. He just returned home from a fishing trip to Alaska.

"There is no other place that I''ve ever been that is like this. So I am very interested in the preservation of the beauty of Alaska."

Mr. Arnold said he believes that new energy resources can be developed without harming nature.

But many environmentalists disagree. They denounce U.S. oil company projects in the Arctic, and they are not satisfied with President Obama''s decision.

The Arctic has become more accessible because polar ice is melting much faster now than in centuries past. Many scientists point to climate change as the reason behind the melting ice. Climate change, they say, results from the use of fossil fuels, like petroleum oil for cars and other vehicles.

Professor Arnold says studies have shown the Arctic has plenty of oil.

"Probably something like 25 percent of the undiscovered oil and (natural) gas in the world is in the Arctic."

Half of the Arctic lies next to Russian territory. Russia sees the Arctic as important for its own energy production.

"I think their view is that as the traditional resources are dwindling, they need to find new resources and some of the greatest resources in the world are in that area."

Russian development of the Arctic slowed after Western nations ordered sanctions against Russia. The sanctions were meant to punish Russia for taking the Crimea from neighboring Ukraine. Western-based companies were forced to withdraw from partnerships with Russia.

But Mr. Arnold says the opening of the Arctic raises other concerns. He says Russia has a major military presence in the area. The United States, he points out, has a much smaller presence in the Arctic.

He also says many countries are developing shipping projects through Arctic waters once the ice is unblocked.

"The potential of it is really untested and unknown at this point. But to be able to have that kind of circumnavigation in a relatively tight range in that area could be profoundly important."

Mr. Arnold says it could be some time before Shell''s explorations affect U.S. energy production. He says it will be seven to 10 years before those efforts begin to pay off with large-scale production.

I''m Bob Doughty.', CAST(N'2015-10-27 13:16:29.747' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1013, N'WHO: Bacon, Hot Dogs Can Cause Cancer', N'VOA', N'/audio/bacon-hot-dogs-deemed-cancer-foods.mp3', N'Eating processed meat can cause cancer, World Health Organization experts said Monday.
Processed meat is meat that has been preserved by curing, salting, smoking, drying or canning.
Experts from the WHO''s International Agency for Research on Cancer (IARC) in Lyon, France, studied 800 cases. IARC researchers linked processed meat, such as hot dogs and ham, to bowel cancer, as well as pancreatic cancer and prostate cancer.
A cook at Hot Doug''s cooks orders for customers at the gourmet hot dog diner in Chicago, May 7, 2014.
The IARC has included processed meat in its group 1 list, for which there is "sufficient evidence" of links to cancer. Tobacco, asbestos, and diesel fumes are also on the group 1 list.
WHO experts also called red meat, including beef, lamb and pork, "probably" carcinogenic to humans.
Dr. Kurt Straif is with the IARC. He said in a statement that the risk of cancer increases with the amount of meat a person eats. A person who consumes 50 grams of processed meat per day – about two pieces of bacon – increases his or her risk of bowel cancer by 18 percent.
Health experts in some countries already advise against eating large amounts of red and processed meat. But those advisories had been centered on the increased risks of heart disease and obesity.
Meat industry groups are protesting the WHO study. They say that meat is part of a balanced diet. They also say the causes of cancer are broad, and include environmental and lifestyle factors.
The WHO report cited the Global Burden of Disease project, which estimates that diets high in processed meat lead to 34,000 cancer deaths per year worldwide.
I''m Ashley Thompson.', CAST(N'2015-10-30 16:05:39.883' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1014, N'China Ends One–Child Policy', N'VOA', N'/audio/china-ends-one-child-policy-as-it-is-world-news.mp3', N'The government in China plans to end its one-child per family policy and instead let families have two children.
The plan was announced Thursday after high-level political meetings in Beijing. The official Xinhua news agency says the country''s top legislature must approve the proposal before it becomes law.
A Chinese Communist Party statement gave a number of reasons for the change in policy. The statement said the change is meant to balance population development. It said the move also attempts to stop a declining birth rate and strengthen the country''s work force.
China - the world''s most populous country - launched the one-child policy in 1980. But the government permitted only a small number of couples to have two children. For example, some rural families were given approval to have two children.
A total of 19 rural provinces have a partial two-child policy. That policy states if the first-born is a girl, a second child is permitted.
In 2013, the Chinese government gave other couples a chance to have two children. Families could have two if one parent was an only child.
A teacher and population expert, Jiang Quanbao, explained how Chinese families will react to the policy.
"Too many young people in the cities are probably no longer interested in having a second child," he said. "People in rural farming villages may be more interested. But again, some of them are already allowed to have two children."At the end of 2014, China had a population of 1.37 billion people. A total of 800 million of them are employed. But that job market population is expected to drop by 2050. With the two-child policy, an increase in births will ease the labor shortage, starting in 20 years.
I''m Anna Matteo.
', CAST(N'2015-10-30 17:03:07.600' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1015, N'US Trains African Soldiers Against Boko Haraml', N'VOA', N'/audio/us-trains-african-soldiers-against-boko-haram[1].mp3', N'American soldiers are training soldiers in Niger to fight Boko Haram militants.
The training began October 19 in Agadez, the largest city in central Niger.
More training will follow for armies in Cameroon, Nigeria and Chad, a U.S. military official told the VOA.
People inspect a damaged mosque following an explosion in Maiduguri, Nigeria, Oct. 23, 2015. Boko Haram is suspected to be behind bombing.
The Niger government asked for the training, Africa Command spokesman Chuck Prichard told VOA.
The training provides benefits to the African nations and the United States, said Major General Daryl Williams, commander of U.S. Army Africa.
"This training benefits Nigeria military personnel and U.S. Army soldiers who share the mutual security goal of regional stability and security in Africa," Williams said.
News of the U.S. training mission that targets Boko Haram comes after some rare good news in the fight against the militant group.
Nigerian soldiers Tuesday rescued 338 Boko Haram captives from villages near the Sambisa Forest, Nigeria military officials reported.
The Sambisa Forest is a place where Boko Haram is active.
The rescued captives include 192 children and 138 women, the Nigerian military said. None of those rescued included any of the 276 school girls taken from a Nigerian boarding school last year.
Boko Haram is an Islamic militant group operating primarily in northeastern Nigeria. It is also active in Chad, Niger and northern Cameroon.
The new U.S. training mission in Niger involves about 40 U.S. soldiers.
Plans call for the training of about 150 Niger troops. Training details were not reported.
But U.S. officials said training will include basic soldier skills, as well as teaching small-arms shooting.
I''m Jonathan Evans.', CAST(N'2015-11-03 08:53:25.157' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1016, N'Erdogan''s Party Winner in Turkish Elections', N'VOA', N'/audio/erdogans-party-winner-in-turkish-elections[1].mp3', N'Turkish elections on Sunday returned a majority to the Justice and Development Party (AKP), led by Turkish President Recep Tayyip Erdogan.
AKP is Turkey''s socially conservative party. It claimed nearly 50 percent of the vote, and won 316 seats of the 550-member parliament.
For AKP to gain a majority, 276 seats had to be won.
The Republican People''s Party (CHP) took 25 percent of the vote.
Security was high in Turkey during the election. More than 385,000 police patrolled the streets for the nine hours of voting.
Prime Minister Ahmet Davutoglu asked for unity late Sunday. He called for citizens to prepare for "a new Turkey in which politics are normalized."
Tensions were high before the election. President Erdogan''s government clashed with pro-Kurdish leftists, feminists and nationalist Kurds.
Sunday''s results sparked protests in southeastern Turkey''s mainly Kurdish city of Diyarbakir. Government security forces fired tear gas at protesters in southeast Turkey. Erdogan responded with a message to the Kurds in the southeast that "violence cannot coexist with democracy."
The liberal pro-Kurdish Peoples'' Democratic Party (HDP), the Nationalist Movement Party (MHP) along with the CHP will be seated in the assembly.
The victory came five months after AKP lost its majority in parliament. The party held that majority for more than 10 years.
I''m Mario Ritter.', CAST(N'2015-11-06 08:57:17.167' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1017, N'Obama Rejects Keystone XL Pipeline Project', N'VOA', N'/audio/obama-rejects-keystone-pipeline-project[1].mp3', N'President Barack Obama has rejected the Keystone XL oil pipeline project.
The project involved building a 1,900-kilometer oil pipeline to transport Canadian crude oil to southeastern U.S. states.
Obama made his decision after the U.S. State Department reviewed the proposed project. The review said the project "would not serve the national interest of the United States.
President Barack Obama announces he''s rejecting the Keystone XL pipeline because he does not believe it serves the national interest, Nov. 6, 2015, in the Roosevelt Room of the White House in Washington. 
The decision is considered a victory for environmentalists.
The announcement comes ahead of a United Nations conference on climate change in Paris. The conference begins on Nov. 30. There, Obama is expected to urge nations to adopt stronger measures to help reduce global warming.
Obama said building the Keystone XL pipeline would not make a "meaningful, long-term contribution" to America''s economy. He also said it would not lower gas prices for consumers and would not increase U.S. energy security.
The pipeline would have transported more than 800,000 barrels per day from the oil sands of Alberta, Canada. TransCanada was the company behind the plan.
Many Republican lawmakers supported the construction of the pipeline. They argued it would create jobs, reduce oil prices, and reduce America''s dependency on foreign oil.
Leaders of the Republican-controlled Congress reacted strongly to the announcement. House Speaker Paul Ryan called the move "sickening" and "just wrong."
Many Democrats, including presidential candidate Bernie Sanders, applauded the decision.
The president said his administration has aimed to reduce America''s dependence on foreign oil and increase its use of clean energy. He said those efforts show the world that the U.S. is a global leader on the environment.
America is "leading by example," he said, and approving the Keystone XL pipeline "would have undercut this global leadership."
Newly elected Canadian Prime Minister Justin Trudeau supported the pipeline project. He voiced his disappointment in Obama''s decision, but said the Canada-U.S. relationship is "much bigger than any one project."
I''m Jonathan Evans.', CAST(N'2015-11-09 09:08:20.310' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1018, N'Facebook Launches More Mobile App', N'VOA', N'/audio/facebook-launches-news-app-called-notify[1].mp3', N'Facebook is launching a news mobile app called Notify with subscription content from media partners like the Washington Post and Vogue.
The Notify app lets users subscribe to content from media partners on their smartphones. Facebook will be able to add news alerts in its daily notifications to a global audience.
Facebook''s "renewed push into mobile news reflects a big, global shift in media consumption patterns," said the Financial Times.
Facebook''s profit and revenue growth reflected this shift in media. The world''s largest social media platform said its third-quarter revenue grew to $4.5 billion on the strength of its mobile advertising.
Facebook, with 500 million users, has doubled its daily page views to 8 billion since April. The company also owns Instagram, a mobile photo and video-sharing app with 400 million users. Analysts were optimistic about Instagram''s future growth.
Research firm eMarketer predicted global mobile advertising revenues for Instagram will reach $2.8 billion by 2017, up from $595 million this year. This represents over 10 percent of Facebook''s global advertising revenues.
This strong showing has positioned Facebook to compete with major social media companies as an advertising force, said analysts. "Facebook will drive growth and capture nearly 65% of social network ad revenues in 2015," reported eMarketer.
Sheryl Sandberg is Facebook''s Chief Operating Officer. "In the medium to long run, we believe that we''re not competing between Facebook and Instagram. We''re competing with other forms of media," Sandberg told analysts on a conference call.
She said Facebook wants to grow in emerging markets and bring more people online who are not using the Internet.
The advertising environment on social media is very competitive. Social media platforms are fighting for customers on laptops, tablets, phones and even watches.
Twitter is one of Facebook''s competitors. Twitter''s advertising revenues have slowed as the company struggles to add new users, reported the Wall Street Journal. Another competitor, Google, is selling more advertisements for less money on its own sites, said Ad Age.
I''m Mary Gotschall.', CAST(N'2015-11-10 09:00:37.193' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1019, N'Questions Remain in Myanmar Election', N'VOA', N'/audio/observers-watch-myanmar-election[1].mp3', N'Vote counting continues in Myanmar, but international observers say the opposition National League for Democracy (NLD) is heading for a landslide win.
Questions remain how much authority the newly elected leaders will be given.
Results released so far show the NLD has won 126 seats. The Union Solidarity Development Party that is backed by the military has won only eight seats. It is the first free election in 25 years.
"The fact that that losing USDP candidates are accepting defeat is encouraging for process credibility," said Alexander Lambsdorff, head of the European Union''s election observation mission at a press conference Tuesday.
He said the election "process went better than many people expected beforehand."
More than 30 million people cast ballots in Sunday''s election.
Still, Lambsdorff said the vote cannot be considered truly democratic because 25 percent of the seats were not contested. Under Myanmar''s constitution, 25 percent of the seats are set aside for the military.
He also voiced concern that Rohingya Muslims were largely absent from voting rolls and candidate lists. He said the lack of Muslim participation reflects their disenfranchisement.
Mary Robinson, the former president of Ireland, said she would not call the election "free and fair." Robinson represented the Carter Center as an election observer. The Carter Center, founded by former U.S. President Jimmy Carter, monitors elections across the globe.
"And I wouldn''t tend to use that expression anyway, if you''ve got 25 percent of both houses (of parliament) to the military, problems with the constitution, people excluded because they''re Muslim or the Rohingya," Robinson told the Voice of America.', CAST(N'2015-11-13 08:56:37.170' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1020, N'Will New Two-Child Policy Lift China''s Economy?', N'VOA', N'/audio/se-will-new-two-child-policy-lift-china-economy[1].mp3', N'China''s decision to end its one-child policy is likely to affect the country''s economy. 
Official Chinese media reported last month that all couples will be permitted to have two children.
The change in policy is expected to create new investments and increased demand for goods and services. The move comes as China''s economy is slowing. However, the change also may increase demand for higher pay and increase labor costs.
Speaking at a press conference Tuesday, Chinese officials predicted that the new policy would raise economic growth by about half of one percent. They said it would provide China with about 30 million laborers by 2050.
Infants undergo a daily medical examination at a maternal and child health care hospital in Taiyuan. Experts say China''s new two-child policy could spur economy because more child-related service will be needed.
He Weiwen is with the Chongyang Institute for Financial Studies at Renmin University in Beijing. He says that more children will mean "more maternity homes, hospitals, kindergartens and schools. It will certainly result in massive investment in these areas."
"The two-child policy will also lead to more spending on the second child, and thus contribute to economic growth." He added, "The families having the second child will reduce their savings to meet the new requirement."
The policy limiting families to one child began more than 30 years ago. When the new policy goes into effect, 91-million couples will have official permission for a second child. The government expects that at least 60 percent of parents having two children will come from rural areas.
Limited health care and educational centers in rural areas and small cities have long been a problem in China. The government will have to make new investments in these areas to provide quality centers for families with two children.
The Conference Board, a U.S.-based research group, says there are both good and bad effects that might result from the two-child policy.
The group says, "An increase in the number of children could have a positive impact on the consumption of products and services catering towards child rearing." It adds, "this could lead to growth and employment demand in those industries."
But the Conference Board also warned of the effects of rising labor costs, and greater pressure on aging grandparents. These men and women are often forced to take care of the young children of working mothers and fathers.
The main purpose of permitting two children in each family is to deal with the aging of China''s population and shrinking workforce.
I''m Mario Ritter.', CAST(N'2015-11-16 08:57:52.763' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1021, N'Experts: El Nino Could Be the Strongest on Record', N'VOA', N'/audio/el-nino-could-be-strongest-on-record[1].mp3', N'Weather experts say this year could be one of the strongest El Niño events in recorded history.
Experts say El Niño could mean severe weather conditions in many parts of the world. In eastern Africa, for example, Kenya and Uganda are preparing for possible flooding. Yet two countries further south, South Africa and Malawi, are already dealing with extremely dry weather.
El Niño is Spanish for "the child." It usually begins in December, near the celebration of the birth of Jesus Christ. In fact, the weather event was named in his honor.
El Niño develops when winds off the west coast of South America weaken. This permits warm water in the western Pacific to expand toward the east and the Americas. At the same time, clouds and rain over the warm water move east, too.
El Niño conditions normally appear only about two times every 10 years. Usually, El Niño conditions continue for about 12 to 18 months. They bring warm weather to some areas. These areas become wetter than normal, while others become drier.
The United Nations Children''s Fund warns that many people are at risk from hunger, disease and water shortages resulting from El Niño. In east and southern Africa, it warns, up to 11-million children could be affected.
East African countries usually receive heavy rainfall during an El Niño. Southern Africa usually has little rainfall, which may lead to wildfires or drought conditions.
Onesmus Ruirie is a weather expert with the Kenya Meteorological Department. He explains how these different weather events can result.
"What happens is that during an El Niño, the weather pattern changes. And for East Africa, we have a very warm equatorial Indian Ocean. And if the Indian Ocean is very warm due to evaporation of the ocean water, we have that water blown to the continental East Africa. And that is why you have a lot of rain in East Africa. But to the south, that denies them the moisture. So that tends to be dry in the southern Africa."
Weather changes caused by El Niño depend on the strength of the condition. In the early 1980s, a strong El Niño was linked to dry weather in Australia and Asia, rain and flooding in South America and high temperatures in much of the United States. Ten years later, a smaller El Niño caused trouble in parts of the U.S. It was linked to severe floods in the Southeast and the Middle West.
Tom Di Leberto is a meteorologist at the National Oceanic and Atmospheric Administration in Washington, D.C. He says this year could be the third strongest El Niño on record. But, we will not know for sure until early 2016 when all the weather records are examined.
I''m Jonathan Evans.', CAST(N'2015-11-17 08:56:53.257' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1022, N'Man''s Life Saved After Tapeworm Removed from Brain', N'VOA', N'/audio/mans-life-saved-after-tapeworm-removed-from-brain[1].mp3', N'A California man who was feeling sick almost died recently from a shocking cause.
26-year-old Luis Ortiz went to a hospital because of a headache and nausea. When doctors examined him, they were shocked to find a tapeworm larva in his brain.
The story gets stranger. The larva was still alive.
The creature had caused a cyst to form inside his head. The cyst was restricting the flow of liquids to different areas of his brain. The situation was so serious that doctors said they had to perform an emergency operation to remove the larva.
The Associated Press reports that a doctor who operated on Ortiz told him he had only 30 minutes to live. The California man told ABC News that when the doctor pulled the worm out of his head, it was still moving.
Luis Ortiz was a student at California State University in Sacramento. He began experiencing headaches in late August, he told a local newspaper. But Ortiz said he did not think the headaches were serious.
In September, he visited a friend and his parents in another city. That is when the pain got worse. His mother reportedly saw Ortiz throwing up. She took him to a hospital emergency room.
Ortiz told ABC News that he was "shocked." He said he "couldn''t believe something like that would happen" to him. He said he did not know there was a parasite trying to ruin his life.
The doctors saved Ortiz''s life. However, the surgery also affected it. According to ABC News, Ortiz had to drop out of school and move back home. It said, for now, he is not permitted to work or drive a vehicle.
Tapeworms and other parasitic worms usually infect a person''s intestinal system. In rare cases, they infect the brain.
Doctors suspect Ortiz ate something containing the tapeworm. You can get a tapeworm from food that is unclean, and contaminated with tapeworm eggs. People can get them from eating infected, undercooked or uncooked pork. Another type of tapeworm can infect beef.
The U.S. Centers for Disease Control and Prevention says the U.S. has about 1,000 reported cases of tapeworms each year. The CDC adds that tapeworms are more common in developing countries with poor public health systems.
According to CDC officials, signs of infection with a parasitic worm include stomach pain, nausea, loss of appetite and weight loss. Others signs are a lasting headache and vomiting. 
The best way to avoid a tapeworm infection is to wash fruits and vegetables. Also, make sure meat is cooked thoroughly. The CDC suggests cooking all meats to an internal temperature of at least 63 degrees Celsius.
Separately, the CDC says tapeworms could spread cancer. This comes after studying the case of a Colombian man who died after "catching" the disease from a tapeworm that had infected him.
I''m Anna Matteo.
In the Comments section practice using words such as "appetite," "nausea" and "contaminate." ', CAST(N'2015-11-18 09:03:06.217' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1023, N'Soda Bomb, Paris Raid and David Beckham', N'VOA', N'/audio/soda-bomb-paris-raid-beckham[1].mp3', N'The Islamic State militant group claimed that they crashed the Russian airplane over Egypt in late October with a bomb made from a soda can.
The group published a photo in the newest edition of its online magazine Dabiq.
The photo shows a gold Schweppes soda can and what appears to be a switch to trigger a bomb. But officials cannot verify whether the claim is authentic.
Russian officials said on Tuesday a bomb blew up the plane traveling from Sharm el-Sheikh to St. Petersburg. The crash killed 224 people.

Paris Apartment Raided
French officers raided an apartment in Saint-Denis, a suburb north of Paris, on Wednesday morning. They were looking for suspects involved in the terrorist attacks that killed 129 people last Friday night. The news grabbed social media channels.
Eight people were captured and two killed during the raid, which took place before dawn in Paris.
It is not yet known who was killed in the raid. However, tributes came out on social media for a police dog named Diesel. The dog was killed in the raid.

Beckham named "sexiest"
People magazine covers celebrities and pop culture in the United States. One of its most popular issues each year names "the sexiest man alive."
In the past, some of the winners were actors George Clooney, Bradley Cooper and Channing Tatum. This year, retired soccer star David Beckham earned the crown.
Beckham was a key member of England''s national soccer team in the 1990s. He mostly played for Manchester United and Real Madrid before finishing his career in the U.S. He''s also married to former Spice Girls singer Victoria Adams – who was known as "Posh Spice."
In more somber news, another star athlete from the 1990s passed away. Jonah Lomu was a legendary try-scorer for New Zealand''s world-famous All Blacks rugby team from 1994-2002. He was only 40, and many of his former teammates and opponents reached out on Twitter to offer their condolences.
I''m Jill Robbins.
And I''m John Russell.
What do you think about the claim that a bomb was made from a soda can and it downed the Russian plane? We want to hear from you. Write to us in the Comments Section or on our Facebook page', CAST(N'2015-11-20 09:01:46.430' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1024, N'ASEAN Leaders Meet in Malaysia to Talk Trade', N'VOA', N'/audio/asean-leaders-meet-in-malaysia-to-talk-trade[1].mp3', N'Leaders of Southeast Asian nations are in Malaysia this weekend for talks on terrorism, territorial disputes and trade.
The Association of Southeast Asian Nations (ASEAN) is the main political and economic organization for that area. The leaders summit is their last meeting before the launch of the ASEAN Economic Community, or AEC, on December 31.
The AEC will be equivalent to the world''s seventh-largest economy. It was set up to create a highly competitive single market and production area.
Organizers hope it will ease the movement of capital, goods, investment, services and skilled labor across ASEAN countries. The goal is to make the whole area more competitive and economically successful.
But, some business leaders have low expectations for the ASEAN summit. Anthony Nelson is a director at the US-ASEAN Business Council in Washington. He believes that security will be an important issue at the meetings, especially after the terrorist attacks in Paris last week.
"The November summit includes the East Asia Summit, which primarily focuses on political and security issues. So that''s going to be a big part of what is actually going on around the summit. A lot of the work that business gets really involved in tends to happen around the ASEAN economic ministers'' meeting in August."
But, the AEC may have only limited influence on business activity when it comes into being next year. Experts expect little to change at first because there is still much to be done.
"The ASEAN single window, which is a customs project, is still very much a work in progress. But beginning next year they will start limited trials with five of the 10 ASEAN countries. And there have been past mutual recognition agreements for credentials of skilled professionals. But there''s still a lot of work to be done in terms of actually implementing those agreements."
Some critics say the AEC will mainly help businesses, not the majority of people in Southeast Asia.
Earlier this year, the ASEAN Civil Society Conference and ASEAN Peoples'' Forum expressed concern about regional economic integration. In a statement, the group said such a move would mean unequal and unsustainable economic growth. This, it said, would result "in worsening poverty and inequalities of wealth."
Jerald Joseph is co-chair of the ASEAN Peoples'' Forum. He says people crossing borders to find employment need more protections.
He said: "Cross-border migrant workers don''t have the same level of protection or interest in the whole negotiation. So that''s a little bit of a pity, a wasted chance, if it''s not reflected in the coming document."
The 27th ASEAN Summit includes the organization''s partners. Nations including China, India, Japan and the United States are to attend.
I''m Mario Ritter.', CAST(N'2015-11-23 08:57:14.107' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1026, N'Bless You!', N'VOA', N'/audio/bless-you[1].mp3', N'Now, the VOA Learning English program Words and Their Stories.
Thanksgiving. Just as it sounds, Thanksgiving is a holiday when people give thanks for all the good in their lives.
Americans celebrate the holiday of Thanksgiving on the fourth Thursday in November. Family and friends gather around the dinner table, eat a big meal together and say what they are thankful for.
In other words, they count their blessings.
Here is Rosemary Clooney and Bing Crosby singing "Count Your Blessings" in the 1954 movie "White Christmas."
"If you''re worried and cannot sleep, count your blessing instead of sheep. And you''ll fall asleep counting your blessings"
To count your blessing is to be grateful for all your good fortune in life. But sometimes we use it as a warning to people who may forget to be thankful.
Here''s is an example of how to use it that way:
I am so mad at my mother-in-law. She has invited the whole family on a Mediterranean cruise even though she knows that I get sea sick.
You know, you should really count your blessings. You have a great family who loves you and wants to spend money on you! Be thankful. Some people have it much worse.
Good point.
A blessing is something that helps you or brings you happiness.
The word "blessing" comes from Old English, meaning "blood." As the word evolved, it borrowed from the Latin word that means to praise or worship – literally, "to speak well of." 
The verb "bless" is a word you hear often in American English. This is because "Bless you!" is a common response to someone when they sneeze.
Ah-choo!
Bless you.
Speaking in a non-religious way, "bless" means to make something lucky or happy. In a religious way, "bless" means to ask God to care for, protect, or make something or someone holy.
And if a person talks about a blessed event they are talking about expecting a child. This is slightly romantic, a little formal and a lot religious. So, use accordingly.
And please take note of the difference between "blessed" and "bles-sed." "Blessed" is the past tense of the verb "bless," but "blessed" is the adjective.
The word "bless" definitely has religious roots and meanings. But we use the word in other expressions as well.
If something is a mixed blessing, it is both good and bad. For example, being beautiful can be a mixed blessing. You may get positive attention for your beauty. But people may also be too shy to talk to you or look at you as being not very smart.
We might also express this same meaning by saying something is a blessing and a curse.
A blessing in disguise is something that seems to be bad or unlucky at first sight, but actually turns out to be good.
For example, my trip to New York City was canceled. However, the cancellation was a blessing in disguise. A big snow storm hit and shut down all the airports. I would have been stranded at the airport for days.
Now blessing someone may sound like a good thing, but sometimes it is not.
When someone, often a woman, says bless her heart about another, it means she feels sorry for that person. She is usually expressing pity more than concern. Truth be told, it is often a way of insulting someone indirectly without making yourself look bad for doing so.
"Bless her heart" is a common expression in the southern U.S. states. So, it sounds more natural when pronounced with a slight southern accent.
However, when someone says another person is blessed with a quality or talent, they really mean it. For example, "He is blessed with athletic abilities." Or "She is blessed with a beautiful singing voice."
And we at VOA Learning English are especially blessed with a great audience who loves learning English!
I''m Anna Matteo.
', CAST(N'2015-11-24 00:00:00.000' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1029, N'Drink and Smoke Go ''Hand-in-Hand,'' Scientists Say ', N'VOA', N'/audio/drink-and-smoke-go-hand-in-hand[1].mp3', N'From VOA Learning English, this is the Health & Lifestyle report.
Many people who drink alcohol also like to smoke cigarettes. Drinking and smoking seem to be closely linked. Some people might even say they go together hand-in-hand.
But this may be more than just a mixing of two fairly common activities.
New research has looked more closely at the relationship between cigarettes and alcohol. And the relationship is one of equal dependence. Smoking and drinking seem to feed on each other.
These are the exact words of Mahesh Thakkar. He is head of research in the Department of Neurology at the University of Missouri''s School of Medicine.
Thakkar explains that when a person drinks alcohol they get sleepy. He says a drug in cigarettes fights that sleepy feeling. That drug, nicotine, can be addictive; smokers need more cigarettes because of their body''s growing dependence on the drug.
So, if a person smokes, then he or she is much more likely to drink alcohol, and vice versa. Thakkar says, "They feed off one another."
Researchers already knew that people who use alcohol often smoke. In fact, earlier research shows that more than 85 percent of alcohol-dependent American adults also depend on nicotine.
Thakkar''s earlier research showed that nicotine combined with alcohol stimulates what he calls the "reward center" of the brain. However, the new study shows a dependent relationship between the substances.
Thakkar says his team "found that nicotine weakens" the sleep-causing effects of alcohol. It does this by activating an area of the brain called the basal forebrain. According to the Psychology Definition website, that area is responsible for memory, learning and attention.
For this new experiment, Thakkar and his team used equipment that measures brain activity in rats. They injected the rats with both nicotine and alcohol, and then studied brain activity in the animals as they slept. The researchers found that nicotine goes through the basal forebrain and cancels out the sleep-causing effects of alcohol.
So, why is this new research important?
The World Health Organization says 7 million people die every year from alcohol and nicotine use.
Mahesh Thakker and his team identified why alcohol use and smoking are often linked. He says this knowledge may help people break their addictions to alcohol and nicotine.
The researchers published their findings in the Journal of Neurochemistry.
I''m Anna Matteo.
Do you or someone you know smoke and drink? Let us know in the Comments section or on 51VOA.COM. Or simply practice with the words you learned such as "hand-in-hand" and "vice versa."', CAST(N'2015-11-25 08:56:37.373' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (1030, N'Russian Fighter Jet Shot Down at Turkey-Syria Border', N'VOA', N'/audio/russia-fighter-jet-shot-down-at-turkey-syria-border[1].mp3', N'A Russian fighter jet was shot down along the border between Turkey and Syria on Tuesday.
Russia said the plane was shot down by weapons on the ground.
But Turkey said its jets shot down the Russian plane when it wrongly entered Turkish airspace. The Russian plane ignored repeated warnings to leave, Turkish officials said.
Russian military officials said the Russian jet stayed within Syria as allowed.
The two pilots ejected, Russia said. Video showed two pilots parachuting from the sky. The pilots'' location is unknown.
A U.S. State Department spokesman says they cannot confirm the reports. They said they are watching closely.
The latest incident comes after four and a half years of civil war in Syria. Border country Turkey has made several warnings about aircraft from other countries entering its airspace without permission.
Russia joined the conflict in Syria in September. It fights on the side of Syrian President Bashar al-Assad. Russia says it is fighting Islamic terrorists to help Assad return order in Syria. Fighters in the civil war against Assad say Russia is targeting them.
In October, Russia agreed to keep a safe distance and communicate with other governments to prevent mid-air disasters.', CAST(N'2015-11-26 08:56:39.217' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (2030, N'Land Shares Help Farmers in Central Africa Plant Peace', N'VOA', N'/audio/helping-farmers-in-central-africa[1].mp3', N'Three times a week, a group of smallholder farmers work together in a community field in Kirolirwe, a village in North Kivu province in the Democratic Republic of the Congo.
Recently, the group prepared the soil before planting potatoes.
"Let''s go!" shouted the team leader. They encouraged each another to work harder.
Nearly 200,000 displaced persons fled to camps in the Democratic Republic of the Congo because of violence in the east. Most people there say land disputes are one of the root causes of the area''s conflicts.
So recently, large landowners have been asked to free up more of their land to individual farmers interested in cultivating crops.
Is this a solution to the land problem?
An organization called FOPAC is teaching this group better farming methods like sowing improved seeds in straight line furrows. It is also showing the farmers how to remove grass instead of burying it, and to use animal waste as fertilizer.
Mumbere Makuke works for FOPAC as a farming adviser.
He says the surrounding hills are owned by Olive Lembe, the wife of Joseph Kabila. Kabila is the president of the Democratic Republic of the Congo.
Much of the land once was cultivated. Mumbere Makuke says, the person Olive Lembe bought the property from last year stopped planting crops. Now, the land is mainly grassland.
Lembe is now urging smallholders to grow crops on some of her land, which she has renamed Hope Farm. Many local people have trouble gaining use of the land. Ranchers bought much land in the area, often on dubious terms.
Hope Farm requires farmers to make payments for use of the land, and payments have risen sharply in recent years.
Mumbere Makuke says the usual rental payment in this area for one hectare is $200 for a season of four months. Many people rent smaller fields of about 400 square meters for $10 a season.
FOPAC tries to avoid conflict with ranchers whose animals often eat farmers'' crops.
He says "We decided to dig ditches around the fields to stop cattle from getting across."
Reporter Nick Long says the farmers he spoke with seemed happy with the new farming techniques. But there is little manure available for their own fields. Also, improved potato seeds cost $1,600 for the two tons needed to plant one hectare.
That is a lot of money for many farmers. Josaphat Musansa is an agricultural researcher. He says many farmers are not wealthy enough to pay rent, let alone buy tons of improved seeds.
He says those farmers can use land if they give a share of their harvest, often 20 percent, to the landowner or manager. But as improved techniques take hold, some landowners may not be satisfied with a 20 percent share of what is likely to be a poor harvest.
Unless the government introduces policies to help smallholder farmers, they will have less and less land to use in this area. Smallholders risk becoming landless laborers as people with more money outbid them for access to land.
I''m Mario Ritter.', CAST(N'2015-11-27 08:50:20.297' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (2031, N'Black Friday, Cyber Monday Start Holiday Shopping Season', N'VOA', N'/audio/black-friday-and-cyber-monday-start-holiday-shopping-season[1].mp3', N'America''s holiday shopping season started on Black Friday, the day after Thanksgiving. It is the busiest shopping day of the year.
Retailers make the most money this time of year, about 20 percent to 30 percent of all revenue all year. The National Retail Federation (NRF) says about 136 million people will shop during the Thanksgiving Holiday weekend. 
More and more will shop online. In an era of instant information, shoppers can use their mobile phones to find deals. Nearly 80 percent of this year''s holiday shoppers, or about 183.8 million people, will shop on Cyber Monday, says the NRF.
More than half of all holiday purchases will be made online, they say. One-in-five Americans will use a tablet or smartphone. 
Pam Goodfellow is an analyst at Prosper Funding LLC. It is an online lender. "Given how shoppers today overall gravitate towards all things digital, there''s a high likelihood online shopping will be bigger than ever over the holiday weekend and on Cyber Monday," she told the NRF.
Online spending on Black Friday will rise 15 percent to hit $2.7 billion this year. Cyber Monday spending will increase 12 percent to $3 billion, says Adobe Systems Inc. 
NBC News reported that for many, shopping online was "a more comfortable alternative" than crowded malls.
The shift to online shopping has had a big impact on "brick and mortar" shopping malls. Since 2010, more than 24 shopping malls have closed and an additional 60 are struggling, according to Green Street Advisors. It tracks the mall industry.
However, Fortune says the weakest of the malls have closed. The sector is thriving again, it says. The International Council of Shopping Centers said 94.2 percent of malls were full, or occupied, with shops by the end of 2014. That is the highest level in 27 years.
Economist Gus Faucher said lower unemployment and rising wages could give Americans more money to spend.
According to the NRF, the average American consumer will spend about $805 on gifts. That''s about $630.5 billion between November and December – an increase of 3.7 percent from last year.
Nonetheless, Cyber Monday is not the biggest online shopping day in the world. That distinction goes to China''s Singles'' Day, celebrated November 11, which posted record sales of $14.3 billion this year.
I''m Mary Gotschall. ', CAST(N'2015-11-30 09:13:35.750' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (3031, N'African Union Promises to Stop Child Marriage', N'VOA', N'/audio/african-union-promised-to-stop-child-marriage[1].mp3', N'The number of girls married in Africa is expected to double in the next 35 years, experts say.
That means almost half, or 310 million girls, by 2050 will be married before they reach adulthood, says a United Nations report.
The African Union says it wants to end child marriage in Africa. Delegates at a summit in Zambia are expected to set 18 years old as the lowest legal age for marriage across the continent. 
Marriage before age 18 is already against the law in most African countries. Yet the UN says more 125 million African women and girls alive today were married before their 18th birthday. Experts say most were given to men in traditional or religious unions in violation of the law.
Most child marriages involve girls, statistics show. Some boys ages 17 and younger do get married, but examples are rare.
African Union chairwoman Nkosozana Dlamini Zuma says local culture that undervalues girls and women is to blame. Poverty and lack of education are also responsible, experts say.
Cornelius Williams is associate director of child protection at UNICEF. He says studies show child marriage can be deadly.
Child brides are less likely to finish school, he explains. They are more likely to become victims of violence. And, they are more likely to become teenage mothers, with a high risk of their children being stillborn.
The best way to prevent child marriage is to enforce and improve educational options for girls, he says. That will change opinions about the role of girls in society.
Enforcing the ban on marriage for girls younger than 18, he says, is necessary. So is educating parents.
He says he could not think of his 16-year-old daughter marrying in the next two years.
He says he wants his daughter to be able to determine her life path. He wants her to be able to determine whom she marries, what she wants to do with her life in terms of her profession -- in terms of any choices she wants to make.
Cornelius Williams says, "I wish that for all girls in Africa."
I''m Kelly Jean Kelly.', CAST(N'2015-12-01 08:50:04.337' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (3032, N'COP21, Kobe Bryant, Cyber Monday', N'VOA', N'/audio/cop21-kobe-bryant-cyber-monday[1].mp3', N'Climate change on the Agenda
The hashtag #COP21 started trending over the weekend ahead of the United Nations'' conference on climate change.
What is COP21?
It stands for the 21st Conference of the Parties to the United Nations Framework Convention on Climate Change.
World leaders like U.S. President Barack Obama and Chinese President Xi Jinping spoke about this year''s conference as a new beginning.
Xi called the summit "a new starting point." Obama said, "Our generation may not even live to see the full realization of what we do here."
But it''s a tweet from outer space that has received all the attention. American astronaut Scott Kelly wrote, "From space, we are privileged to see the beauty of Earth, but also our impact on its environment." 
The tweet was liked over 4,000 times in seven hours.

Kobe Bryant makes retirement plans
Basketball star Kobe Bryant has been grabbing headlines his entire career.
Bryant was a teenager when he entered the NBA draft straight out of high school. He won five NBA titles with the Los Angeles Lakers. He even scored 81 points in one game in 2006 – the second-highest single-game total ever.
On Sunday night, Bryant announced he would retire at the end of this season. Bryant made the announcement with a poem on the website The Players'' Tribune.
Bryant wrote, "This season is all I have left to give. My heart can take the pounding. My mind can handle the grind. But my body knows it''s time to say goodbye."
By Monday morning in the U.S., the word "Kobe" was the subject of over one million tweets.
Bryant will retire after 20 seasons in the league. He missed almost all of the last two seasons due to major injuries. Bryant will finish his career with the third-most career points in NBA history.

Cyber Monday after Black Friday
This is the time of year retail businesses in the U.S. look to start making money. Businesses offer customers discounts and incentives to make them come to stores and shop.
The day after Thanksgiving is called "Black Friday." It refers to the first time all year businesses are "in the black" or making profit.
With more businesses selling their goods online, the Monday after Thanksgiving has the name "Cyber Monday." There were over two million Google searches with the term "Cyber Monday" on Sunday alone for discounts on computers, clothes and shoes.
Perhaps some businesses hyped the big day too much. Target''s website could not handle the traffic and had to slow down.
Some users got the message "So sorry, but high traffic''s causing delays."
One Twitter user was a little disappointed that he could not access the sales on Target''s website.
The website CNBC.com said PayPal had trouble keeping up with demand, too.
I''m Jonathan Evans.', CAST(N'2015-12-02 09:02:03.507' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (4032, N'US Gas Prices Fall to Lowest Prices Since 2004', N'VOA', N'/audio/us-gas-prices-falling-lowest-prices-since-2004[1].mp3', N'Gasoline prices in the United States are nearing their lowest since 2004.
While most of the world sells gas by the liter, the United States sells gas by the gallon. Either way, most of the world pays much more for gas and fuel than the U.S.
The average price in the U.S. was $2.06 per gallon for unleaded regular, according to the American Automobile Association (AAA).
That is about 54 cents per liter.
The average price dropped another penny over the Thanksgiving holiday to 53 cents per liter. That is according to GasBuddy.com, a service that reports on U.S. gas prices.
That would be 21 cents per liter less than a year ago, and 34 cents cheaper per liter than in 2013, GasBuddy says.
Because nearly 90 percent of Americans will travel by car over the winter holidays, the savings will add up. 
The average cost to fill a car in the United States last week was $28.84. That compares to $45.92 in 2013, for a savings of around $20.
The lowest prices were in Indiana, South Carolina, Alabama, Missouri, Texas and Mississippi, AAA said. All five states have average prices of 49 cents per liter or less.
The highest prices were in states west of the U.S. Rockies. Hawaii had the highest prices, at 74 cents per liter, followed by California, at 71 cents per liter.
The lower prices are a result of oversupply, according to GasBuddy.
Prices vary in the United States based on state taxes and the local supply of gasoline from nearby refineries.
Worldwide, the lowest average gasoline prices were in Venezuela, just 1.6 cents per liter, according to GlobalPetrolPrices.com.
Libya, Saudi Arabia, Algeria and Kuwait offered gas at less than 26 cents per liter ($1 a gallon), the website reported.
The highest average prices are in the Netherlands at $1.87 per liter; Norway at $1.74 per liter; and the United Kingdom at $1.68 per liter.
The prices differ based on available supplies, taxes imposed by governments and the amount of subsidies. Venezuela not only produces oil, but heavily subsidizes gasoline to keep prices near zero.
I''m Jonathan Evans.', CAST(N'2015-12-03 08:59:57.697' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (5032, N'Police: At Least 14 Dead in California Shooting', N'VOA', N'/audio/mass-shooting-southern-california[1].mp3', N'Police say at least 14 people have been killed in a mass shooting in Southern California. And another 14 are wounded.
The attack happened in San Bernardino at a training center for disabled people.
San Bernardino police chief Jarrod Burguan spoke to reporters after the incident. He said it is believed that three gunmen were involved. He said the shooters apparently fled the area. The numbers of casualities may change and it is not known if the shooting was a terrorist attack.
Burguan said there was a massive response to the shooting. He said several local and state security forces took part.
Earlier reports said the shooters may have been dressed in military clothing. A police spokeswoman told the Los Angeles Times that the attackers were heavily armed and possibly wore body armor. 
A bomb squad reportedly was deployed to try to disarm a possible explosive device.
This latest shooting comes less than a week after a gunman killed three people and wounded nine in an attack at a family planning and health clinic in Colorado Springs, Colorado.
In October, a gunman killed nine people at a college in Oregon. In June, a gunman killed nine people at a church in South Carolina.', CAST(N'2015-12-04 08:57:45.060' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (6032, N'Online University Offers Poor Students a Chance', N'VOA', N'/audio/online-university-offers-poor-a-chance[1].mp3', N'Like many young people around the world, Emmanuel dreamed of getting a university education in the United States.
The 26-year-old only told VOA his first name because he is an undocumented immigrant. This means he does not have the official documents needed to enter, live in, or work in the U.S. legally.
Emmanuel came to the U.S. from Mexico five years ago. But, when he arrived, he discovered that his dream was much more difficult to achieve than he thought.
"First I had to learn English and realized that there were very few opportunities for me to really study into formal education in the United States."
But then Emmanuel read about University of the People. University of the People is a university that has no tuition costs. The university''s classes and teaching materials are all free online. Also, all of the teachers are volunteers.
Federal laws in the U.S. do not prevent undocumented immigrants from going to college. But laws do ban undocumented immigrants from receiving government financial aid.
The Pew Research Center is an organization that studies social issues around the world. The organization recently reported there were 11.3 million illegal immigrants living in the U.S. in 2014. Of those, 49 percent were from Mexico.
Many undocumented immigrants like Emmanuel come to the U.S. with little money to pay for things like higher education. College Board is an organization that collects information and resources to make higher education more available.
The organization recently reported on the average cost of a four-year degree at both public and private U.S. universities.
The average cost at a public university is $9,410 for a resident of the state where the university is located. The average cost at a private university is $32,405.
College Board also reported that 69 percent of financial aid came from the U.S. government in 2014.
Emmanuel had no other choice, so he chose to study at University of the People. Quickly, he said, he believed that the university would give him the skills for a future in computer science.
Shai Reshef is the president of University of the People. He was born in Israel. Reshef made millions of dollars as the chief executive officer of the Kidum Group. The Kidum Group was a company that helped students prepare for tests.
Reshef decided to create a tuition-free university after visiting several poor countries. People in those countries had limited higher education opportunities.
"We built a model to show universities, to show governments that the issue of higher education can be solved. Higher education can be accessible, can be affordable, can be high-quality and shouldn''t leave anyone behind."
Currently, the University of the People only offers degrees in computer science and business administration. Though tuition is free, the university does require students to pay a $50 application fee. Also, the university requires students to pay a $100 test fee when they complete a class.
The total cost for a four-year degree is $4,000. But the university does offer scholarships.
Students must be at least 18 years old. They must be highly skilled in English. Students must also have completed high school.
The university has students from 170 countries. Refugees are among the university''s student population. Reshef also said that almost 25 percent of the students are undocumented immigrants.
To help these students, the University of the People works with other schools such as New York University, Oxford University and Yale University.
University of the People also works with companies like Microsoft and Hewlett-Packard. Some of these partners provide students with financial help. Other partners offer students internships.
The Distance Education Accrediting Commission or DEAC is a U.S. organization that reviews the quality of online schools and schools without physical classrooms. The DEAC approved the University of the People''s quality of education in 2014.
Emmanuel said he misses seeing and working with other students in a classroom. But he does love working with students in many countries online.
"It helps me to realize that I''m not limited to just staying in one country."
There are more than 2,500 students studying with the University of the People. The university expects that number to double next year.
Massive Open Online Courses or MOOCs are free online classes that universities all over the world provide. Stanford University began offering free MOOCs in 2006. Oxford University began offering free online classes in 2009.
But, these classes are not part of a degree program.
I''m Pete Musto.', CAST(N'2015-12-07 09:05:40.693' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (6033, N'IMF Adds China''s Yuan to World''s Top Currencies', N'VOA', N'/audio/imf-adds-chinas-yuan-to-worlds-top-currencies[1].mp3', N'The International Monetary Fund (IMF) added China''s yuan to its group of key global currencies this week, a historic development that gives new status to the world''s second-largest economy.
It is "a sign that China is rising ever faster and further on the global economic stage," reported the BBC. China now accounts for more than 15 percent of the global gross economic output, nearly three times what it was a decade ago, said the Wall Street Journal. 
The IMF said the yuan, also called the renminbi, will be added to the group of reserve currencies. Those include the U.S. dollar, Europe''s euro, the Japanese yen and the British pound. These currencies are in the IMF''s Special Drawing Rights group. The IMF uses this group of reserve currencies to make emergency loans to its 188 member nations.
The new IMF designation will take effect at the end of September 2016.
China had worked toward winning the designation for several years. To achieve it, China had to give up some of its tight control over its currency and make reforms in its financial sector, reported the New York Times. 
The IMF decision reflects the declining influence of Europe in world financial markets.
"The renminbi is mainly replacing part of the euro''s role in the special drawing rights," wrote the New York Times. It added that the renminbi is "quickly gaining ground on the euro."
In the new IMF designation, the IMF will give more weight to China''s currency than to either the yen or the pound.
Despite the increased role for the yuan, the U.S. dollar still dominates in finance and trade, and is "the world''s pre-eminent reserve currency," wrote the Wall Street Journal. It is still the most widely used currency for savings around the world. This is because investors feel confident that they can get access to money traded in dollars. 
Christine Lagarde is the IMF Managing Director. She said the decision regarding the yuan is "an important milestone in the integration of the Chinese economy into the global financial system."
She added that it was also "a recognition of the progress that the Chinese authorities have made in the past years in reforming China''s monetary and financial systems."
There are risks to being an IMF reserve currency. China limits the ability of businesses and individuals to transfer funds out of the country. But the more China opens its markets, the more it exposes its economy to "the risk of capital flowing out," noted the Wall Street Journal. 
I''m Mary Gotschall. ', CAST(N'2015-12-08 09:04:35.133' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (6034, N'Central Bank Chief Says Job Market Is Improving', N'VOA', N'/audio/central-bank-chief-says-job-market-is-improving[1].mp3', N'The head of the United States central bank says she expects the U.S. job market to continue to improve.
Janet Yellen says the inflation rate should rise close to a yearly rate of 2 percent. That inflation rate would keep prices stable and support the economy, says the central bank, or Federal Reserve System.
Too much inflation and prices rise too high, too fast. Not enough inflation and prices and growth remain flat or decline. Currently, inflation is well below one percent.
Many economists interpret Yellen''s comments as a signal that the Federal Reserve might raise the key interest rate on December 16. The Federal Reserve has considered increasing important interest rates for a long time. But it has been cautious about making rate changes, fearing that the economy would react badly.
In a speech to the Economic Club of Washington on Wednesday, Federal Reserve Chairperson Yellen said she expects the effects of a strong U.S. dollar and faltering foreign markets to decrease over time. She cautioned that bad economic reports could still delay any rate increase.
The Bureau of Labor Statistics reported Friday that the economy gained 211,000 jobs in November. Unemployment remained at five percent, its lowest level in seven years.
The Federal Reserve cut an important interest rate to almost zero during the financial crisis of 2007 and 2008. The idea was to make it less costly for businesses to borrow the money needed for new equipment. Less costly loans help to create jobs, and cut unemployment.
Since those economic stimulus efforts, unemployment has fallen from 10 percent to 5 percent. A new report from Georgetown University says under-employment, lacking a job that pays enough, has also been cut sharply, especially for people with college degrees.
Some economic studies published Wednesday may increase the likelihood of a rate increase. ADP is a company that processes 24 million paychecks for companies across the United States. It says employment rose by 217,000 in November.
A separate opinion survey of U.S. workers by the company Gallup shows many more companies say they are hiring than are worrying about layoffs.
CoreLogic is a company that tracks the housing industry. It says its newest studies show a decrease in home sales related to foreclosure or other kinds of distress.
Foreclosures take place when banks reclaim homes because their owners cannot pay their loans. Foreclosures and other problems increased sharply during the financial crisis of 2007 and 2008. A decline in "distressed" home sales shows an improving housing industry.
I''m Mario Ritter.', CAST(N'2015-12-09 08:58:52.433' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (6035, N'One School, Five Languages', N'VOA', N'/audio/dual-language-schools-popular-in-new-york-city[1].mp3', N'In New York City public schools, 176 different languages are spoken among the more than 1 million students.
For 160,000 children, English is not their first language. New York''s Department of Education makes learning better for these students by providing dual-language programs.
Students are taught in two languages, English and another one, like Russian or Chinese. Math, social studies, science and all other regular courses are taught in both languages. And they learn about the culture of the other country.
Milady Baez is Deputy Chancellor of English Language Learners and Student Support. She says these dual-language programs will help children succeed in the future.
"The jobs of the future require that our students know more than one language. They are going to be traveling abroad, they are going to be communicating with people from all over the world. This will open doors for them."
David A. Booty Middle School in Brooklyn offers dual language education in four languages: Russian, Mandarin, Spanish and Hebrew.
Shuya Zhang teaches a dual language class. She says the program helps children get ready to work with people in other countries.
"Look at now-a-days, America started economic relationships with China. Lots of factories have been built, companies moved to China. They need people with the skills with both language skills so the kids when they are grown up, they already have this skill."
Middle-schoolers might not have jobs on their minds yet. For Kequing Jaing, she likes keeping up her first language, Mandarin.
"It makes me, like, feel that I am home because I can speak in Chinese, learn in Chinese, while learning in English. So it makes me feel better and makes me understand more about the task I''m learning."
Anastasia Hudikova came to the United States when she was 2 years old. She says the Russian-English program keeps her connected to her heritage and her parents happy.
"They''re really happy about the program that it exists. They are really happy that I can preserve my culture and my language, that I can speak it fluently in school."
The New York schools also offer dual-language programs in seven other languages: Arabic, French, Haitian Creole, Hebrew, Korean, Polish and Spanish. There are plans to add even more languages in the future.
While these dual-language programs are popular, some groups in the U.S. say teaching English comes first. U.S. English wants to make English the official language of the United States.
"We have no problem with folks speaking multiple languages ... if people want to speak a different language at home," says Todd DuBois with U.S. English. "What we do think is schools should prioritize English."
He says studies show that children who learn English early will be more successful later. And, he says, focusing on English in the classroom will help the students learn the language faster.
I''m Anne Ball.', CAST(N'2015-12-10 09:02:00.850' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (6036, N'Oil Prices Down, But Production Stays Up', N'VOA', N'/audio/oil-prices-down-but-production-stays-up[1].mp3', N'Oil prices have fallen to their lowest levels since 2009.
Brent crude oil, one of several kinds of oil on the world market, dropped below $40 a barrel on Tuesday. However, the main group of oil producing countries has been unable to reduce production to limit supply.
The Organization of Petroleum Exporting Countries (OPEC) met in Vienna last week. OPEC said members should be part of climate change-related talks such as the COP-21 meeting in Paris.
The group also called on members to maintain, in its words, an "energy dialogue" with countries that produce oil but are not OPEC members. About two-thirds of oil production is carried out by non-OPEC countries.
But, the 13 member countries could not agree on any production cuts. OPEC oil production continues at record levels. An OPEC report says the group''s oil production increased to over 31 million barrels of oil per day.
Some experts say OPEC member Saudi Arabia continues its production levels to keep competitors from gaining market share.
Some producers in the United States use techniques like hydraulic fracturing, or fracking, to increase oil output. However, that method costs more than the traditional drilling techniques used in many other countries. These may include the indirect costs of pollution to ground water or very small earthquakes in some places.
OPEC says it continues its high production levels because it believes demand will increase in the coming year.
Experts say worldwide demand for crude, or unprocessed oil, is already about 2 million barrels a day below the current supply. That has led to some markets to have more oil than needed.
That oversupply may grow as international sanctions on Iranian exports are lessened. Iran is an OPEC member.
Indonesia also became a full member of the oil group at the December meeting.
Demand for oil has been decreasing as economic activity in many important areas around the world has slowed. Economic growth slowed in the group of 19 nations that use the euro as money from July to September. Growth in the Eurozone was 0.3 percent during that period.
Slowing demand in China has also been blamed for low oil prices. China is the world''s second-largest economy. Economic growth in China has slowed to a yearly rate of 6.9 percent, the country''s lowest growth since 2009.
I''m Mario Ritter.', CAST(N'2015-12-11 08:48:06.980' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (6037, N'More Violence in Syria as Diplomatic Push Continues', N'VOA', N'/audio/more-violence-in-syria-as-diplomatic-push-continues[1].mp3', N'A series of truck bombs in northeast Syria has killed at least 22 people, a human rights monitoring group said Friday.
This latest violence comes as negotiators meet in Riyad, Saudi Arabia to seek a solution to the war in Syria.
The bombs exploded near a vegetable market and a health center in the Kurdish-held town of Tel Tamer, according to the Syrian Observatory for Human Rights.
The human rights group said many were also wounded in the attack late Thursday. The truck bombing death toll is expected to rise in the coming days.
No group has claimed responsibility for the bombings.
Tel Tamer is controlled by the Kurdish People''s Defense Forces (YPG, in Kurdish). For months, they have battled Islamic State extremists in the area.
Syrian opposition groups united Thursday to agree on talks with President Bashar al-Assad''s government. More than 100 Syrian politicians and military leaders met in Riyadh, and gave their support to negotiations for a possible peace deal.
The talks in Saudi Arabia resulted from a plan agreed to last month. That plan was developed by 20 world powers in Vienna.
U.S. Secretary of State John Kerry welcomed the "positive outcome" of the meeting.
Kerry said meetings may be held in New York next week. These meetings would be a follow-up to the Vienna talks.
In other diplomatic news, officials from the United States, Russia and the United Nations also met Friday in Geneva to advance the Syrian peace process.
I''m Mario Ritter.', CAST(N'2015-12-14 08:54:35.233' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (6038, N'US, Russia Hold Talks on Syria, IS, Ukraine ', N'VOA', N'/audio/us-russia-hold-talks-on-syria-is-ukraine[1].mp3', N'The United States and Russia tried to find common ground Tuesday about Syria, the Islamic State terrorist group and Ukraine.
U.S. Secretary of State John Kerry and Russian Foreign Minister Sergei Lavrov met in Moscow. It was Kerry''s second trip to Russia this year. He was also to meet with Russian President Vladimir Putin.
Kerry acknowledged that "there have been differences between us." But, he said, "we have been able to work effectively on specific issues." He noted that Russia helped broker the Iran nuclear agreement.
Lavrov said he wanted to continue talks begun by Putin and U.S. President Barack Obama over the "Ukrainian settlement."
Also on Kerry''s agenda in Russia were talks about how to end the fighting in Eastern Ukraine, said a senior State Department official. The so-called Minsk agreement calls for the Ukrainian government and Russian-supported separatists to withdraw their heavy weapons.
Kerry also planned to set an agenda for the next International Syria Support Group meeting, the official said. That group has offered a political solution to end the crisis in Syria. The United States and Russia disagree about whether Syrian leader Bashar al-Assad should be removed. The International Syria Support Group is scheduled to meet Friday in New York.
A U.S.-led coalition and Russia, separately launched airstrikes against militant targets in Syria. The United States criticized the Russian airstrikes. It said the strikes target anti-Assad Syrians instead of Islamic State terrorists.
The meeting between Kerry and Lavrov happened as Russia seeks to end U.S. and European economic punishments. Sanctions were put in place after Russia illegally annexed, or seized control of, Crimea, which was part of Ukraine.
Some reports say Russia will try to use its relationship with Assad to gain favor with the West to end sanctions. But the State Department official said the American position is "absolutely clear." The U.S. would not end the sanctions in exchange for Russia pressuring Assad to leave office, the official said: The issues are separate.
I''m Christopher Jones-Cruise.', CAST(N'2015-12-17 08:58:10.537' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (6039, N'New US Education Law Gives States More Control', N'VOA', N'/audio/new-education-law-gives-states-more-control[1].mp3', N'States and local communities in the United States gained more control over education standards and testing last week.
U.S. President Barack Obama signed the education reforms into law last week.
"After more than 10 years, members of Congress from both parties have come together to revise our national education law," Obama said. "This law focuses on a national goal of ensuring that all of our students graduate prepared for college and future careers."
The new education reform law urges the 50 state governments to limit how many and how often students take tests. The law limits the high-stakes nature of the testing for underperforming schools. And the national government will not be able to tell states and communities how to evaluate schools and teacher performance.
But states and schools must still give reading and math exams in grades three through eight, and in high school. The states will have more authority in setting standards for the tests.
Congress passed the measure easily. Republicans and Democrats supported it.

No Child Left Behind
The new law replaces the No Child Left Behind measure approved in 2002. It called for extensive testing and standards set by the national government.
Parents, teachers and lawmakers found that policy unworkable. They said it gave Washington bureaucrats too much control over the country''s 100,000 public schools.
"This bill makes long overdue fixes to the last education law. It replaces a one-size-fits-all approach to reform," Obama said.
Republican Senator Lamar Alexander is one of the measure''s chief authors. He said, "This new law will result in fewer and better tests because states and classroom teachers will be deciding what to do about the results of the tests."
The law''s other key sponsor is Democratic Senator Patty Murray. She said the new focus will be on early childhood education. She added that minority and poor children will benefit, and get a better start in their earliest years of school.
I''m Jonathan Evans.', CAST(N'2015-12-18 08:54:25.443' AS DateTime))
INSERT [dbo].[Readings] ([ReadingId], [Title], [From], [Url], [Content], [Date]) VALUES (6040, N'This Holiday Season, Don''t Be A Scrooge! ', N'VOA', N'/audio/dont-be-a-scrooge[1].mp3', N'Hello! And welcome to the VOA Learning English program Words and Their Stories.
It is the holiday season in many parts of the world. Christmas is one of the most celebrated of those holidays. But even for those who do not celebrate Christmas, Christmas movies have become an American tradition.
Many fun expressions come from these movies. When Americans hear these expressions, they know exactly what they mean and the movies they come from.
On today''s show, we will explore two words that come from one of the most popular Christmas stories made into a movie: "A Christmas Carol." Writer Charles Dickens wrote "A Christmas Carol" in 1843. Ebenezer Scrooge is the main character of the story.
Scrooge is one of the most famous characters in English literature. And, the English language gained two words from "A Christmas Carol."
The first is simply the character''s name: Scrooge. Ebenezer Scrooge is mean. He is unwilling to share his money and good fortune. He hates people. And he hates Christmas.
In the English language, a scrooge – with a lowercase "s" – is a person who is unwilling to give to others. Others words with the same meaning are miserly and stingy.
Scrooges are selfish, and not just at Christmas time or the holidays. Here is an example sentence:
"Her father is such a scrooge. He will not pay for her college tuition even though he has tons of money!"
That father is a first-rate scrooge!
Now back to "A Christmas Carol." At the beginning of the story, Scrooge is a cold-hearted miser who hates Christmas.
Dickens describes Scrooge in this way:
"The cold within him froze his old features, nipped his pointed nose, made his eyes red, his thin lips blue, and spoke out shrewdly in his grating voice ..."
How much does Scrooge hate Christmas? This passage from the book describes how much.
"If I could work my will," said Scrooge indignantly, "every idiot who goes about with ''Merry Christmas'' on his lips, should be boiled with his own pudding, and buried with a stake of holly through his heart." 
This quote makes perfectly clear that Scrooge hates Christmas and all that it represents -- namely goodwill to fellow humans.
Scrooges'' catchphrase in the book and in the movies is "bah humbug!" As soon as you say "bah humbug" people know which story and which character you are talking about.
"Bah humbug" is usually used as a response to someone else''s Christmas cheer. For example, if someone asks you, "So, are you ready for Christmas?" and you say, "Christmas ... bah humbug!" that means you are not in the Christmas spirit and are probably not going to celebrate.
Anyone who says "bah humbug" is rejecting or showing disgust for Christmas. Sometimes it is said in fun. Sometimes it is not.
The story of "A Christmas Carol" is one of personal change, of turning over a new leaf, to use an idiom.
As the story goes, the hateful Scrooge is visited one night by three Ghosts of Christmas: Ghost of Christmas Past, Ghost of Christmas Present and Ghost of Christmas Yet to Come.
The ghosts educate Scrooge and the last lesson is terrifying.
But it works. Scrooge greets the new morning as a generous, kind person.
However, word history does not remember him that way. His name will live on to mean the exact opposite.
That''s language. And that''s another Words and Their Stories.
I''m Anna Matteo.', CAST(N'2015-12-21 09:05:32.980' AS DateTime))
SET IDENTITY_INSERT [dbo].[Readings] OFF
SET IDENTITY_INSERT [dbo].[Scores] ON 

INSERT [dbo].[Scores] ([ScoreId], [UserId], [SpellCount], [FalseSpell], [TransCount], [FalseTrans], [SCorrectRate], [TCorrectRate], [CorrectRate]) VALUES (1, 1, 10, 6, 10, 0, 0.4, 1, 0.7)
INSERT [dbo].[Scores] ([ScoreId], [UserId], [SpellCount], [FalseSpell], [TransCount], [FalseTrans], [SCorrectRate], [TCorrectRate], [CorrectRate]) VALUES (2, 2, 110, 72, 40, 20, 0.345454544, 0.5, 0.386666656)
INSERT [dbo].[Scores] ([ScoreId], [UserId], [SpellCount], [FalseSpell], [TransCount], [FalseTrans], [SCorrectRate], [TCorrectRate], [CorrectRate]) VALUES (3, 3, 10, 6, 0, 0, 0.4, 0, 0.4)
INSERT [dbo].[Scores] ([ScoreId], [UserId], [SpellCount], [FalseSpell], [TransCount], [FalseTrans], [SCorrectRate], [TCorrectRate], [CorrectRate]) VALUES (4, 13, 10, 7, 0, 0, 0.3, 0, 0.3)
INSERT [dbo].[Scores] ([ScoreId], [UserId], [SpellCount], [FalseSpell], [TransCount], [FalseTrans], [SCorrectRate], [TCorrectRate], [CorrectRate]) VALUES (5, 14, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Scores] ([ScoreId], [UserId], [SpellCount], [FalseSpell], [TransCount], [FalseTrans], [SCorrectRate], [TCorrectRate], [CorrectRate]) VALUES (6, 7, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Scores] ([ScoreId], [UserId], [SpellCount], [FalseSpell], [TransCount], [FalseTrans], [SCorrectRate], [TCorrectRate], [CorrectRate]) VALUES (7, 9, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Scores] ([ScoreId], [UserId], [SpellCount], [FalseSpell], [TransCount], [FalseTrans], [SCorrectRate], [TCorrectRate], [CorrectRate]) VALUES (9, 16, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Scores] OFF
SET IDENTITY_INSERT [dbo].[Spells] ON 

INSERT [dbo].[Spells] ([Id], [wordspell]) VALUES (1, N'concede')
INSERT [dbo].[Spells] ([Id], [wordspell]) VALUES (2, N'peculiarly')
INSERT [dbo].[Spells] ([Id], [wordspell]) VALUES (3, N'cyanide')
INSERT [dbo].[Spells] ([Id], [wordspell]) VALUES (4, N'cyanide')
SET IDENTITY_INSERT [dbo].[Spells] OFF
SET IDENTITY_INSERT [dbo].[Testeds] ON 

INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (31, 13, 60, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (32, 13, 18, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (33, 13, 12, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (34, 13, 47, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (35, 13, 44, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (36, 13, 1, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (37, 13, 48, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (38, 13, 29, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (39, 13, 3, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (40, 13, 16, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (41, 2, 53, 1)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (42, 2, 35, 1)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (43, 2, 61, 1)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (44, 2, 13, 1)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (45, 2, 64, 1)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (46, 2, 9, 1)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (47, 2, 26, 1)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (48, 2, 19, 1)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (49, 2, 28, 1)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (50, 2, 3, 1)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (51, 2, 71, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (52, 2, 146, 0)
INSERT [dbo].[Testeds] ([TestedId], [UserId], [WordId], [tag]) VALUES (53, 2, 163, 0)
SET IDENTITY_INSERT [dbo].[Testeds] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Name], [Password], [Age], [Sex], [Country], [Imgurl], [Power], [Status]) VALUES (1, N'Weslie', N'123', 12, N'male', N'Germany', N'/Photo/weslie.jpg', 0, 0)
INSERT [dbo].[Users] ([UserId], [Name], [Password], [Age], [Sex], [Country], [Imgurl], [Power], [Status]) VALUES (2, N'Wolffy', N'456', 34, N'male', N'Germany', N'/Photo/wolffy.jpg', 0, 0)
INSERT [dbo].[Users] ([UserId], [Name], [Password], [Age], [Sex], [Country], [Imgurl], [Power], [Status]) VALUES (3, N'Paddi', N'123', 11, N'male', N'Germany', N'/Photo/paddi.jpg', 1, 0)
INSERT [dbo].[Users] ([UserId], [Name], [Password], [Age], [Sex], [Country], [Imgurl], [Power], [Status]) VALUES (7, N'Sparky', N'123', 12, N'male', N'Germany', N'/Photo/sparky.jpg', 0, 0)
INSERT [dbo].[Users] ([UserId], [Name], [Password], [Age], [Sex], [Country], [Imgurl], [Power], [Status]) VALUES (9, N'Tibby', N'123', 11, N'female', N'Germany', N'/Photo/tibby.jpg', 0, 0)
INSERT [dbo].[Users] ([UserId], [Name], [Password], [Age], [Sex], [Country], [Imgurl], [Power], [Status]) VALUES (13, N'Wilie', N'456', 5, N'male', N'Germany', N'/Photo/Wilie.jpg', 0, 0)
INSERT [dbo].[Users] ([UserId], [Name], [Password], [Age], [Sex], [Country], [Imgurl], [Power], [Status]) VALUES (14, N'AngelaLily', N'456', 4, N'female', N'Germany', N'/Photo/Angelalily.jpg', 0, 0)
INSERT [dbo].[Users] ([UserId], [Name], [Password], [Age], [Sex], [Country], [Imgurl], [Power], [Status]) VALUES (16, N'Wolnie', N'456', 33, N'female', N'Germany', N'/Photo/Wolnie.jpg', 0, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Words] ON 

INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1, N'concede', N'v.', N'%5bk%c9%99n%cb%88si%3ad%5d', N'承认; 让步，容许; 承让;', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2, N'peculiarly', N'adv.', N'%5bp%c9%aa%cb%88kju%3ali%c9%99li%5d', N'异常地; 尤其地; 古怪地; 单独地;', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (3, N'cyanide', N'n.', N'%5b%cb%88sa%c9%aa%c9%99na%c9%aad%5d', N'<化>氰化物; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5, N'segment', N'n.', N'%5b%cb%88segm%c9%99nt%5d', N'环节; 部分，段落; [计算机]（字符等的）分段; [动物学]节片;', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (6, N'bigwig', N'n.', N'%5b%cb%88b%c9%aagw%c9%aag%5d', N'<口>要人，有重大影响的人;', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (7, N'drone', N'n.', N'%5bdr%c9%99%ca%8an%5d', N'雄蜂; 无人驾驶飞机; 嗡嗡声; 持续低音; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (8, N'critical', N'adj.', N'%5b%cb%88kr%c9%aat%c9%aakl%5d', N'关键的; 批评的，爱挑剔的; 严重的; 极重要的; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (9, N'drone', N'v.', N'%5bdr%c9%99%ca%8an%5d', N'嗡嗡叫; 嗡嗡响; 絮絮叨叨地说; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (10, N'sodium', N'n.', N'%5b%cb%88s%c9%99%ca%8adi%c9%99m%5d', N'<化>钠(11号元素，符号 Na); ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (12, N'logistics', N'n. ', N'%5bl%c9%99%cb%88d%ca%92%c9%aast%c9%aaks%5d+', N'物流; 后勤; 逻辑学; 组织工作; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (13, N'custody', N'n.', N'%5b%cb%88k%ca%8cst%c9%99di%5d', N'监管; 拘留，羁押; 抚养权，监护权; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (14, N'liable', N'adj.', N'%5b%cb%88la%c9%aa%c9%99bl%5d', N'有责任的; 有义务的; 有…倾向的; 易…的; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (15, N'phalanx', N'n.', N'%5b%cb%88f%c3%a6l%c3%a6%c5%8bks%5d', N'方阵; 趾骨; 密集队; 密集人群; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (16, N'corn', N'n.', N'%5bk%c9%94%3an%5d', N'<英>谷物; <美>玉米;', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (18, N'Weslie', N'n.', N'%5bwesl%c9%aa%5d', N'喜羊羊', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (19, N'Wolffy', N'n.', N'%5bw%ca%8alf%c9%aa%5d', N'灰太狼', N'Marry with Wolffy.
要嫁就嫁灰太狼。
Wolffy has nothing to do but try to catch the goats and please his wife
灰太狼一心一意的抓羊和让老婆开心。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (20, N'cyanide', N'vt.', N'%5b%cb%88sa%c9%aa%c9%99na%c9%aad%5d', N'用氰化法处理;  ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (21, N'image', N'n.', N'%5b%cb%88%c9%aam%c9%aad%ca%92%5d', N'图像; 肖像;形象; 概念，意向; 镜像，映像; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (22, N'image', N'vt.', N'%5b%cb%88%c9%aam%c9%aad%ca%92%5d', N'反映; 想像; 作…的像; 象征; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (23, N'stock', N'n.', N'%5bst%c9%92k%5d', N'股份，股票; 库存; 树干; 家畜; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (24, N'stock', N'adj.', N'%5bst%c9%92k%5d', N'常备的，存货的; 陈旧的; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (25, N'stock', N'vt.', N'%5bst%c9%92k%5d', N'提供货物; 备有; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (26, N'stock', N'vi.', N'%5bst%c9%92k%5d', N'出新芽; 囤积; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (28, N'pest', N'n.', N'%5bpest%5d', N'害虫;讨厌的人或事; 有害动植物; 瘟疫; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (29, N'eradication', N'n.', N'%5b%c9%aa%cb%8cr%c3%a6d%c9%aa%27ke%c9%aa%ca%83n%5d', N'摧毁，根除; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (30, N'contagious', N'adj.', N'%5bk%c9%99n%cb%88te%c9%aad%ca%92%c9%99s%5d', N'有传染性的; 传染病的; 有感染力的; 会蔓延的; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (31, N'surveillance', N'n.', N'%5bs%c9%9c%3a%cb%88ve%c9%aal%c9%99ns%5d', N'盯梢，监督; [法]管制，监视;', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (32, N'livelihood', N'n.', N'%5b%cb%88la%c9%aavlih%ca%8ad%5d', N'生活，生计; 谋生之道; 营生; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (33, N'vulnerable', N'adj.', N'%5b%cb%88v%ca%8cln%c9%99r%c9%99bl%5d', N'易受攻击的; 易受伤的; 易受批评的; [桥牌]已成局的; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (34, N'famine', N'n.', N'%5b%cb%88f%c3%a6m%c9%aan%5d', N'饥荒; 饥饿; 极度缺乏; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (35, N'milestone', N'n.', N'%5b%cb%88ma%c9%aalst%c9%99%ca%8an%5d', N'里程碑; 划时代事件; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (36, N'visible', N'adj.', N'%5b%cb%88v%c9%aaz%c9%99bl%5d', N'看得见的; 显然的; 可察觉到的; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (37, N'invisible', N'adj.', N'%5b%c9%aan%cb%88v%c9%aaz%c9%99bl%5d', N'看不见的;隐匿的; 无形的; 不引人注目的; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (38, N'invisible', N'n.', N'%5b%c9%aan%cb%88v%c9%aaz%c9%99bl%5d', N'看不见的人; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (39, N'monarch', N'n.', N'%5b%cb%88m%c9%92n%c9%99k%5d', N'君主，帝王; 最高统治者;', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (40, N'occasion', N'n.', N'%5b%c9%99%cb%88ke%c9%aa%ca%92n%5d', N'场合; 机会，时机; 理由; 需要; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (41, N'occasion', N'vt.', N'%5b%c9%99%cb%88ke%c9%aa%ca%92n%5d', N'惹起，引起; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (42, N'crawl', N'vi.', N'%5bkr%c9%94%3al%5d', N'爬行; 缓慢行进; 巴结; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (43, N'crawl', N'n.', N'%5bkr%c9%94%3al%5d', N'缓慢的爬行; 〈美俚〉跳舞，自由式游泳; 养鱼（龟）池; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (44, N'tolerance', N'n.', N'%5b%cb%88t%c9%92l%c9%99r%c9%99ns%5d', N'公差; 宽容，容忍; 限度; 耐药量，耐药性; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (45, N'mutate', N'v.', N'%5bmju%3a%cb%88te%c9%aat%5d', N'变异; 突变; 改变; （使某物）变化; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (46, N'prescribe', N'vt.', N'%5bpr%c9%aa%cb%88skra%c9%aab%5d', N'指定，规定; 指定，规定; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (47, N'prescribe', N'vi.', N'%5bpr%c9%aa%cb%88skra%c9%aab%5d', N'建立规定，法律或指示; 开处方，给医嘱;', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (48, N'desiccate', N'vt.', N'%5b%27des%c9%aa%cb%8cke%c9%aat%5d', N'弄干，使脱水; 使失水; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (49, N'shrivel', N'v.', N'%5b%cb%88%ca%83r%c9%aavl%5d', N'（因热力，严寒、干燥、年老等而）枯萎，皱缩; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (50, N'migrant', N'n.', N'%5b%cb%88ma%c9%aagr%c9%99nt%5d', N'候鸟; 移居者，移民;  ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (51, N'migrant', N'adj.', N'%5b%cb%88ma%c9%aagr%c9%99nt%5d', N'移居的; 流浪的; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (53, N'restore', N'vt.', N'%5br%c9%aa%cb%88st%c9%94%3a(r)%5d', N'修复; 归还; 交还; 使恢复; 使复原; 使复位; 使复职', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (54, N'restore', N' vi.', N'%5br%c9%aa%cb%88st%c9%94%3a(r)%5d', N'恢复（某种情况或感受）; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (57, N'elevated', N'adj.', N'%5b%cb%88el%c9%aave%c9%aat%c9%aad%5d', N'升高的; 高层的; 高尚的; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (58, N'elevated', N'n.', N'%5b%cb%88el%c9%aave%c9%aat%c9%aad%5d', N'<美><口>高架铁路; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (59, N'elevated', N'v.', N'%5b%cb%88el%c9%aave%c9%aat%c9%aad%5d', N'提升; 提高; 举起( elevate的过去式和过去分词 ); 鼓舞; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (60, N'toxic', N'n.', N'%5b%cb%88t%c9%92ks%c9%aak%5d', N'毒物; 毒剂; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (61, N'filter', N'n.', N'%5b%cb%88f%c9%aalt%c9%99(r)%5d', N'滤波器; 滤光器; 滤色镜; [化] 过滤器; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (62, N'filter', N'v.', N'%5b%cb%88f%c9%aalt%c9%99(r)%5d', N'过滤; 透过; 渗透; 滤除; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (63, N'concentrated', N'adj.', N'%5b%cb%88k%c9%92nsntre%c9%aat%c9%aad%5d', N'集中的; 浓缩的; 全神贯注的; 汰选出来的; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (64, N'pattern', N'n.', N'%5b%cb%88p%c3%a6tn%5d', N'模式; 花样，样品; 图案; 榜样，典范; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (65, N'insulin', N'n.', N'%5b%cb%88%c9%aansj%c9%99l%c9%aan%5d', N'胰岛素; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (66, N'injection', N'n.', N'%5b%c9%aan%cb%88d%ca%92ek%ca%83n%5d', N'注射; 注射剂; [医]充血; （卫星等的）入轨; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (67, N'address', N'n.', N'%5b%c9%99%27dres%5d', N'住址；网址；电子邮箱地址；称呼；致词；讲话；谈吐', N'Please write your home address on the registration form.
请在这张登记表上写下你的家庭住址。
The president gave an address over the radio.
总统发表广播演讲。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (68, N'address', N'v.', N'%5b%c9%99%27dres%5d', N'称呼；发表演说；提出；写地址；处理', N'Most people call me Bob. How do I address you?
大家叫我鲍勃,我怎么称呼你?')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (69, N'deforestation', N'n.', N'%5b%cb%8cdi%cb%90%cb%8cf%c9%92r%c9%aa%27ste%c9%aa%ca%83n%5d', N'森林开伐；滥伐森林', N'The quickest solution to deforestation would be to simply stop cutting down trees.
停止森林开伐是森林资源退化的最快解决方案。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (70, N'village', N'n.', N'%5b%27v%c9%aal%c9%aad%ca%92%5d', N'村庄，乡村，村', N'This village is as beautiful as the fairyland.
这个小村庄美如仙境。
There are two main nationalities in our village.
我们村子有两大民族。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (71, N'data', N'n.', N'%5b%27de%c9%aat%c9%99%5d', N'数据；资料', N'The data should be updated once a week.
这些数据应该每星期更新一次。
In Name, type a name for the data source.
在“名称”中,为数据源键入名称。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (72, N'analysis', N'n.', N'%5b%c9%99%27n%c3%a6l%c9%99s%c9%aas%5d', N'分析；解析', N'His analysis of the problem showed great perception.
他对该问题的分析显示出敏锐的洞察力。
We agreed with his acute analysis of the political situation.
我们都同意他对政治形势的深刻分析。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (73, N'convert', N'v.', N'%5bk%c9%99n%27v%c9%9c%cb%90t%5d%09', N'(使)转变；使…改变信仰；转化；兑换；换算', N'The solar cell can convert the energy of sunlight into electric energy.
太阳能电池能把阳光的能量转化为电能。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (74, N'convert', N'n.', N'%5bk%c9%99n%27v%c9%9c%cb%90t%5d', N'皈依者；改变信仰的人', N'He is a recent convert to Christianity.
他最近改信基督教了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (75, N'significant', N'adj.', N'%5bs%c9%aa%c9%a1%27n%c9%aaf%c9%aak%c9%99nt%5d', N'重要的；有意义的；意味深长的；显著的', N'Economic conditions are significant in many ways.
经济条件在许多方面都是很重要的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (76, N'software', N'n.', N'%5b%27s%c9%92ftwe%c9%99(r)%5d', N'软件', N'There are many sorts of software in my computer.
我的计算机里有很多软件')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (77, N'intentionally', N'adv.', N'%5b%c9%aan%27ten%ca%83%c9%99n%c9%99li%5d', N'有意地；故意地', N'Sometimes, the voltage may be varied intentionally to determine the voltage dependence of an insulator.
有的时候，我们有意地改变电压，以确定绝缘体电阻率对电压的依赖关系。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (78, N'alien', N'n.', N'%5b%27e%c9%aali%c9%99n%5d', N'外星人；外侨；外国人', N'I followed the alien to see where it was to go.
我跟着外星人看它朝哪儿去。
Immigrant workers were classed as resident aliens.
移民来的工人已归入外侨类。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (79, N'extraterrestrial', N'adj.', N'%5b%cb%8cekstr%c9%99t%c9%99%27restri%c9%99l%5d', N'地球(或其大气圈)外的；行星际的', N'Extraterrestrial life has often become the subject of science fiction films.
科幻片经常以外星生命为主题。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (80, N'advanced', N'adj.', N'%5b%c9%99d%27v%c9%91%cb%90nst%5d', N'先进的；高级的', N'England is an advanced industrial country.
英国是一个发达的工业国家。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (81, N'decay', N'vt.', N'%5bd%c9%aa%27ke%c9%aa%5d', N'(使)衰退；(使)腐败；(使)腐烂', N'The vegetables have begun to decay.
那些蔬菜已开始腐烂。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (82, N'decay', N'n.', N'%5bd%c9%aa%27ke%c9%aa%5d', N'衰退；腐烂；腐败', N'Bacteria complete the job by causing decay.
细菌通过引起腐烂而完成这个变化。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (83, N'implication', N'n.', N'%5b%cb%8c%c9%aampl%c9%aa%27ke%c9%aa%ca%83n%5d', N'暗示；牵连；含意；卷入', N'The new report has far-reaching implications for the future of broadcasting.
这一新报告对广播业的前途有些意味深长的暗示。
The trial resulted in the implication of several major figures in the organization.
审讯结果表明这个组织中几个主要人物都牵连在案。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (84, N'trigger', N'n.', N'%5b%cb%88tr%c9%aag%c9%99(r)%5d', N'扳机; 扳柄; 引发其他事件的一件事; 触发器，触发电器; ', N'But he never pulled the trigger.
但是他没扣动扳机。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (85, N'trigger', N'vt.', N'%5b%cb%88tr%c9%aag%c9%99(r)%5d', N'引发，触发; 扣扳机;', N'Incorrect code will trigger self-destruct.
错误的密码会引起自我破坏.')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (86, N'bequest', N'n.', N'%5bb%c9%aa%27kwest%5d', N'遗产；遗赠物', N'He left a bequest to each of his grandchildren.
他给他的孙子孙女每人留下一笔遗产。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (87, N'statistic', N'n.', N'%5bst%c9%99%cb%88t%c9%aast%c9%aak%5d', N'统计量; 统计资料中的一项;统计论; ', N'You want to hear another strange statistic?
想听另外一些奇怪的数据吗？')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (88, N'convey', N'vt.', N'%5bk%c9%99n%cb%88ve%c9%aa%5d', N'传达，传递; 运送，输送; [法]让与，转让（财产等）; 表达;', N'Would you like me to convey that to the president?
你想要我向总统传达你的意思吗？
How do you convey everything with just a look?
你怎么做到通过一个表情表达一切？')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (89, N'tend', N'vt.', N'%5btend%5d', N'照料，照顾; 护理; 照管，管理;', N'They tend to close up ranks.
他们倾向保护自己。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (90, N'currency', N'n.', N'%5b%cb%88k%ca%8cr%c9%99nsi%5d', N'货币; 通用，流通，流传，传播; 市价，行情; 流通时间;', N'Taxi 720 to prague metro, might only currency 20 euros.
出租车720给布拉格大都市，货币可能只20欧元。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (91, N'transparent', N'adj.', N'%5btr%c3%a6ns%27p%c3%a6r%c9%99nt%5d', N'透明的；明显的；清晰的', N'Plain glass is transparent.
普通的白玻璃是透明的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (92, N'inconclusive', N'adj.', N'%5b%cb%8c%c9%aank%c9%99n%27klu%cb%90s%c9%aav%5d', N'非决定性的；不确定的；无说服力的', N'he first vote in April was inconclusive, and a second round was eventually ruled illegal and nullified.
四月的第一次选举是非决定性的，第二轮选举被裁定为无效非法的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (93, N'conclusive', N'adj.', N'%5bk%c9%99n%27klu%cb%90s%c9%aav%5d', N'决定性的；确实的；结论性的', N'It was not a war that promised a conclusive end.
那并不是一场指望有决定性结果的战争。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (94, N'consumer', N'n.', N'%5bk%c9%99n%27sju%cb%90m%c9%99%5d%09', N'消费者；用户；消费品', N'We need more feedback from the consumer in order to improve our goods.
我们需要从消费者那里多得到些反馈信息以提高产品质量。
The price increases were passed on by the firm to the consumers.
那个公司把上涨的费用都转嫁到了消费者身上。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (95, N'distribute', N'v.', N'%5bd%c9%aa%27str%c9%aabju%cb%90t%5d', N'分配；散发；分布', N'Please distribute books among the students.
把书发给学生。
We distribute handbills on the street every weekend.
我们每周都要在街上散发传单。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (96, N'infer', N'vt.', N'%5b%c9%aan%27f%c9%9c%cb%90(r)%5d', N'推断；猜测；暗示', N'We can infer the meaning of the word in the context.
我们可以从上下文中推断这个词的含义。
They infer a conclusion from the facts.
他们从事实中推断出结论。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (97, N'infer', N'vi.', N'%5b%c9%aan%27f%c9%9c%cb%90(r)%5d', N'作出推论', N'We can infer from his expression that he is frustrated.
我们可以从他的表情中推断出他很沮丧。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (98, N'household', N'n.', N'%5b%27ha%ca%8ash%c9%99%ca%8ald%5d', N'家庭；户', N'The whole household got up early last Sunday.
上个星期天全家人都起得很早。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (99, N'household', N'adj.', N'%5b%27ha%ca%8ash%c9%99%ca%8ald%5d', N'家庭的；家喻户晓的', N'I disputed with my wife on household expenses.
我跟太太争论有关家庭费用的问题。
Microsoft has become a household word.
微软已经成为一个家喻户晓的名词。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (100, N'survey', N'n.', N'%5b%27s%c9%9c%cb%90ve%c9%aa%5d', N'问卷；测量；调查；纵览；视察', N'The surveyor made a survey of the land.
测量员对土地进行了测量。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (101, N'survey', N'v.', N'%5b%27s%c9%9c%cb%90ve%c9%aa%5d', N'调查；审视；研究；测量；勘定；环视', N'For this book, the author has surveyed recent developments in linguistics.
为了写这本书,作者研究了语言学目前的发展情况。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (102, N'compliment', N'n.', N'%5b%27k%c9%92mpl%c9%aam%c9%99nt%5d', N'称赞；恭维；(复数)致意', N'I feel greatly flattered at your compliment.
我对你的称赞感到受宠若惊。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (103, N'compliment', N'vt.', N'%5b%27k%c9%92mpl%c9%aam%c9%99nt%5d', N'恭维；称赞', N'He complimented her on her new dress without even looking at it.
他连看都没看一眼，就称颂她的新衣服。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (104, N'habit', N'n.', N'%5b%cb%88h%c3%a6b%c9%aat%5d', N'习惯，习性; 气质; 宗教服装;', N'They were in the habit of giving two or three dinner parties a month.
他们每月举办两三次宴会，都成习惯了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (105, N'conduct', N'v.', N'%5bk%c9%99n%cb%88d%ca%8ckt%5d', N'传导; 引导; 带领; 控制;实施; 执行', N'I decided to conduct an experiment.
我决定进行一次实验。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (106, N'conduct', N'n.', N'%5bk%c9%99n%cb%88d%ca%8ckt%5d', N'行为; 举止; 管理（方式）; 实施（方式）; ', N'For Europeans, the law is a statement of basic principles of civilised conduct.
对于欧洲人来说，法律是对基本文明行为准则的表述。')
GO
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (107, N'tobacco', N'n.', N'%5bt%c9%99%cb%88b%c3%a6k%c9%99%ca%8a%5d', N'卷烟; 烟草，烟叶; 烟草制品; 纸烟;', N'Try to do without tobacco and alcohol.
尽量不要抽烟喝酒。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (108, N'fashionable', N'adj. ', N'%5b%cb%88f%c3%a6%ca%83n%c9%99bl%5d', N'流行的; 时髦的，符合时尚的; 时髦人物使用的; （尤指）有钱人常光顾的', N'Entrepreneurs developed fashionable restaurants and bars in the area.
实业家在这一地区建起了许多时尚的餐馆和酒吧。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (109, N'fashionable', N'n. ', N'%5b%cb%88f%c3%a6%ca%83n%c9%99bl%5d', N'时髦的人; ', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (110, N'speculation', N'n.', N'%5b%cb%8cspekju%27le%c9%aa%ca%83n%5d', N'推测；投机；沉思', N'They have much speculation over the cause of the air crash.
他们对飞机坠毁原因有多方推测。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (111, N'outpouring', N'n.', N'%5b%27a%ca%8atp%c9%94%cb%90r%c9%aa%c5%8b%5d', N'流露；涌现', N'Everyone has just had such an outpouring of camaraderie with each other.
每个人都流露出友谊的神情。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (112, N'anxiety', N'n.', N'%5b%c3%a6%c5%8b%27za%c9%aa%c9%99ti%5d', N'焦虑；担心；渴望', N'They show great anxiety concerning their retirement allowance.
他们对自己的养老金问题显得十分焦虑。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (113, N'category', N'n.', N'%5b%27k%c3%a6t%c9%99%c9%a1%c9%99ri%5d', N'种类；类别；范畴', N'There are different categories of books in a library.
图书馆里有各种不同种类的书籍。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (114, N'fraud', N'n.', N'%5bfr%c9%94%cb%90d%5d', N'欺骗；诈欺；骗子', N'Investigation of fraud was their commission.
调查诈欺舞弊是他们的任务。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (115, N'pandemic', N'adj.', N'%5bp%c3%a6n%27dem%c9%aak%5d', N'全国流行的', N'Vaccines effective against a pandemic virus are not yet available.
目前仍没有可有效预防流感大流行的疫苗。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (116, N'pandemic', N'n.', N'%5bp%c3%a6n%27dem%c9%aak%5d', N'流行病', N'The flu was arrested before it became a pandemic.
流感在变成流行病之前被控制住了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (117, N'attractive', N'adj.', N'%5b%c9%99%27tr%c3%a6kt%c9%aav%5d', N'有吸引力的；有魅力的', N'Ice-cream is attractive to children.
冰淇淋对孩子们非常有吸引力。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (118, N'preference', N'n.', N'%5b%27prefr%c9%99ns%5d', N'偏爱；优先；喜爱物；优惠', N'She has a preference for blue.
她特别喜欢蓝色。
It''s entirely a matter of preference.
这完全是个见仁见智的问题。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (119, N'unique', N'adj.', N'%5bju%27ni%cb%90k%5d', N'独特的；独一无二的；稀罕的', N'The elephant''s trunk is a unique form of appendage.
象的鼻子是一种独特的附肢。
It''s a unique work of art.
这是独一无二的艺术作品。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (120, N'fossil', N'n.', N'%5b%27f%c9%92sl%5d', N'化石；食古不化的人；守旧的事物', N'This fossil may be over 2 million years old.
这化石可能超过二百万年了。
Professor Baboon is not an old fossil.
巴布恩教授不是落伍的人。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (121, N'transmit', N'vt.', N'%5btr%c3%a6ns%27m%c9%aat%5d', N'传达；传染；传送；代代相传', N'This infection is transmitted by mosquitoes.
这种传染病是由蚊子传染的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (122, N'transmit', N'vi.', N'%5btr%c3%a6ns%27m%c9%aat%5d', N'(以无线电或有线电的方式)发送信号', N'This photo is too large to transmit at one time.
这相片太大，一次没法发出。
The World Cup final is being transmitted live to over fifty countries.
世界杯决赛现在正向五十多个国家现场转播。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (123, N'gene', N'n.', N'%5bd%ca%92i%cb%90n%5d', N'基因', N'The position that a given gene occupies on a chromosome.
基因座在一条染色体上某种给定基因所占的位置')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (124, N'outbreak', N'n.', N'%5b%27a%ca%8atbre%c9%aak%5d', N'爆发；暴动', N'There has been an outbreak of typhoid.
那儿正爆发伤寒。
The research project fetched up because of the outbreak of the war.
由于战争爆发，这个研究计划搁浅了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (125, N'flee', N'vi.', N'%5bfli%cb%90%5d', N'逃走；消失；逃避；(时间)飞逝', N'He tried to flee from the police in a stolen car.
他企图驾驶一辆偷来的车从警察局逃走。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (126, N'flee', N'vt.', N'%5bfli%cb%90%5d', N'逃离', N'Many refugees have been forced to flee their homeland.
很多难民被迫逃离了祖国。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (127, N'rare', N'adj.', N'%5bre%c9%99(r)%5d', N'罕见的；珍贵的；煎得嫩的', N'It was in the days when motorcars were rare.
那是在汽车还罕见的时代。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (128, N'stowaway', N'n.', N'%5b%27st%c9%99%ca%8a%c9%99we%c9%aa%5d', N'逃票乘客；收藏处', N'The crew discovered the stowaway about two days into their voyage.
船员发现这个逃票者已经呆了两天的航程。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (129, N'bowel', N'n.', N'+%5b%27ba%ca%8a%c9%99l%5d', N'肠；内部', N'Do you have a bowel movement today?
你今天上过厕所吗？
Her bowel will engorge quite often, I''m afraid.
她的肠将会经常充血,我害怕。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (130, N'sufficient', N'adj.', N'%5bs%c9%99%27f%c9%aa%ca%83nt%5d', N'足够的；充分的', N'The money I have saved is sufficient for buying a car.
我所存的钱足以买一辆汽车。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (131, N'carcinogenic', N'adj.', N'%5b%cb%8ck%c9%91%cb%90s%c9%aan%c9%99%27d%ca%92en%c9%aak%5d', N'致癌的', N'Didn''t you know smoking is carcinogenic?
你不知道抽烟会致癌吗?
The compound poses a significant carcinogenic hazard for humans.
这种化合物给人类造成了明显的致癌危害。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (132, N'broad', N'adj.', N'%5bbr%c9%94%cb%90d%5d', N'宽广的；清楚无误的；明显的；胸怀开阔的；粗俗的', N'The broad steps in front of the mansion made it look very dignified.
宽阔的台阶使大厦的正面显得很气派。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (133, N'petition', N'n.', N'%5bp%c9%99%27t%c9%aa%ca%83n%5d', N'请愿书；祈求；申请', N'They signed a petition in support of the workers'' demands.
他们在请愿书上签名，支持工人的请求。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (134, N'petition', N'vi.', N'%5bp%c9%99%27t%c9%aa%ca%83n%5d', N'请愿；祈求', N'I can petition for Junie''s custody.
我可以申请做琼妮的监护人。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (135, N'petition', N'vt.', N'%5bp%c9%99%27t%c9%aa%ca%83n%5d', N'向 ... 请愿，请求', N'She petitioned her neighbor to turn down the radio.
她请求邻居把收音机关小点声。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (136, N'tenant', N'n.', N'%5b%27ten%c9%99nt%5d', N'房客；佃户；承租人；<律>占用者', N'The desk was left by the previous tenant.
这张桌子是前面房客留下的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (137, N'tenant', N'vt.', N'%5b%27ten%c9%99nt%5d', N'租赁；租借', N'I will tenant my building out during the summer vocation.
我会在暑假期间把房子租出去。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (138, N'penalty', N'n.', N'%5b%27pen%c9%99lti%5d', N'处罚；惩罚；不利；罚球', N'A penalty clause was written into the contract.
在合同中写入了一项罚款条款。
One of the penalties of fame is that people point at you on the street.
当了名人的麻烦之一是在街上被人指指点点。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (140, N'regulator', N'n.', N'%5b%27re%c9%a1jule%c9%aat%c9%99(r)%5d', N'调整者；调整器；监管机构', N'Will government maintain its role of watchdog and regulator?
政府会继续起到监察者和调控者的作用吗?')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (141, N'amendment', N'n.', N'%5b%c9%99%27mendm%c9%99nt%5d', N'修正；修正案；改进', N'The amendment is an appendage of that contract.
这个修改案是那个合同的附件。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (142, N'personnel', N'n.', N'%5b%cb%8cp%c9%9c%cb%90s%c9%99%27nel%5d', N'职员；人事部门', N'1.The personnel are not happy to change these rules.
全体工作人员对改变这些规定很不高兴。
2.Army personnel are often forbidden to fraternize with the civilian population.
军职人员常被禁止与平民百姓友好往来。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (143, N'militant', N'adj.', N'%5b%27m%c9%aal%c9%aat%c9%99nt%5d', N'好战的；积极从事或支持使用武力的', N'We have never been so inspired and militant.
我们从来没有像现在这样意气风发,斗志昂扬。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (144, N'militant', N'n.', N'%5b%27m%c9%aal%c9%aat%c9%99nt%5d', N'斗士；激进分子', N'His writings are marked by a militant spirit.
他的著作的特点是有战斗精神。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (145, N'stability', N'n.', N'%5bst%c9%99%27b%c9%aal%c9%99ti%5d', N'稳定性；', N'The government has taken a measure to maintain the stability of prices.
政府已经采取了措施以确保物价稳定。
The question of stability of an equilibrium is very important.
一个平衡点的稳定性问题是非常重要的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (146, N'benefit', N'n.', N'%5b%27ben%c9%aaf%c9%aat%5d', N'利益；津贴；义演；保险金；借助', N'It was for the benefit of your company that we did that.
我们这样做都是为了你们公司的利益。
Applications for unemployment benefits dropped last month.
上个月申请失业津贴的人数下降了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (147, N'benefit', N'vt.', N'%5b%27ben%c9%aaf%c9%aat%5d', N'有益于；得益', N'The new hospital will benefit the entire community.
新医院将有益于整个社区。
A large number of students will benefit from the new teaching method.
多数学生将从这个新的教学方法中得益。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (148, N'captive', N'n.', N'%5b%27k%c3%a6pt%c9%aav%5d', N'俘虏；迷恋者', N'We were held captive for three months.
我们当了三个月俘虏。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (149, N'captive', N'adj.', N'%5b%27k%c3%a6pt%c9%aav%5d', N'被俘的；被迷住的', N'If a hero is of any importance, Homer also mentions the captive girl with whom he shares his tent and his bed.
荷马的史诗每提到一个重要的英雄，都要讲到同他共享帐篷和枕席的被俘的姑娘。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (150, N'ratio', N'n.', N'%5b%27re%c9%aa%ca%83i%c9%99%ca%8a%5d', N'比率；比例', N'The ratios of 1 to 5 and 20 to 100 are the same.
1与5之比和20与100之比相同。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (151, N'exacerbate', N'vt.', N'%5b%c9%aa%c9%a1%27z%c3%a6s%c9%99be%c9%aat%5d', N'加重(使 ... 恶化；激怒)', N'Scratching exacerbates a skin rash.
皮疹搔後会恶化。
China''s older air-traffic-control systems exacerbate the delays.
中国陈旧的空中交通控制系统更是雪上加霜。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (152, N'aggregate', N'n.', N'%5b%27%c3%a6%c9%a1r%c9%aa%c9%a1%c9%99t%5d', N'总计；进球总数；集料', N'The tax increases will, in the aggregate, cause much hardship.
增加税收归结起来将造成很多困难。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (153, N'flashpoint', N'n.', N'%5b%27fl%c3%a6%ca%83p%c9%94%c9%aant%5d', N'燃点；爆发点；触发点；导火线，导火索', N'Tension in the city is rapidly reaching flashpoint.
这座城市处于紧张状态，大有一触即发之势。
Community unrest is rapidly approaching the flashpoint.
群众的不安定情绪已接近一触即发之势.
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (154, N'environment', N'n.', N'%5b%c9%aan%27va%c9%aar%c9%99nm%c9%99nt%5d', N'环境；外界', N'She is not used to the new environment.
她对新环境不习惯。
We are required by environment protecting department to use anthracite.
环保部门要求我们使用无烟煤。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (156, N'dependency', N'n.', N'%5bd%c9%aa%27pend%c9%99nsi%5d', N'依赖；属国；从属物', N'This plan would reduce pollution and America''s dependency on oil.
这个计划将会减少污染以及美国对石油的依赖性。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (157, N'sickening', N'adj.', N'%5b%27s%c9%aak%c9%99n%c9%aa%c5%8b%5d', N'引起疾病的', N'The car hit the tree with a sickening crash.
那辆汽车撞在树上发出让人难受的撞击声。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (158, N'notify', N'v.', N'%5b%27n%c9%99%ca%8at%c9%aafa%c9%aa%5d', N'通知；报告；通告 	', N'Please notify us of any change of address.
地址如有变动，请通知我们。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (159, N'network', N'n.', N'%5b%27netw%c9%9c%cb%90k%5d', N'网点；网络；网状系统；广播公司', N'The fabrics are merchandised through a network of dealers.
通过经销网点销售纺织品。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (160, N'app', N'abbr.', N'%5b%c3%a6p%5d%09', N'应用程序（=application）', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (161, N'mobile', N'adj.', N'%5b%27m%c9%99%ca%8aba%c9%aal%5d', N'移动的；易变的；活动的', N'Additionally, consumers continue to embrace mobile personal devices.
此外,消费者接受移动个人设备的热情依然不减')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (162, N'mobile', N'n.', N'%5b%27m%c9%99%ca%8aba%c9%aal%5d', N'<美>汽车；可动雕塑；悬挂饰物；活动物体', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (163, N'optimistic', N'adj.', N'%5b%cb%8c%c9%92pt%c9%aa%27m%c9%aast%c9%aak%5d', N'乐观的；乐观主义的', N'The stockholders are optimistic about the company''s future.
股东对公司的前景很乐观。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (164, N'site', N'n.', N'%5bsa%c9%aat%5d', N'地点；位置；现场', N'That sale precludes further development on this site.
卖出以后妨碍了这一地点的进一步发展。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (165, N'site', N'vt.', N'%5bsa%c9%aat%5d', N'使 ... 位于', N'Is it safe to site the power station here?
在这建造发电厂安全吗？')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (166, N'subscribe', N'vt.', N'%5bs%c9%99b%27skra%c9%aab%5d', N'订阅；签名；支持；捐赠；同意', N'I subscribe to" Reader''s Digest" magazine.
我订了《读者文摘》杂志。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (167, N'online', N'adj.', N'%5b%cb%8c%c9%92n%27la%c9%aan%5d', N'联机的；在线的', N'The computer might not support online working.
计算机不能承载联机工作。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (168, N'online', N'adv.', N'%5b%cb%8c%c9%92n%27la%c9%aan%5d', N'在线地', N'It is faster if you apply online.
如果您是在线申请，那是非常快的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (169, N'reference', N'n.', N'%5b%27refr%c9%99ns%5d', N'参考；参照；出处；推荐人；推荐函', N'This book is for reference only.
这本书仅供参考。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (170, N'reference', N'v.', N'%5b%27refr%c9%99ns%5d', N'注明出处；附参考资料', N'Paraphrasing is not direct quotation, but you still need to reference it.
意译不是直接引用
Each chapter is referenced in minute detail.
每一章后面都附有极为详尽的参考资料。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (171, N'solace', N'n.', N'%5b%27s%c9%92l%c9%99s%5d', N'安慰；慰藉', N'The sick man found solace in music.
那男病人从音乐中获得了安慰。
I''m afraid he took his solace in drink.
恐怕他是借酒浇愁。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (172, N'phenomenon', N'n.', N'%5bf%c9%99%27n%c9%92m%c9%aan%c9%99n%5d', N'奇迹；现象；奇人；奇事', N'Their so-called prosperity is only a temporary phenomenon.
但他们所谓的繁荣只是一个暂时的现象。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (173, N'blockbuster', N'n.', N'%5b%27bl%c9%92kb%ca%8cst%c9%99(r)%5d', N'轰动；巨型炸弹；大片', N'Our new film will be a real blockbuster.
我们的新影片一定会大为轰动。
The blockbuster features the most popular actors.
这部巨片由最当红的演员们主演。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (174, N'observer', N'n.', N'%5b%c9%99b%27z%c9%9c%cb%90v%c9%99(r)%5d', N'观察者', N'Each observer''s prediction has been borne out.
每个观察者的预料已被证实了。
He is such a subtle and careful observer.
他是一位如此精细的观察者。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (175, N'transition', N'n.', N'%5btr%c3%a6n%27z%c9%aa%ca%83n%5d', N'转变；过渡', N'We hope there will be a peaceful transition to the new system.
我们希望能够和平过渡到新的制度。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (176, N'encourage', N'vt.', N'%5b%c9%aan%27k%ca%8cr%c9%aad%ca%92%5d', N'鼓励；促进；支持', N'Her parents encouraged her in her studies.
她的父母鼓励她好好学习。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (177, N'credibility', N'n.', N'%5b%cb%8ckred%c9%99%27b%c9%aal%c9%99ti%5d', N'可信；确实性；可靠', N'The silly ending robs the plot of any credibility.
这愚蠢的结尾使得整个情节变得一点都不可信。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (178, N'maternity', N'n.', N'%5bm%c9%99%27t%c9%9c%cb%90n%c9%99ti%5d', N'母性；母亲身份；产科病房', N'The pregnant woman looked forward to her maternity.
孕妇期待着做母亲。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (179, N'maternity', N'adj.', N'%5bm%c9%99%27t%c9%9c%cb%90n%c9%99ti%5d', N'孕妇的；母性的', N't''s just that maternity clothes are so expensive.
没什么,就是孕妇服实在太贵。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (180, N'kindergarten', N'n.', N'%5b%27k%c9%aand%c9%99%c9%a1%c9%91%cb%90tn%5d', N'幼儿园', N'These children hit it off well in the kindergarten.
这些小孩在幼儿园里相处得很好。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (181, N'contribute', N'vt.', N'%5bk%c9%99n%27tr%c9%aabju%cb%90t%5d', N'捐助；投稿', N'It was generous of her to contribute such a large sum.
她很大方，捐助了这么大笔钱。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (182, N'contribute', N'vi.', N'%5bk%c9%99n%27tr%c9%aabju%cb%90t%5d', N'投稿；贡献；是原因之一', N'Don''t contribute after the closing date.
请在截止日期前投稿。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (183, N'cater', N'v.', N'%5b%27ke%c9%aat%c9%99(r)%5d', N'提供饮食及服务；迎合；满足', N'Our hotel also caters for weddings and parties.
本饭店也承办婚礼、宴会。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (184, N'moisture', N'n.', N'%5b%27m%c9%94%c9%aast%ca%83%c9%99(r)%5d', N'水分；潮气；湿度', N'The plants absorb moisture from the soil.
植物从土壤中吸取水分。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (185, N'nausea', N'n.', N'%5b%27n%c9%94%cb%90zi%c9%99%5d', N'恶心；反胃；作呕；极端的厌恶', N'Early pregnancy is often accompanied by nausea.
怀孕初期常伴有恶心。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (186, N'cyst', N'n.', N'%5bs%c9%aast%5d', N'包囊；囊肿', N'An amoeba forms a cyst when conditions are unfavourable.
当环境不利时，变形虫产生包囊。
At the same time, a persistent cyst on her eye disappeared.
同时，她的眼睛囊肿也消失了。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (187, N'contaminate', N'vt.', N'%5bk%c9%99n%27t%c3%a6m%c9%aane%c9%aat%5d', N'弄脏；污染', N'Contaminate your bed, and you will one night suffocate in your own waste.
如果你弄脏了自己的环境，总有一天会窒息在你所丢弃的垃圾之中。
All over the world, oil spills regularly contaminate coasts.
在世界各地，油溢出物经常污染着海岸。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (188, N'intestine', N'n.', N'%5b%c9%aan%27test%c9%aan%5d', N'肠', N'Vitamin K is not absorbed from the upper intestine.
维生素K不是从肠的上部吸收的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (189, N'intestine', N'adj.', N'%5b%c9%aan%27test%c9%aan%5d', N'国内的；内部的', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (190, N'appetite', N'n.', N'%5b%27%c3%a6p%c9%aata%c9%aat%5d', N'食欲；嗜好；欲望', N'The long walk has given me a good appetite.
走了长路使我食欲大振。
Mary has no appetite for hard work.
玛丽不想干艰苦的工作。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (191, N'athlete', N'n.', N'%5b%27%c3%a6%ce%b8li%cb%90t%5d', N'运动员', N'She will make a very good athlete.
她将来会成为一名很好的运动员。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (192, N'apartment', N'n.', N'%5b%c9%99%27p%c9%91%cb%90tm%c9%99nt%5d', N'一套公寓房间', N'I have an apartment in downtown Manhattan.
我在曼哈顿中心区有一套住房。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (193, N'verify', N'vt.', N'%5b%27ver%c9%aafa%c9%aa%5d', N'核实；证明', N'He tried in every way to verify this theory.
他想一切办法来验证这个理论')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (194, N'equivalent', N'adj.', N'%5b%c9%aa%27kw%c9%aav%c9%99l%c9%99nt%5d', N'等价的 相等的', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (195, N'equivalent', N'n.', N'%5b%c9%aa%27kw%c9%aav%c9%99l%c9%99nt%5d', N'相等物', N'Is there a French word that is the exact equivalent of the English word `home''?
法语中有没有和英语home完全一样的对应词?')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (196, N'credential', N'n.', N'%5bkr%c9%99%27den%ca%83l%5d', N'国书；凭据；印信', N'Is the name of the credential to remove from the server.
要从服务器中删除的凭据的名称。
The passwords that are used to protect the master keys are stored in the credential store.
用于保护主密钥的密码存储在凭据存储区中。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (197, N'implement', N'n.', N'%5b%27%c9%aampl%c9%aam%c9%99nt%5d', N'工具；器具；当工具的物品', N'What implements are needed for gardening?
园艺需要些什么工具？')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (198, N'implement', N'vt.', N'%5b%27%c9%aampl%c9%aam%c9%99nt%5d', N'实施；执行；向 ... 提供工具(或手段)', N'Her designs will be put on ice until money is available to implement them.
她的设计将暂时搁起来，等有了钱再去实施。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (199, N'integration', N'n.', N'%5b%cb%8c%c9%aant%c9%aa%27%c9%a1re%c9%aa%ca%83n%5d', N'集成；综合；同化', N'Data warehouse is a representative application of data integration.
数据仓库是数据集成的一个典型应用。
We need an integration evaluation method.
我们需要一种综合评价方法。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (201, N'vice versa', N'adv.', N'%5b%cb%8cva%c9%aas%27v%c9%9c%cb%90s%c9%99%5d', N'反过来也是一样地', N'Man dictates to weapons, not vice versa.
是人指挥武器，而不是武器指挥人。
You know me better than others, vice versa.
你比所有人更为了解我，反过来也是一样。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (202, N'stimulate', N'vt.', N'%5b%27st%c9%aamjule%c9%aat%5d', N'刺激；激励；鼓舞', N'Alcohol stimulates the action of the heart.
酒刺激心脏的活动。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (203, N'stimulate', N'vi.', N'%5b%27st%c9%aamjule%c9%aat%5d', N'起刺激作用', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (204, N'addictive', N'adj.', N'%5b%c9%99%27d%c9%aakt%c9%aav%5d', N'使人上瘾的', N'Of course, this dish can always be toned down by adding less Sichuan pepper, but trust me...mala heat is addictive.
当然，少放点四川胡椒能使担担面的味道柔和一些，但是相信我吧，麻辣味儿所带来的热辣感觉是会使人上瘾的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (205, N'eject', N'v.', N'%5bi%27d%ca%92ekt%5d', N'喷射；放逐；驱逐', N'When endangered,octopuses eject an inky substance,which is used as a screen.
遇到危险的时候，章鱼能够喷射一种墨水状的液体，掩蔽它们逃走。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (206, N'location', N'n.', N'%5bl%c9%99%ca%8a%27ke%c9%aa%ca%83n%5d', N'位置；外景拍摄地；定位；地点', N'The town is a good location for a young doctor.
这个小镇很适宜于一位青年医生安家。He indicated the location of the Persian Gulf with a pen on the map.
他用一支笔在地图上标出了波斯湾的位置。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1205, N'trend', N'n.', N'%5btrend%5d', N'趋势；倾向；方位', N'The trend of prices is still upward.
物价仍有上涨趋势。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1206, N'trend', N'vi.', N'%5btrend%5d', N'倾向；转向', N'The prices of houses are trending upwards.
房价趋于上涨。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1207, N'concession', N'n.', N'%5bk%c9%99n%27se%ca%83n%5d', N'让步；特许权；租界；妥协', N'I hope you can make some concession.
我希望你能做些让步。')
GO
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1208, N'cultivate', N'vt.', N'%5b%27k%ca%8clt%c9%aave%c9%aat%5d', N'栽培；耕作；培养；陶冶；结交(朋友)', N'They moved to the country to cultivate the soil .
他们搬到乡下去种地。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1209, N'furrows', N'n.', N'%5b%27f%ca%8cr%c9%99%ca%8a%5d', N'犁沟；车辙；皱纹', N'The tractor has make deep furrow in the loose sand.
曳引机在松软的沙土上留下了深深的车辙。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1210, N'manure', N'n.', N'%5bm%c9%99%27nj%ca%8a%c9%99(r)%5d', N'肥料', N'Tests of the manure showed a high ammonia content.
这种肥料经过化验表明氨的含量很高。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1211, N'manure', N'vt.', N'%5bm%c9%99%27nj%ca%8a%c9%99(r)%5d', N'施肥', N'The peasants fertilize the field by using manure.
农民们施肥来使土地肥沃。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1212, N'retailer', N'n.', N'%5b%27ri%cb%90te%c9%aal%c9%99(r)%5d', N'零售商(店)', N'The retailer accepted the shipment on consignment.
零售商接受了运来的寄售物品。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1213, N'instant', N'n.', N'%5b%27%c9%aanst%c9%99nt%5d', N'瞬间；立即', N'I shall be back in an instant.
我马上就回来。Just for an instant I thought he was going to refuse.
我脑中有一闪念，以为他要拒绝了。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1214, N'instant', N'adj.', N'%5b%27%c9%aanst%c9%99nt%5d', N'立即的；即时的；速成的', N'I took an instant dislike to him.
我一见他就不喜欢。
The computer can generate instant multimedia messages.
电脑亦可产生即时的多媒体讯息。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1215, N'mobile', N'adj.', N'%5b%27m%c9%99%ca%8aba%c9%aal%5d', N'移动的；易变的；活动的', N'Additionally, consumers continue to embrace mobile personal devices.
此外,消费者接受移动个人设备的热情依然不减。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1216, N'mobile', N'n.', N'%5b%27m%c9%99%ca%8aba%c9%aal%5d', N'<美>汽车；可动雕塑；悬挂饰物；活动物体', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1217, N'gravitate', N'v.', N'%5b%27%c9%a1r%c3%a6v%c9%aate%c9%aat%5d', N'受吸引；下沉；重力吸引，受重力作用；移动，移向', N'When this beautiful girl arrived, all the men in the room gravitated towards her.
这美貌的姑娘一到，全屋的男人都让她吸引住了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1218, N'destination', N'n.', N'%5b%cb%8cdest%c9%aa%27ne%c9%aa%ca%83n%5d', N'目的地；终点', N'We eventually arrived at our destination.
我们终于到达了目的地。
The parcel was sent to the wrong destination.
包裹送错了地方。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1219, N'distinction', N'n.', N'%5bd%c9%aa%27st%c9%aa%c5%8bk%ca%83n%5d', N'荣誉；差别；优秀；对比；区分', N'Keller received many awards of great distinction.
凯勒被授予很多殊荣奖。
He had the distinction of being the first man to walk on the moon.
他以月球上第一个行走而闻名于世。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1220, N'occupy', N'vt.', N'%5b%27%c9%92kjupa%c9%aa%5d', N'占用；占领；从事；使忙碌；专心', N'Reading occupies most of my free time.
阅读占去了我大部分的闲暇时间。
We occupy the farm and raise a lot of poultry.
我们拥有这个农场并养着许多家禽。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1221, N'likelihood', N'n.', N'%5b%27la%c9%aaklih%ca%8ad%5d', N'可能性', N'The likelihood for peace in the Middle East remains questionable.
中东和平的可能性仍让人怀疑。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1222, N'alternate', N'v.', N'%5b%27%c9%94%cb%90lt%c9%9c%cb%90n%c9%99t%5d', N'交替；轮流', N'One should alternate work and relaxation.
工作和休息应交替进行。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1223, N'alternate', N'adj.', N'%5b%27%c9%94%cb%90lt%c9%9c%cb%90n%c9%99t%5d', N'间隔的；轮流的；交替的', N'Meetings are held on alternate Thursdays.
每隔一个星期的星期四举行一次会议。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1224, N'alternate', N'n.', N'%5b%27%c9%94%cb%90lt%c9%9c%cb%90n%c9%99t%5d', N'代替者；供替代的选择', N'In order to improve the power supply reliability, local grid often installed have alternate power auto-cast device
为提高供电可靠性，地区电网往往装设有备用电源自动投入装置。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (1225, N'digital', N'adj.', N'%5b%27d%c9%aad%ca%92%c9%aatl%5d', N'数字的；数码的；手指的；计数的', N'Most of the computers we are using are digital computers.
我们正在使用的计算机大多数是数字计算机。
This is my newly bought digital watch.
这是我新买的数字手表。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2212, N'bride', N'n.', N'%5bbra%c9%aad%5d', N'新娘', N'The bride wore a beautiful white dress.
新娘穿了一身美丽的白色礼服。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2213, N'role', N'n.', N'%5br%c9%99%ca%8al%5d', N'作用；角色', N'The Panama Canal has played a very important role in transportation.
巴拿马运河在运输上起到了非常重要的作用。
The key role of the teacher in the learning process should not be neglected.
教师在学习中的关键作用是不该忽视的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2214, N'conceive', N'v.', N'%5bk%c9%99n%27si%cb%90v%5d', N'设想；想出；怀孕', N'I cannot conceive of him as a genius.
我不能设想他会是一个天才。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2215, N'determine', N'v.', N'%5bd%c9%aa%27t%c9%9c%cb%90m%c9%aan%5d', N'决定；决心；确定；测定', N'Chance will determine the outcome.
机缘将决定结果')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2216, N'profession', N'n.', N'%5bpr%c9%99%27fe%ca%83n%5d', N'职业；声明；行业；信仰', N'Nursing is a vocation as well as a profession.
护理工作既是职业又是救死扶伤的责任。
I don''t believe her profession of friendship for us.
我不相信她声称同我们友好。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2217, N'grab', N'v.', N'%5b%c9%a1r%c3%a6b%5d', N'抓住；攫取', N'Grab a seat and make yourself at home.
随便找个地方坐，别客气。
Let''s grab a sandwich and go to see the film.
让我们赶快吃个三明治就去看电影吧。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2218, N'grab', N'n.', N'%5b%c9%a1r%c3%a6b%5d', N'抓取物；抓', N'The job is up for grabs. Why don''t you apply now?
那工作谁都可以争取。你怎么不现在就申请呢？')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2219, N'hype', N'n.', N'%5bha%c9%aap%5d', N'夸大的广告宣传；<俚>皮下注射液；吸毒成瘾的人', N'There was a big media hype for that new movie.
那部新推出电影有很大的媒体宣传。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2220, N'hype', N'v.', N'%5bha%c9%aap%5d', N'大肆宣传；炒作；刺激', N'Why do they hype up an election?
他们为什么要大肆宣传选举呢?')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2221, N'score', N'n.', N'%5bsk%c9%94%cb%90(r)%5d', N'得分；刻痕；二十；乐谱', N'I recorded the score in a notebook.
我在笔记本上记下了分数。
There are deep scores on the rock.
岩石上有深深的刻痕。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2222, N'score', N'vt.', N'%5bsk%c9%94%cb%90(r)%5d', N'得分；获胜；刻划；划线；批评；给 ... 谱曲', N'Hughes scored two goals before half-time.
休斯在上半场进了两个球.')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2223, N'score', N'vi.', N'%5bsk%c9%94%cb%90(r)%5d', N'得分；记分；得胜', N'The home team has yet to score.
主队还没有得分.')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2224, N'draft', N'n.', N'%5bdr%c9%91%cb%90ft%5d', N'草稿；草图；汇票；征兵', N'He has drawn up the design draft.
他拟订了设计草图。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (2225, N'draft', N'vt.', N'%5bdr%c9%91%cb%90ft%5d', N'起草；征兵；选秀', N'Who will draft the indictment?
谁将起草起诉状？
John was drafted into the Army last year.
约翰去年被应征入伍。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (3217, N'liter', N'n.', N'%5b%27li%cb%90t%c9%99(r)%5d', N'升；公升(容量单位) =litre(英).', N'The bottle can hold a liter of beer.
这个瓶子可以装一升啤酒。
This is the change formula between Galon and Liter.
这是加仑与升的换算公式。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (3218, N'assume', N'vt.', N'%5b%c9%99%27sju%cb%90m%5d', N'假定；设想；承担；(想当然的)认为；假装 ', N'Let''s assume it to be true.
让我们假定这是真的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (3219, N'slide', N'vi.', N'%5bsla%c9%aad%5d', N'滑动；下滑；滑入；悄悄地溜走', N'House values may begin to slide.
房价可能开始逐渐下降了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (3220, N'slide', N'vt.', N'%5bsla%c9%aad%5d', N'使滑动', N'We are to slide the box by exerting a force on it.
我们对箱子施加作用力，使它滑动。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (3221, N'slide', N'n.', N'%5bsla%c9%aad%5d', N'幻灯片；滑坡；滑动；雪崩', N'After you type your comment you can move it around on the slide.
键入批注后,您可以在幻灯片中移动批注。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (3222, N'delighted', N'adj.', N'%5bd%c9%aa%27la%c9%aat%c9%aad%5d', N'高兴的；快乐的', N'I''d be most delighted if you will.
如果您愿意，我会非常高兴的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (3223, N'delighted', N'v.', N'%5bd%c9%aa%27la%c9%aat%c9%aad%5d', N'快乐；喜悦', N'I am delighted to see all so happy.
看见大家这么快乐我很高兴。
The bear was delighted and began to dance happily.
那只熊听了很高兴，就开始快乐地跳舞。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (4217, N'casualty', N'n.', N'%5b%27k%c3%a6%ca%92u%c9%99lti%5d', N'事故；伤亡者；伤亡人数；<英>急诊室 ', N'She read through the casualty list anxiously.
她忧虑地把伤亡人员名单从头到尾看了一遍。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (4218, N'facility', N'n.', N'%5bf%c9%99%27s%c9%aal%c9%99ti%5d', N'设备；设施；才能；资质；灵巧；熟练', N'There are few recreational facilities in our school.
我们学校里几乎没有什么娱乐设施。
He has great facility in learning languages.
他很有学习语言的才能。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (4219, N'armor', N'n.', N'%5b%27%c9%91%cb%90m%c9%99%5d', N'盔甲；装甲', N'In the past, knights used to wear armor in battle.
在过去，骑士在战斗中身穿盔甲。
Never underestimate the power of extra armor.
永远不要低估额外的盔甲。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (4220, N'squad', N'n.', N'%5bskw%c9%92d%5d', N'班；小队', N'1.They are the precision shooting asset of a squad.
他们是步兵班里的神枪手。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (4221, N'clinic', N'n.', N'%5b%27kl%c9%aan%c9%aak%5d', N'诊所；门诊部；科室', N'His clinic is near the newly-built railway station.
他的诊所在新建的火车站附近。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5217, N'realize', N'vt.', N'%5b%27ri%cb%90%c9%99la%c9%aaz%5d', N'实现；了解；意识到；变卖', N'My wishes have been realized.
我的愿望实现了。
Now I will step forward to realize this wish.
现在,我想传递并实现这个愿望。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5218, N'opportunity', N'n.', N'%5b%cb%8c%c9%92p%c9%99%27tju%cb%90n%c9%99ti%5d', N'机会；时机', N'You must grasp this opportunity.
你必须抓住机会。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5219, N'formal', N'adj.', N'%5b%27f%c9%94%cb%90ml%5d', N'正式的；正规的；形式的；公开的；拘谨的', N'At the formal party I felt very awkward and out of place.
在正式的舞会上，我感到局促不安，很不自在。
This job doesn''t require any formal training.
这种工作不需要任何正规训练。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5220, N'resident', N'n.', N'%5b%27rez%c9%aad%c9%99nt%5d', N'居民；住客；住院医生', N'The residents of the town are proud of its new library.
该镇的居民都为镇上新建的图书馆感到自豪。
I have been resident in this hotel for two weeks.
我已经在这家旅馆里住了两个星期了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5221, N'currency', N'n.', N'%5b%27k%ca%8cr%c9%99nsi%5d', N'货币；流通', N'There are currency restrictions on the sums allowed for foreign travel.
到国外旅行允许携带的款额有所限制。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5222, N'status', N'n.', N'%5b%27ste%c9%aat%c9%99s%5d', N'地位；情形；状况，状态；身份', N'I''ll keep you posted on the status.
我会随时告诉你进展的情形。
We ask the bank to report on his financial status.
我们请银行报告他的财政状况。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5223, N'emergency', N'n.', N'%5bi%27m%c9%9c%cb%90d%ca%92%c9%99nsi%5d', N'突发事件；紧急状态', N'We took the emergency in our stride.
我们泰然地处理了紧急情况。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5224, N'designation', N'n.', N'%5b%cb%8cdez%c9%aa%c9%a1%27ne%c9%aa%ca%83n%5d', N'指示；指定；任命；命名', N'Does a professional who is licensed to practice need the designation?
被授权开业的专业人员需要指定吗?')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5225, N'financial', N'adj.', N'%5bfa%c9%aa%27n%c3%a6n%ca%83l%5d', N'金融的；财政的；<非正式>有钱的', N'And I got the financial support after two years.
两年后我终于取得了奖学金。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5226, N'dominates', N'v.', N'%5b%27d%c9%92m%c9%aane%c9%aat%5d', N'支配；控制；统治；占优势；俯视；高耸于', N'That way, he can dominate the game.
那样他才能支配比赛。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5227, N'integration', N'n.', N'%5b%cb%8c%c9%aant%c9%aa%27%c9%a1re%c9%aa%ca%83n%5d', N'集成；综合；同化', N'Data warehouse is a representative application of data integration.
数据仓库是数据集成的一个典型应用。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5228, N'expose', N'vt.', N'%5b%c9%aak%27sp%c9%99%ca%8az%5d', N'揭露；使曝光；使面临；使暴露', N'I hate the paparazzi.They always expose the people''s privacy.
我讨厌狗仔队,他们老曝光别人的隐私。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5229, N'stable', N'adj.', N'%5b%27ste%c9%aabl%5d', N'稳定的；安定的；可靠的', N'Markets are flourishing and prices are stable.
市场繁荣, 物价稳定。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5230, N'stable', N'n.', N'%5b%27ste%c9%aabl%5d', N'马棚；马厩；一批人', N'The horse in the stable has broken out.
马厩里的那匹马跑了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5231, N'cautious', N'adj.', N'%5b%27k%c9%94%cb%90%ca%83%c9%99s%5d', N'谨慎的；十分小心的', N'He is cautious in his choice of words.
他措辞很谨慎。
They''ve taken a very cautious approach.
他们采取了十分谨慎的态度。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5232, N'falter', N'vt.', N'%5b%27f%c9%94%cb%90lt%c9%99(r)%5d', N'蹒跚地走', N'The sick man faltered a few steps and then fell.
这个病人摇摇晃晃地走了几步，然后就跌倒了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5233, N'stimulus', N'n.', N'%5b%27st%c9%aamj%ca%8al%c9%99s%5d', N'刺激；刺激品；激励', N'One wants the stimulus of sympathy.
一个人总需要趣味相投、志同道合的朋友互相鼓励。
Her words of praise were a stimulus for people to work harder.
她赞扬的话鼓舞人们工作更努力。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5234, N'course', N'n.', N'%5bk%c9%94%cb%90s%5d', N'课程；讲座；过程；路线；一道(菜)', N'She took a course in philosophy.
她选读了一门哲学课程。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5235, N'course', N'v.', N'%5bk%c9%94%cb%90s%5d', N'跑过，穿过；追赶；快跑', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5236, N'heritage', N'n.', N'%5b%27her%c9%aat%c9%aad%ca%92%5d', N'遗产；继承物', N'One of the glories of the British heritage is the right to a fair trial.
英国人引以自豪的传统之一是有获得公正审判的权利。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5237, N'folks', N'n.', N'%5b%27f%c9%99%ca%8aks%5d', N'人们；家人；父母', N'Folks around here will always lend a hand if you need it.
如果你需要,这周围的人通常会帮一把。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5238, N'multiple', N'adj.', N'%5b%27m%ca%8clt%c9%aapl%5d', N'多种多样的；许多的', N'A multiple crash can often be seen on that motorway.
那条公路上的联环撞车事故很多。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5239, N'multiple', N'n.', N'%5b%27m%ca%8clt%c9%aapl%5d', N'倍数；并联', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5240, N'prioritize', N'vt.', N'%5bpra%c9%aa%27%c9%92r%c9%99ta%c9%aaz%5d', N'把 ... 区分优先次序', N'I now prioritize all of my tasks and create a plan.
现在我会将所有任务排出优先次序然后制定出计划。
Everyone should take time to be alone, to prioritize and meditate.
每个人都应该找时间独处,理出优先顺序和静思。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5241, N'barrel', N'n.', N'%5b%27b%c3%a6r%c9%99l%5d', N'桶；枪管；一桶的量；炮管；大量；笔管；汽油桶', N'Beer swilled around the bottom of the barrel.
啤酒在桶底晃荡。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5242, N'barrel', N'vi.', N'%5b%27b%c3%a6r%c9%99l%5d', N'快速移动', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5243, N'barrel', N'vt.', N'%5b%27b%c3%a6r%c9%99l%5d', N'把 ... 装桶', N'They planned to barrel the beer next Monday.
他们打算下星期一把啤酒装桶。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5244, N'dialogue', N'n.', N'%5b%27da%c9%aa%c9%99l%c9%92%c9%a1%5d', N'对话', N'The novel contains more narrative than dialogue.
这部小说里的叙述比对话多。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5245, N'dialogue', N'v.', N'%5b%27da%c9%aa%c9%99l%c9%92%c9%a1%5d', N'对话', N'A peace promise must be made before the two countries formally dialogue.
这两个国家的正式对话必须建立在和平承诺的基础上。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5246, N'crude', N'adj.', N'%5bkru%cb%90d%5d', N'天然的；未加工的；粗鲁的；粗糙的；简陋的', N'China is a country rich in crude oil.
中国是一个原油丰富的国家。
The price of crude oil has come down recently.
最近原油的价格已经下降了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5247, N'crude', N'n.', N'%5bkru%cb%90d%5d', N'原油；天然的物质', NULL)
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5248, N'addiction', N'n.', N'%5b%c9%99%27d%c9%aak%ca%83n%5d', N'沉溺；上瘾', N'You just let everything else go by the wayside as you pursue your addiction.
在你沉溺于某事时，你只对其他所有的事情听之任之。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5249, N'toll', N'n.', N'%5bt%c9%99%ca%8al%5d', N'伤亡人数；钟声；通行费；代价', N'The death toll mounted to 100.
死亡人数上升至100.
The government tried to keep the death toll at a lower level.
政府力图将死亡人数控制在较低标准。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5250, N'toll', N'v.', N'%5bt%c9%99%ca%8al%5d', N'敲钟', N'The church bell tolled the hour.
教堂的鸣钟报时。
At nightfall the bells would toll 108 times.
每到黄昏时分，钟鸣一百零八响。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5251, N'advance', N'n.', N'%5b%c9%99d%27v%c9%91%cb%90ns%5d', N'前进；进展；预付金', N'There have been great progresses in medicine in the past decade.
在过去十年里,医学取得了巨大的进步。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5252, N'advance', N'v.', N'%5b%c9%99d%27v%c9%91%cb%90ns%5d', N'前进；预付；增长；推进', N'The officer directed them to advance.
指挥官命令他们前进。
The enemy was afraid to advance into our base area.
敌人不敢进入我们根据地。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5253, N'advance', N'adj.', N'%5b%c9%99d%27v%c9%91%cb%90ns%5d', N'预先的；提前的', N'It is a popular show, so advance booking is essential.
这是个很受欢迎的演出，所以一定要提前订票。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5254, N'census', N'n.', N'%5b%27sens%c9%99s%5d', N'人口普查；户口普查；统计', N'The census is taken one time every four years in our country.
我国每四年一次人口普查。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5255, N'correspond', N'vi.', N'%5b%cb%8ck%c9%94ris%cb%88p%c9%94nd%5d', N'相应; 通信; 符合，一致;', N'The two sisters correspond every week.
这两姐妹每周通信。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5256, N'acknowledge', N'vt.', N'%5b%c9%99k%27n%c9%92l%c9%aad%ca%92%5d', N'承认；告知收到；公认；表示感谢；注意到', N'We acknowledged the need for reform.
我们承认改革的需要。
Please acknowledge this cheque as soon as you receive it.
收到该支票后,请立即告知。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5257, N'specific', N'adj.', N'%5bsp%c9%99%27s%c9%aaf%c9%aak%5d', N'明确的；特殊的；具有特效的', N'This tells you that there is a specific distinction between the right and the wrong.
这件事告诉你是与非是有明确的区别的。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5258, N'specific', N'n.', N'%5bsp%c9%99%27s%c9%aaf%c9%aak%5d', N'特效药；详情；特性', N'He never talked in specifics about his work.
他从不谈论有关自己工作的详情。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5259, N'agenda', N'n.', N'%5b%c9%99%27d%ca%92end%c9%99%5d', N'议事日程', N'This agenda will form the basis of our next meeting.
本议程将成为下次会议的中心议题。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5260, N'schedule', N'n.', N'%5b%27%ca%83edju%cb%90l%5d', N'时间表，日程；一览表；计划', N'I''ll work out the schedule.
我来拟定时间表。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5261, N'schedule', N'v.', N'%5b%27%ca%83edju%cb%90l%5d', N'预定；安排；编制目录', N'The morning is the best time of the day to schedule a briefing.
简报最好安排在早上。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5262, N'bureaucrat', N'n.', N'%5b%27bj%ca%8a%c9%99r%c9%99kr%c3%a6t%5d', N'官僚作风的人；官僚', N'He is a conservative bureaucrat who can be counted upon to follow a beaten path.
他是一个保守的官僚, 他准会循规蹈矩地办事。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5263, N'misery', N'n.', N'%5b%27m%c9%aaz%c9%99ri%5d', N'痛苦；悲惨的境遇；苦难', N'War necessarily causes misery and waste.
战争必然造成痛苦和破坏。
He was doomed to undergo another misery.
他注定要经历另一场痛苦。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5264, N'stingy', N'adj.', N'%5b%27st%c9%aand%ca%92i%5d', N'吝啬的；小气的', N'After the death of his stingy wife,Edward loosened up a great deal.
爱德华在吝啬的妻子死后，用钱大方得多了。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5265, N'shrewd', N'adj.', N'%5b%ca%83ru%cb%90d%5d', N'精明的；敏锐的；狡猾的', N'Her brother is a shrewd businessman.
她兄弟是个精明的生意人。
It was a shrewd assessment and probably pretty close to the truth.
这个评估很有道理，可能相当正确。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5266, N'indignant', N'adj.', N'%5b%c9%aan%27d%c9%aa%c9%a1n%c9%99nt%5d', N'愤慨的；愤愤不平的', N'People are indignant by their shooting of innocent civilians.
对于他们枪杀无辜平民，人们感到义愤填膺。
He is indignant at the false accusation.
他对被诬告愤愤不平。
')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5267, N'disgust', N'n.', N'%5bd%c9%aas%27%c9%a1%ca%8cst%5d', N'厌恶；憎恶；反感', N'His behavior filled her with disgust.
她对他的行为充满了厌恶。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5268, N'disgust', N'vt.', N'%5bd%c9%aas%27%c9%a1%ca%8cst%5d', N'使厌恶；使作呕', N'This smell disgusts me.
这气味使我作呕。')
INSERT [dbo].[Words] ([WordId], [spell], [type], [speak], [translate], [sentence]) VALUES (5269, N'generous', N'adj.', N'%5b%27d%ca%92en%c9%99r%c9%99s%5d', N'慷慨的；宽宏大量的；丰厚的；丰盛的；味浓的', N'She was always very generous in her charity.
她行善时总是很慷慨。
Such generous actions stamp him as a man of honour.
他的这些慷慨行为表明他是个君子。')
SET IDENTITY_INSERT [dbo].[Words] OFF
USE [master]
GO
ALTER DATABASE [Test] SET  READ_WRITE 
GO
