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
INSERT [dbo].[Address] ([id], [country], [firstname], [lastname], [address], [phone], [email], [username]) VALUES (16, N'Vietnam', N'Minh', N'BÙI', N'106 Lý thường Kiệt', N'0914054080', N'rongkho2@gmail.com', N'user3')
GO
INSERT [dbo].[Address] ([id], [country], [firstname], [lastname], [address], [phone], [email], [username]) VALUES (17, N'Vietnam', N'DUC', N'hà', N'106 ly thường kiệt, HCM CITY, VN', N'0914054080', N'rongkho2@gmail.com', N'user1')
GO
INSERT [dbo].[Address] ([id], [country], [firstname], [lastname], [address], [phone], [email], [username]) VALUES (21, N'Vietnam', N'DUC', N'MINH', N'106 ly thường kiệt, HCM CITY, VN', N'0914054080', N'rongkho2@gmail.com', N'user4')
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
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Máy tính')
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (4, N'Điện thoại di động')
GO
INSERT [dbo].[Categories] ([id], [name]) VALUES (5, N'Phụ kiện & Kháca')
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
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (25, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'238574', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (26, N'user3', CAST(N'2022-04-03' AS Date), N'HCM CITY', 3, N'726838', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (27, N'user3', CAST(N'2022-04-03' AS Date), N'HCM CITY', 4, N'726838', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (28, N'user3', CAST(N'2022-04-03' AS Date), N'HCM CITY', 2, N'756590', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (29, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 1, N'712656', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (30, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 3, N'712656', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (31, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'511104', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (32, N'user3', CAST(N'2022-04-03' AS Date), N'HCM CITY', 2, N'988174', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (33, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'804364', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (34, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 3, N'804364', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (35, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'590766', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (36, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 3, N'590766', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (37, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'286021', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (38, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'393925', 0, 4)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (39, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 3, N'393925', 0, 7)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (40, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 8, N'393925', 0, 10)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (41, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 1, N'901631', 0, 15)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (42, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'251744', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (43, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 5, N'866211', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (44, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 11, N'397329', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (45, N'user2', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 3, N'742531', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (46, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 4, N'200225', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (47, N'user2', CAST(N'2022-04-03' AS Date), N'HCM CITY', 2, N'752331', 0, 7)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (48, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 1, N'270311', 0, 3)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (49, N'user3', CAST(N'2022-04-03' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'833244', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (50, N'user2', CAST(N'2022-04-04' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 1, N'799436', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (51, N'user3', CAST(N'2022-04-04' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 6, N'407799', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (52, N'user1', CAST(N'2022-04-04' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 0, N'119627', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (53, N'user2', CAST(N'2022-04-04' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'712501', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (54, N'user4', CAST(N'2022-04-04' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'515898', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (55, N'user4', CAST(N'2022-04-04' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'653249', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (56, N'user3', CAST(N'2022-04-04' AS Date), N'HCM CITY', 0, N'153841', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (57, N'user2', CAST(N'2022-04-04' AS Date), N'HCM CITY', 1, N'661165', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (58, N'user4', CAST(N'2022-04-04' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 3, N'733595', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (59, N'user3', CAST(N'2022-04-04' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 13, N'853364', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (60, N'user3', CAST(N'2022-04-04' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'479020', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (61, N'user3', CAST(N'2022-04-04' AS Date), N'HCM CITY', 13, N'356824', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (62, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 7, N'655973', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (63, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 12, N'655973', 0, 3)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (64, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'454135', 0, 2)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (65, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 13, N'549745', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (66, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 6, N'366355', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (67, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 2, N'763820', 0, 1000)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (68, N'user3', CAST(N'2022-04-05' AS Date), N'106 ly thường kiệt, HCM CITY, VN', 12, N'881912', 0, 20)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (69, N'user2', CAST(N'2022-04-07' AS Date), N'106 ly thường kiệt, HỒ CHÍ MINH', 1, N'225546', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (70, N'user2', CAST(N'2022-04-07' AS Date), N'106 ly thường kiệt, HỒ CHÍ MINH', 3, N'225546', 0, 8)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (71, N'user3', CAST(N'2022-04-07' AS Date), N'106 Lý thường Kiệt', 2, N'569120', 0, 1)
GO
INSERT [dbo].[Orders] ([id], [username], [createdate], [address], [productid], [name], [status], [qty]) VALUES (72, N'USER2', CAST(N'2022-04-20' AS Date), N'QWE', 2, N'321384', 0, 2)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (0, N'i3 - Gen 10th', N'p1.PNG', 200, CAST(N'9999-12-31' AS Date), 0, 3, 98, N'Việt Nam', N'Itel', N'Intel Core i3 Gen 10 là một bộ xử lý độc quyền của Intel được xây dựng trên khuôn khổ của kiến ​​trúc đa xử lý.

Nó là một loại vi xử lý lõi kép với một đơn vị xử lý đồ họa tích hợp (GPU).', N'91% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (1, N'Chuột Razor Gaming', N'p2.PNG', 150, CAST(N'2001-12-31' AS Date), 0, 5, 79, N'Việt Nam', N'MSI', N'Razer DeathAdder Essential thiết kế đơn giản với kiểu dáng truyền thống, tạo điểm nhấn nhờ logo Razer nổi bật phong cách gaming, hình thái vừa vặn tay đảm bảo không gây mỏi cổ tay cả khi sử dụng lâu.', N'80% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (2, N'Vỏ PC Cao Cấp', N'p6.PNG', 200, CAST(N'2000-03-31' AS Date), 0, 3, -944, N'Việt Nam', N'Lenovo', N'Đây là loại vỏ bé nhất và cũng có giá trị decor (trang trí) cao nhất cho những người dùng ưa thích sự đơn giản, nhỏ gọn. Đặc điểm của loại vỏ case này là có diện tích và khoảng không rất bé, thế nên khi lựa chọn và sử dụng các linh kiện, bạn phải nghiên cứu và tìm hiểu kỹ trước khi đưa ra quyết định mua sắm.', N'75% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (3, N'Tai Nghe Gaming', N'p4.PNG', 230, CAST(N'2000-03-31' AS Date), 0, 5, 82, N'Việt Nam', N'SamSung', N'Tai nghe nhét trong Samsung EG920B có đi nút đệm tai nghe dạng móc
Giúp người đeo khi vận động mạnh sẽ không bị rớt ra.', N'91% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (4, N'Chuột MSI', N'p5.PNG', 40, CAST(N'1999-03-12' AS Date), 0, 5, 99, N'Việt Nam', N'MSI', N'Chuột MSI Interceptor DS300 Laser GAMING được thiết kế để đảm bảo phù hợp với người thuận tay phải nhất cho các game thủ. ', N'94% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (5, N'Vỏ PC Cao Cấp 2', N'p3.PNG', 245, CAST(N'2003-03-11' AS Date), 0, 3, 80, N'Việt Nam', N'Acer', N'Vỏ Case Máy Tính Thermaltake Level 20 XT Tempered Glass CA-1L1-00F1WN-00 E-ATX sở hữu lớp vỏ hình khối được thiết kế đặc biệt để thể hiện các hệ thống làm mát bằng chất lỏng tùy chỉnh, bo mạch chủ có thiết kế phẳng độc đáo, đặt các bộ phận được hiển thị từ mọi góc độ và thiết kế buồng ngăn cách các bộ phận làm mát', N'100% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (6, N'Itel Core I7 - Gen 10th', N'p7.PNG', 400, CAST(N'1987-04-21' AS Date), 0, 3, 98, N'Việt Nam', N'Itel', N'Core i7 Gen 10 là dòng vi xử lý 64-bit x86-64 hiệu suất cao được Intel thiết kế cho máy tính để bàn và máy tính xách tay cao cấp. Core i7 được giới thiệu vào năm 2008 sau khi dòng Core 2 Quad nghỉ hưu.', N'91% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (7, N'Tay Cầm Chơi Game Điện Thoại', N'p8.PNG', 20, CAST(N'2002-04-11' AS Date), 0, 4, 99, N'Việt Nam', N'Xiaomi', N'Đối với những thể loại game như bóng đá hoặc đua xe thì lợi ích của việc chơi game với tay cầm chơi game hơn hẳn bàn phím. Khi bạn trải nghiệm nút Trigger ở tay cầm Xbox One hoặc PlayStation 4 trong game đua xe bạn có thể ga nhẹ hoặc tăng tốc với nhiều mức độ khác nhau', N'91% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (8, N'Củ Sạc Baseus', N'p9.PNG', 30, CAST(N'1999-03-12' AS Date), 0, 5, 90, N'Việt Nam', N'China', N'Sạc nhanh A2633 20W sở hữu thiết kế nhỏ gọn với hình lục giác thời trang. Công nghệ sạc nhanh lên đến 20W, đáp ứng nhu cầu sử dụng của người dùng, sạc đầy pin nhanh chóng.', N'61% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (9, N'Bàn Phím Cơ Cao Cấp', N'p10.PNG', 45, CAST(N'2003-03-11' AS Date), 0, 3, 100, N'Việt Nam', N'China', N'Thiết kế thời thường, gọn nhẹ, rất thích hợp để chơi game, làm việc.
Có đến 104 phím, vùng phím số dễ dàng thao tác. 
Sử dụng Green Mechanical Switch cho xúc giác chân thật khi tác động,', N'56% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (10, N'Quạt Tản Nhiệt RGB', N'p11.PNG', 100, CAST(N'1987-04-21' AS Date), 0, 3, 100, N'Việt Nam', N'Asus', N'Fan Case Vitra Luna ARGB ( 5 Fan Pack / Kèm điều khiển) là chiếc quạt tản nhiệt cao cấp với đèn RGB bắt mắt, rất đẹp mắt khi dùng để trang trí case máy tính. Đồng thời Vitra Luna ARGB còn đem lại hiệu năng tản nhiệt tốt, phù hợp với các cấu hình chơi game cao cấp.', N'85% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (11, N'Đồ Chơi Trẻ Em', N'p12.PNG', 5000, CAST(N'2002-04-11' AS Date), 0, 5, 80, N'Việt Nam', N'Toy', N'Đồ chơi trẻ em với tính năng siêu việt giúp trở thành thiên tài', N'52% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (12, N'1 Ổ SSD Gigabyte 512GB', N'p13.PNG', 300, CAST(N'2003-03-11' AS Date), 0, 3, 77, N'Việt Nam', N'Gigabyte', N'Ổng cứng KC300 tích hợp TCG Opal 1.0 vô cùng lý tưởng cho các công ty đang thực thi phần mềm quản trị trung tâm để quản lý các chính sách bảo mật, khôi phục mật khẩu, nhật ký thực hiện, cập nhật tự động và tạo/xóa người dùng', N'56% người dùng thích sản phẩm này !')
GO
INSERT [dbo].[Products] ([id], [name], [image], [price], [createdate], [available], [categoryid], [qty], [origin], [manufacture], [describle], [review]) VALUES (13, N'Zoom Cam Cho ĐT', N'p14.PNG', 85, CAST(N'1987-04-21' AS Date), 0, 4, 40, N'Việt Nam', N'Apple', N'Zoom số hiện đang phát triển khá mạnh mẽ, nhờ tính tiện dụng, giá thành rẻ và công nghệ phát triển mạnh, được sử dụng không chỉ trên máy ảnh mà cả trên các dòng smartphone với khả năng zoom ấn tượng.', N'75% người dùng thích sản phẩm này !')
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
