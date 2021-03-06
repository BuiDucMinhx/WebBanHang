USE [J5Shop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/9/2022 9:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [varchar](50) NOT NULL,
	[activated] [bit] NOT NULL,
	[admin] [bit] NOT NULL,
	[email] [varchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[password] [varchar](150) NULL,
	[photo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 5/9/2022 9:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](250) NULL,
	[firstname] [nvarchar](250) NULL,
	[lastname] [nvarchar](250) NULL,
	[address] [nvarchar](250) NULL,
	[phone] [nvarchar](250) NULL,
	[email] [varchar](250) NULL,
	[username] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 5/9/2022 9:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[RoleId] [varchar](10) NULL,
 CONSTRAINT [PK_Authorities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/9/2022 9:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Details]    Script Date: 5/9/2022 9:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [date] NULL,
	[status] [bit] NULL,
	[total] [float] NULL,
	[name] [varchar](50) NULL,
	[username] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/9/2022 9:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[createdate] [date] NULL,
	[address] [nvarchar](100) NULL,
	[productid] [int] NULL,
	[name] [varchar](50) NULL,
	[status] [bit] NULL,
	[qty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/9/2022 9:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [nvarchar](50) NULL,
	[price] [float] NULL,
	[createdate] [date] NULL,
	[available] [bit] NULL,
	[categoryid] [int] NULL,
	[qty] [int] NULL,
	[origin] [nvarchar](50) NULL,
	[manufacture] [nvarchar](50) NULL,
	[describle] [nvarchar](500) NULL,
	[review] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/9/2022 9:41:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([username], [activated], [admin], [email], [fullname], [password], [photo]) VALUES (N'rongkho001@gmail.com', 0, 0, N'rongkho001@gmail.com', NULL, N'$2a$10$i4lT/KvCxZh5GUJdomr6dOMhZ06eSvvQSwW8/Q.nCyH1ZWqDc3mIu', NULL)
GO
INSERT [dbo].[Accounts] ([username], [activated], [admin], [email], [fullname], [password], [photo]) VALUES (N'user1', 0, 0, N'rongkho2@gmail.com', N'Bui Duc Minh', N'$2a$10$AkslCmNm.EOW52U7gKX6ROL5XI5gQlCi9bvgBaoeBMXJriY09majC', NULL)
GO
INSERT [dbo].[Accounts] ([username], [activated], [admin], [email], [fullname], [password], [photo]) VALUES (N'user2', 0, 0, N'my22@gmail.com', N'Tran Ha My', N'$2a$10$AkslCmNm.EOW52U7gKX6ROL5XI5gQlCi9bvgBaoeBMXJriY09majC', NULL)
GO
INSERT [dbo].[Accounts] ([username], [activated], [admin], [email], [fullname], [password], [photo]) VALUES (N'user3', 0, 0, N'huy33@gmail.com', N'Le Huy', N'$2a$10$AkslCmNm.EOW52U7gKX6ROL5XI5gQlCi9bvgBaoeBMXJriY09majC', NULL)
GO
INSERT [dbo].[Accounts] ([username], [activated], [admin], [email], [fullname], [password], [photo]) VALUES (N'user4', 0, 0, N'ha3@gmail.com', N'Nhu Ha', N'$2a$10$AkslCmNm.EOW52U7gKX6ROL5XI5gQlCi9bvgBaoeBMXJriY09majC', NULL)
GO
SET IDENTITY_INSERT [dbo].[Address] ON 
GO
INSERT [dbo].[Address] ([id], [country], [firstname], [lastname], [address], [phone], [email], [username]) VALUES (10, N'Vietnam', N'minh', N'MINH', N'QWE', N'9123123', N'rongkho2@gmail.com', N'user2')
GO
INSERT [dbo].[Address] ([id], [country], [firstname], [lastname], [address], [phone], [email], [username]) VALUES (16, N'Vietnam', N'Minh', N'B??I', N'106 L?? th?????ng Ki???t', N'0914054080', N'rongkho2@gmail.com', N'user3')
GO
INSERT [dbo].[Address] ([id], [country], [firstname], [lastname], [address], [phone], [email], [username]) VALUES (17, N'Vietnam', N'DUC', N'h??', N'106 ly th?????ng ki???t, HCM CITY, VN', N'0914054080', N'rongkho2@gmail.com', N'user1')
GO
INSERT [dbo].[Address] ([id], [country], [firstname], [lastname], [address], [phone], [email], [username]) VALUES (21, N'Vietnam', N'DUC', N'MINH', N'106 ly th?????ng ki???t, HCM CITY, VN', N'0914054080', N'rongkho2@gmail.com', N'user4')
GO
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (105, N'user2', N'USER')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (125, N'user4', N'GUEST')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (128, N'rongkho001@gmail.com', N'GUEST')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (134, N'user3', N'ADMIN')
GO
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (135, N'user1', N'GUEST')
GO
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'M??y t??nh')
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'??i???n tho???i di ?????ng')
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (5, N'Ph??? ki???n & Kh??ca')
GO
SET IDENTITY_INSERT [dbo].[Details] ON 
GO
INSERT [dbo].[Details] ([id], [createdate], [status], [total], [name], [username]) VALUES (51, CAST(N'2022-04-07' AS Date), 0, 200, N'569120', N'user3')
GO
INSERT [dbo].[Details] ([id], [createdate], [status], [total], [name], [username]) VALUES (52, CAST(N'2022-04-20' AS Date), 1, 0, N'682731', N'USER2')
GO
INSERT [dbo].[Details] ([id], [createdate], [status], [total], [name], [username]) VALUES (53, CAST(N'2022-04-20' AS Date), 1, 400, N'321384', N'USER2')
GO
SET IDENTITY_INSERT [dbo].[Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (25, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'238574', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (26, N'user3', CAST(N'2022-04-03' AS Date), N'HCM CITY', 3, N'726838', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (27, N'user3', CAST(N'2022-04-03' AS Date), N'HCM CITY', 4, N'726838', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (28, N'user3', CAST(N'2022-04-03' AS Date), N'HCM CITY', 2, N'756590', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (29, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 1, N'712656', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (30, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 3, N'712656', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (31, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'511104', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (32, N'user3', CAST(N'2022-04-03' AS Date), N'HCM CITY', 2, N'988174', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (33, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'804364', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (34, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 3, N'804364', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (35, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'590766', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (36, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 3, N'590766', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (37, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'286021', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (38, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'393925', 0, 4)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (39, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 3, N'393925', 0, 7)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (40, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 8, N'393925', 0, 10)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (41, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 1, N'901631', 0, 15)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (42, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'251744', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (43, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 5, N'866211', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (44, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 11, N'397329', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (45, N'user2', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 3, N'742531', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (46, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 4, N'200225', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (47, N'user2', CAST(N'2022-04-03' AS Date), N'HCM CITY', 2, N'752331', 0, 7)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (48, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 1, N'270311', 0, 3)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (49, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'833244', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (50, N'user2', CAST(N'2022-04-04' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 1, N'799436', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (51, N'user3', CAST(N'2022-04-04' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 6, N'407799', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (52, N'user1', CAST(N'2022-04-04' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 0, N'119627', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (53, N'user2', CAST(N'2022-04-04' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'712501', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (54, N'user4', CAST(N'2022-04-04' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'515898', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (55, N'user4', CAST(N'2022-04-04' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'653249', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (56, N'user3', CAST(N'2022-04-04' AS Date), N'HCM CITY', 0, N'153841', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (57, N'user2', CAST(N'2022-04-04' AS Date), N'HCM CITY', 1, N'661165', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (58, N'user4', CAST(N'2022-04-04' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 3, N'733595', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (59, N'user3', CAST(N'2022-04-04' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 13, N'853364', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (60, N'user3', CAST(N'2022-04-04' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'479020', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (61, N'user3', CAST(N'2022-04-04' AS Date), N'HCM CITY', 13, N'356824', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (62, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 7, N'655973', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (63, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 12, N'655973', 0, 3)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (64, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'454135', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (65, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 13, N'549745', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (66, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 6, N'366355', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (67, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 2, N'763820', 0, 1000)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (68, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly th?????ng ki???t, HCM CITY, VN', 12, N'881912', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (69, N'user2', CAST(N'2022-04-07' AS Date), N'106 ly th?????ng ki???t, H??? CH?? MINH', 1, N'225546', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (70, N'user2', CAST(N'2022-04-07' AS Date), N'106 ly th?????ng ki???t, H??? CH?? MINH', 3, N'225546', 0, 8)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (71, N'user3', CAST(N'2022-04-07' AS Date), N'106 L?? th?????ng Ki???t', 2, N'569120', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (72, N'USER2', CAST(N'2022-04-20' AS Date), N'QWE', 2, N'321384', 0, 2)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (0, N'i3 - Gen 10th', N'p1.PNG', 200, CAST(N'9999-12-31' AS Date), 0, 3, 98, N'Vi???t Nam', N'Itel', N'Intel Core i3 Gen 10 l?? m???t b??? x??? l?? ?????c quy???n c???a Intel ???????c x??y d???ng tr??n khu??n kh??? c???a ki???n ??????tr??c ??a x??? l??.

N?? l?? m???t lo???i vi x??? l?? l??i k??p v???i m???t ????n v??? x??? l?? ????? h???a t??ch h???p (GPU).', N'91% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (1, N'Chu???t Razor Gaming', N'p2.PNG', 150, CAST(N'2001-12-31' AS Date), 0, 5, 79, N'Vi???t Nam', N'MSI', N'Razer DeathAdder Essential thi???t k??? ????n gi???n v???i ki???u d??ng truy???n th???ng, t???o ??i???m nh???n nh??? logo Razer n???i b???t phong c??ch gaming, h??nh th??i v???a v???n tay ?????m b???o kh??ng g??y m???i c??? tay c??? khi s??? d???ng l??u.', N'80% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (2, N'V??? PC Cao C???p', N'p6.PNG', 200, CAST(N'2000-03-31' AS Date), 0, 3, -944, N'Vi???t Nam', N'Lenovo', N'????y l?? lo???i v??? b?? nh???t v?? c??ng c?? gi?? tr??? decor (trang tr??) cao nh???t cho nh???ng ng?????i d??ng ??a th??ch s??? ????n gi???n, nh??? g???n. ?????c ??i???m c???a lo???i v??? case n??y l?? c?? di???n t??ch v?? kho???ng kh??ng r???t b??, th??? n??n khi l???a ch???n v?? s??? d???ng c??c linh ki???n, b???n ph???i nghi??n c???u v?? t??m hi???u k??? tr?????c khi ????a ra quy???t ?????nh mua s???m.', N'75% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (3, N'Tai Nghe Gaming', N'p4.PNG', 230, CAST(N'2000-03-31' AS Date), 0, 5, 82, N'Vi???t Nam', N'SamSung', N'Tai nghe nh??t trong Samsung EG920B c?? ??i n??t ?????m tai nghe d???ng m??c
Gi??p ng?????i ??eo khi v???n ?????ng m???nh s??? kh??ng b??? r???t ra.', N'91% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (4, N'Chu???t MSI', N'p5.PNG', 40, CAST(N'1999-03-12' AS Date), 0, 5, 99, N'Vi???t Nam', N'MSI', N'Chu???t MSI Interceptor DS300 Laser GAMING ???????c thi???t k??? ????? ?????m b???o ph?? h???p v???i ng?????i thu???n tay ph???i nh???t cho c??c game th???. ', N'94% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (5, N'V??? PC Cao C???p 2', N'p3.PNG', 245, CAST(N'2003-03-11' AS Date), 0, 3, 80, N'Vi???t Nam', N'Acer', N'V??? Case M??y T??nh Thermaltake Level 20 XT Tempered Glass CA-1L1-00F1WN-00 E-ATX s??? h???u l???p v??? h??nh kh???i ???????c thi???t k??? ?????c bi???t ????? th??? hi???n c??c h??? th???ng l??m m??t b???ng ch???t l???ng t??y ch???nh, bo m???ch ch??? c?? thi???t k??? ph???ng ?????c ????o, ?????t c??c b??? ph???n ???????c hi???n th??? t??? m???i g??c ????? v?? thi???t k??? bu???ng ng??n c??ch c??c b??? ph???n l??m m??t', N'100% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (6, N'Itel Core I7 - Gen 10th', N'p7.PNG', 400, CAST(N'1987-04-21' AS Date), 0, 3, 98, N'Vi???t Nam', N'Itel', N'Core i7 Gen 10 l?? d??ng vi x??? l?? 64-bit x86-64 hi???u su???t cao ???????c Intel thi???t k??? cho m??y t??nh ????? b??n v?? m??y t??nh x??ch tay cao c???p. Core i7 ???????c gi???i thi???u v??o n??m 2008 sau khi d??ng Core 2 Quad ngh??? h??u.', N'91% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (7, N'Tay C???m Ch??i Game ??i???n Tho???i', N'p8.PNG', 20, CAST(N'2002-04-11' AS Date), 0, 4, 99, N'Vi???t Nam', N'Xiaomi', N'?????i v???i nh???ng th??? lo???i game nh?? b??ng ???? ho???c ??ua xe th?? l???i ??ch c???a vi???c ch??i game v???i tay c???m ch??i game h??n h???n b??n ph??m. Khi b???n tr???i nghi???m n??t Trigger ??? tay c???m Xbox One ho???c PlayStation 4 trong game ??ua xe b???n c?? th??? ga nh??? ho???c t??ng t???c v???i nhi???u m???c ????? kh??c nhau', N'91% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (8, N'C??? S???c Baseus', N'p9.PNG', 30, CAST(N'1999-03-12' AS Date), 0, 5, 90, N'Vi???t Nam', N'China', N'S???c nhanh A2633 20W s??? h???u thi???t k??? nh??? g???n v???i h??nh l???c gi??c th???i trang. C??ng ngh??? s???c nhanh l??n ?????n 20W, ????p ???ng nhu c???u s??? d???ng c???a ng?????i d??ng, s???c ?????y pin nhanh ch??ng.', N'61% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (9, N'B??n Ph??m C?? Cao C???p', N'p10.PNG', 45, CAST(N'2003-03-11' AS Date), 0, 3, 100, N'Vi???t Nam', N'China', N'Thi???t k??? th???i th?????ng, g???n nh???, r???t th??ch h???p ????? ch??i game, l??m vi???c.
C?? ?????n 104 ph??m, v??ng ph??m s??? d??? d??ng thao t??c. 
S??? d???ng Green Mechanical Switch cho x??c gi??c ch??n th???t khi t??c ?????ng,', N'56% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (10, N'Qu???t T???n Nhi???t RGB', N'p11.PNG', 100, CAST(N'1987-04-21' AS Date), 0, 3, 100, N'Vi???t Nam', N'Asus', N'Fan Case Vitra Luna ARGB ( 5 Fan Pack / K??m ??i???u khi???n) l?? chi???c qu???t t???n nhi???t cao c???p v???i ????n RGB b???t m???t, r???t ?????p m???t khi d??ng ????? trang tr?? case m??y t??nh. ?????ng th???i Vitra Luna ARGB c??n ??em l???i hi???u n??ng t???n nhi???t t???t, ph?? h???p v???i c??c c???u h??nh ch??i game cao c???p.', N'85% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (11, N'????? Ch??i Tr??? Em', N'p12.PNG', 5000, CAST(N'2002-04-11' AS Date), 0, 5, 80, N'Vi???t Nam', N'Toy', N'????? ch??i tr??? em v???i t??nh n??ng si??u vi???t gi??p tr??? th??nh thi??n t??i', N'52% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (12, N'1 ??? SSD Gigabyte 512GB', N'p13.PNG', 300, CAST(N'2003-03-11' AS Date), 0, 3, 77, N'Vi???t Nam', N'Gigabyte', N'???ng c???ng KC300 t??ch h???p TCG Opal 1.0 v?? c??ng l?? t?????ng cho c??c c??ng ty ??ang th???c thi ph???n m???m qu???n tr??? trung t??m ????? qu???n l?? c??c ch??nh s??ch b???o m???t, kh??i ph???c m???t kh???u, nh???t k?? th???c hi???n, c???p nh???t t??? ?????ng v?? t???o/x??a ng?????i d??ng', N'56% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (13, N'Zoom Cam Cho ??T', N'p14.PNG', 85, CAST(N'1987-04-21' AS Date), 0, 4, 40, N'Vi???t Nam', N'Apple', N'Zoom s??? hi???n ??ang ph??t tri???n kh?? m???nh m???, nh??? t??nh ti???n d???ng, gi?? th??nh r??? v?? c??ng ngh??? ph??t tri???n m???nh, ???????c s??? d???ng kh??ng ch??? tr??n m??y ???nh m?? c??? tr??n c??c d??ng smartphone v???i kh??? n??ng zoom ???n t?????ng.', N'75% ng?????i d??ng th??ch s???n ph???m n??y !')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'ADMIN', N'Administrators')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'GUEST', N'Guests')
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'USER', N'Users')
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (NULL) FOR [review]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Accounts] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Accounts]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_Authorities_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_Authorities_Roles]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_product] FOREIGN KEY([productid])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_product]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories] FOREIGN KEY([categoryid])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_products_categories]
GO
