USE [GOANHPHUONGPRJ]
GO
/****** Object:  Table [dbo].[CART]    Script Date: 22/03/2023 8:16:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[USERID] [int] NOT NULL,
	[OPTIONID] [int] NOT NULL,
	[PRODUCTID] [int] NOT NULL,
	[ADDDATE] [datetime] NOT NULL,
	[QUANTITY] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 22/03/2023 8:16:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID] [tinyint] NOT NULL,
	[NAME] [nchar](50) NOT NULL,
	[PURPOSE] [nchar](20) NOT NULL,
	[PURPOSEID] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OPTION]    Script Date: 22/03/2023 8:16:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OPTION](
	[ID] [int] NOT NULL,
	[PRODUCTID] [int] NOT NULL,
	[DESCRIBE] [ntext] NULL,
	[PRICE] [bigint] NULL,
	[DISCOUNT] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[PRODUCTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 22/03/2023 8:16:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[ID] [int] NOT NULL,
	[USERID] [int] NOT NULL,
	[CLIENTNAME] [nchar](50) NOT NULL,
	[PHONENUMBER] [char](15) NOT NULL,
	[TOTALPRICE] [bigint] NULL,
	[STATUS] [int] NULL,
	[LOG] [ntext] NULL,
	[DELIVERYADDRESS] [ntext] NULL,
	[ORDERDATE] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERSTATUS]    Script Date: 22/03/2023 8:16:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERSTATUS](
	[ID] [int] NOT NULL,
	[STATUS] [nchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 22/03/2023 8:16:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[ID] [int] NOT NULL,
	[NAME] [nchar](50) NULL,
	[CATEGORYID] [tinyint] NOT NULL,
	[DESCRIBE] [ntext] NULL,
	[MATERIAL] [nchar](50) NULL,
	[SIZE] [ntext] NULL,
	[COLOR] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUBORDER]    Script Date: 22/03/2023 8:16:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUBORDER](
	[ORDERID] [int] NOT NULL,
	[PRODUCTID] [int] NOT NULL,
	[OPTIONID] [int] NOT NULL,
	[QUANTITY] [tinyint] NOT NULL,
	[PRICEPERUNIT] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDERID] ASC,
	[PRODUCTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 22/03/2023 8:16:21 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[ID] [int] NOT NULL,
	[NAME] [nchar](50) NOT NULL,
	[USERNAME] [char](25) NOT NULL,
	[PASSWORD] [char](20) NOT NULL,
	[PHONENUMBER] [char](15) NULL,
	[ADDRESS] [nchar](100) NULL,
	[GENDER] [bit] NULL,
	[ROLE] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (17, 1, 51, CAST(N'2023-03-15T15:10:33.603' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (2, 1, 2, CAST(N'2023-03-09T20:29:23.957' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (18, 1, 3, CAST(N'2023-03-15T16:35:18.953' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (18, 1, 52, CAST(N'2023-03-15T16:35:21.193' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (21, 1, 3, CAST(N'2023-03-15T16:40:46.827' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (22, 1, 50, CAST(N'2023-03-15T16:41:21.603' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (14, 1, 3, CAST(N'2023-03-12T16:35:56.470' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (16, 1, 1, CAST(N'2023-03-12T16:41:52.450' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (16, 1, 4, CAST(N'2023-03-12T16:41:56.213' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (22, 1, 49, CAST(N'2023-03-15T16:41:27.170' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (14, 1, 63, CAST(N'2023-03-15T16:46:38.180' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (14, 1, 50, CAST(N'2023-03-15T16:47:06.910' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (26, 1, 3, CAST(N'2023-03-15T16:48:26.747' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (27, 1, 3, CAST(N'2023-03-15T17:07:35.373' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (27, 1, 52, CAST(N'2023-03-15T17:07:38.180' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (27, 1, 60, CAST(N'2023-03-15T17:07:41.560' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (17, 1, 67, CAST(N'2023-03-16T07:47:30.573' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (17, 1, 32, CAST(N'2023-03-16T07:47:46.220' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (1, 1, 4, CAST(N'2023-03-08T00:44:53.103' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (1, 1, 2, CAST(N'2023-03-10T18:09:37.273' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (2, 1, 10, CAST(N'2023-03-13T12:32:05.953' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (1, 1, 6, CAST(N'2023-03-13T19:41:35.580' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (1, 1, 16, CAST(N'2023-03-13T19:41:40.660' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (17, 1, 57, CAST(N'2023-03-15T15:10:39.247' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (17, 1, 59, CAST(N'2023-03-15T15:10:41.333' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (17, 1, 2, CAST(N'2023-03-15T16:44:22.097' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (14, 1, 55, CAST(N'2023-03-15T16:46:23.920' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (26, 1, 60, CAST(N'2023-03-15T16:48:31.077' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (26, 1, 35, CAST(N'2023-03-15T16:48:43.903' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (2, 1, 6, CAST(N'2023-03-13T12:32:11.227' AS DateTime), 3)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (1, 1, 67, CAST(N'2023-03-08T00:39:04.633' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (17, 1, 11, CAST(N'2023-03-15T15:10:26.067' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (21, 1, 51, CAST(N'2023-03-15T16:38:41.580' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (18, 1, 40, CAST(N'2023-03-15T16:45:11.720' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (1, 1, 3, CAST(N'2023-03-10T18:02:23.440' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (17, 1, 33, CAST(N'2023-03-15T15:10:29.723' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (23, 1, 60, CAST(N'2023-03-15T16:42:31.063' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (18, 1, 60, CAST(N'2023-03-15T16:45:24.470' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (26, 1, 34, CAST(N'2023-03-15T16:48:09.920' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (19, 1, 6, CAST(N'2023-03-15T16:36:32.970' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (24, 1, 51, CAST(N'2023-03-15T16:43:27.547' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (25, 1, 3, CAST(N'2023-03-15T16:44:02.930' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (18, 1, 35, CAST(N'2023-03-15T16:46:05.690' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (26, 1, 51, CAST(N'2023-03-15T16:48:12.263' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (26, 1, 4, CAST(N'2023-03-15T16:50:07.530' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (19, 1, 50, CAST(N'2023-03-15T16:36:36.680' AS DateTime), 1)
INSERT [dbo].[CART] ([USERID], [OPTIONID], [PRODUCTID], [ADDDATE], [QUANTITY]) VALUES (20, 1, 4, CAST(N'2023-03-15T16:37:36.270' AS DateTime), 1)
GO
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (1, N'Bàn ghế gỗ                                        ', N'Phòng khách         ', 1)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (2, N'Kệ tủ TV                                          ', N'Phòng khách         ', 1)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (3, N'Kệ trang trí                                      ', N'Phòng khách         ', 1)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (4, N'Lọ lục bình                                       ', N'Phòng khách         ', 1)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (5, N'Tranh treo tường                                  ', N'Phòng khách         ', 1)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (6, N'Tủ rượu                                           ', N'Phòng khách         ', 1)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (7, N'Đồng hồ                                           ', N'Phòng khách         ', 1)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (8, N'Tượng mỹ nghệ                                     ', N'Phòng khách         ', 1)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (9, N'Giường ngủ                                        ', N'Phòng ngủ           ', 2)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (10, N'Tủ quần áo                                        ', N'Phòng ngủ           ', 2)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (11, N'Tủ đầu giường                                     ', N'Phòng ngủ           ', 2)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (12, N'Bàn trang điểm                                    ', N'Phòng ngủ           ', 2)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (13, N'Bàn ghế phòng ăn                                  ', N'Phòng ăn            ', 3)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (14, N'Bàn thờ                                           ', N'Phòng thờ           ', 4)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (15, N'Tủ thờ                                            ', N'Phòng thờ           ', 4)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (16, N'Bàn làm việc                                      ', N'Văn phòng           ', 5)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (17, N'Ghế văn phòng                                     ', N'Văn phòng           ', 5)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (18, N'Tủ bếp                                            ', N'Công trình          ', 6)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (19, N'Cửa chính                                         ', N'Công trình          ', 6)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (20, N'Cửa phòng                                         ', N'Công trình          ', 6)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (21, N'Cầu thang                                         ', N'Công trình          ', 6)
INSERT [dbo].[CATEGORY] ([ID], [NAME], [PURPOSE], [PURPOSEID]) VALUES (22, N'Gỗ lót sàn                                        ', N'Công trình          ', 6)
GO
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 1, N'Nguyên mẫu', 29000000, 1)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 2, N'Nguyên mẫu', 32000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 3, N'Nguyên mẫu', 32000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 4, N'Nguyên mẫu', 15000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 5, N'Nguyên mẫu', 21000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 6, N'Nguyên mẫu', 17000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 7, N'Nguyên mẫu', 109000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 8, N'Nguyên mẫu', 119000000, 7)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 9, N'Màu đỏ', 212000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 10, N'Kèm kính trám long phụng', 50000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 11, N'Nguyên mẫu', 87000000, 2)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 12, N'Nguyên mẫu', 80000000, 1)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 13, N'Nguyên mẫu', 9000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 14, N'Màu đỏ', 81000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 15, N'Nguyên mẫu', 32000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 16, N'Nguyên mẫu', 29000000, 7)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 17, N'Nguyên mẫu', 25000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 18, N'3 tầng ', 2000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 19, N'Màu gỗ đỏ', 5000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 20, N'Màu gỗ đỏ', 1500000, 2)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 21, N'Màu gỗ đỏ (tự nhiên)', 9000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 22, N'Nguyên mẫu', 7400000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 23, N'Nguyên mẫu', 70000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 24, N'Nguyên mẫu', 510000000, 2)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 25, N'Nguyên mẫu', 56900000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 26, N'Nguyên mẫu', 8000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 27, N'Nguyên mẫu', 16000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 28, N'Nguyên mẫu', 1000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 29, N'Nguyên mẫu', 2000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 30, N'Nguyên mẫu', 6800000, 2)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 31, N'Nguyên mẫu', 14000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 32, N'Nguyên mẫu', 21000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 33, N'Nguyên mẫu', 14000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 34, N'Nguyên mẫu', 9500000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 35, N'Nguyên mẫu', 24500000, 7)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 36, N'Nguyên mẫu', 27000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 37, N'Nguyên mẫu', 30000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 38, N'Nguyên mẫu', 14200000, 2)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 39, N'Nguyên mẫu', 49000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 40, N'Nguyên mẫu', 21000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 41, N'Dát vàng', 15000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 42, N'Màu đồng (nguyên bản)', 13000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 43, N'Nguyên mẫu', 17000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 44, N'Nguyên mẫu', 6500000, 2)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 45, N'Nguyên mẫu', 14000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 46, N'Nguyên mẫu', 71000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 47, N'Nguyên mẫu', 8000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 48, N'Nguyên mẫu', 180000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 49, N'Nguyên mẫu', 71000000, 2)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 50, N'Nguyên mẫu', 462000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 51, N'Nguyên mẫu', 318000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 52, N'Nguyên mẫu', 60000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 53, N'Nguyên mẫu', 22000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 54, N'Nguyên mẫu', 25000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 55, N'Nguyên mẫu', 2500000, 7)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 56, N'Nguyên mẫu', 39000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 57, N'Nguyên mẫu', 21000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 58, N'Nguyên mẫu', 52000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 59, N'Nguyên mẫu', 85000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 60, N'Nguyên mẫu', 22000000, 2)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 61, N'Đặt lịch thiết kế', 0, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 62, N'Đặt lịch thiết kế', 0, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 63, N'Đặt lịch thiết kế', 0, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 64, N'Đặt lịch thiết kế', 0, 7)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 65, N'Đặt lịch thiết kế', 0, 8)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 66, N'Dày 1,5cm  x  rộng 9cm x dài 45cm', 850000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 67, N'Nguyên mẫu', 939000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 68, N'Nguyên mẫu', 273000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 69, N'Nguyên mẫu', 666000000, 2)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 70, N'Nguyên mẫu', 350000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 73, N'nguyên bản', 21000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 74, N'nguyên bản', 23000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 75, N'nguyên bản', 7000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 76, N'nguyên bản', 12000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 77, N'nguyên bản', 90000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 78, N'nguyên bản', 50000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 79, N'nguyên bản', 38000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 80, N'nguyên bản', 10000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 81, N'nguyên bản', 2100000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 82, N'nguyên bản', 2500000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 83, N'nguyên bản', 12000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 84, N'nguyên bản', 17000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 85, N'nguyên bản', 29000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 86, N'nguyên bản', 1570000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 87, N'nguyên bản', 12000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 88, N'nguyên bản', 9000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 89, N'nguyên bản', 9000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 90, N'nguyên bản', 3, 1)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 91, N'nguyên bản', 14500000, 2)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 92, N'nguyên bản', 79800000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 93, N'nguyên bản', 115000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 94, N'nguyên bản', 69000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 95, N'nguyên bản', 39900000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 96, N'nguyên bản', 3200000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 97, N'nguyên bản', 2900000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 98, N'nguyên bản', 26500000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 99, N'nguyên bản', 29900000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 100, N'nguyên bản', 11700000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 101, N'nguyên bản', 81000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 102, N'nguyên bản', 62000000, 1)
GO
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 103, N'nguyên bản', 189000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 104, N'nguyên bản', 58000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 105, N'nguyên bản', 39500000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 106, N'nguyên bản', 19000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 107, N'nguyên bản', 17600000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 108, N'nguyên bản', 9700000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 109, N'nguyên bản', 2000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 110, N'nguyên bản', 1600000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 111, N'nguyên bản', 27000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 112, N'nguyên bản', 1550000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 113, N'nguyên bản', 2323242, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 114, N'nguyên bản', 22000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 115, N'nguyên bản', 16500000, 1)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 116, N'nguyên bản', 51900000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 117, N'nguyên bản', 52000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 118, N'nguyên bản', 43000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 119, N'nguyên bản', 12300000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 120, N'nguyên bản', 5675000, 43)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 121, N'nguyên bản', 120000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 122, N'nguyên bản', 12000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (1, 123, N'nguyên bản', 120000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 1, N'888', 123, 1)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 2, N'Chỉ mua bàn', 15000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 3, N'Không có đệm', 30000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 9, N'Màu tự nhiên', 810000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 10, N'Kèm kính thường', 47000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 11, N'Khảm bạc họa tiết', 100000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 14, N'Màu tự nhiên', 80000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 18, N'4 tầng (Nguyên mẫu)', 2500000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 19, N'Màu gỗ tự nhiên', 4500000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 20, N'Màu gỗ tự nhiên', 1400000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 21, N'Màu gỗ đen', 11000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 24, N'Khảm bạc chi tiết', 550000000, 3)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 28, N'Dát vàng', 5000000, 4)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 30, N'Thanh Long đao dạ quang hàng ma diệt yêu ', 8000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 39, N'Khảm vàng chi tiết', 60000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 40, N'Khảm bạc chi tiết', 25000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 41, N'Dát bạc', 12000000, 6)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 42, N'Dát vàng', 17000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 48, N'Chỉ bàn ăn', 82000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 49, N'Chỉ bàn ăn', 29000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 50, N'Chỉ bàn ăn', 100000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 66, N'Dày 1,5cm  x  rộng 9cm x dài 60cm', 890000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (2, 72, N'321', 43242, 15)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (3, 10, N'Nguyên mẫu', 45000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (3, 21, N'Dát vàng', 20000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (3, 24, N'Khảm vàng chi tiết', 700000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (3, 50, N'Chỉ ghế chủ', 50000000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (3, 66, N'Dày 1,5cm  x  rộng 9cm x dài 75cm', 910000, 5)
INSERT [dbo].[OPTION] ([ID], [PRODUCTID], [DESCRIBE], [PRICE], [DISCOUNT]) VALUES (4, 66, N'Dày 1,5cm  x  rộng 9cm x dài 90cm ', 930000, 5)
GO
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (0, 1, N'Thân Quang Phương                                 ', N'0904431642     ', 1014800000, 6, N'Order submited', N'Bắc Giang, việt yên -số nhà 302 - duong nguyen tri thanh. nhaf thuoc thu y thuc an chan nuoi hoa binh so 28 duoing 295b', CAST(N'2020-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (1, 1, N'Thân Quang Phương                                 ', N'0973829486     ', 1014800000, 2, N'Order submited', N'Bac lieu, Hồng Thái Việt Yên Bắc Giang                                                                        ', CAST(N'2020-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (2, 16, N'Thân Quang Bình                                   ', N'0696300392     ', 73000000, 2, N'Order submited', N'Bac lieu, bac lieu viet nam', CAST(N'2020-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (3, 2, N'Chu Thị Vân Oanh                                  ', N'0904431642     ', 1202800000, 5, N'Order submited', N'Bac lieu, Bắc Giang                                                                                           ', CAST(N'2020-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (4, 1, N'Thân Quang Phương                                 ', N'094233246543   ', 954000000, 2, N'Order submited', N'fdsaeweeeeeeeeeeeeeeeee, Hồng Thái Việt Yên Bắc Giang  Neenhs                                                                ', CAST(N'2020-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (5, 2, N'Chu Thị Vân Oanh                                  ', N'0904431642     ', 359021896, 2, N'Order submited', N'fdsaeweeeeeeeeeeeeeeeee, Bắc Giang                                                                                           ', CAST(N'2020-06-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (6, 2, N'Chu Thị Vân Oanh                                  ', N'0904431642     ', 64650000, 5, N'Order submited', N'Bắc Giang, việt yên -số nhà 302 - duong nguyen tri thanh. nhaf thuoc thu y thuc an chan nuoi hoa binh so 28 duoing 295b', CAST(N'2020-07-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (7, 1, N'Thân Quang Phương                                 ', N'0904431642     ', 73520000, 5, N'Order submited', N'Bắc Giang, việt yên -số nhà 302 - duong nguyen tri thanh. nhaf thuoc thu y thuc an chan nuoi hoa binh so 28 duoing 295b', CAST(N'2020-08-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (8, 17, N'Yasuo Namikaze                                    ', N'097894232      ', 499380000, 5, N'Order submited', N'thu do ilonia, Ilonia                                                                                              ', CAST(N'2020-09-18T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (9, 18, N'Akali CuaKicuc                                    ', N'5432586435     ', 87400000, 5, N'Order submited', N'Ilonia, Iloni quạn 3 thanh pho ho chi minh', CAST(N'2020-10-19T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (10, 19, N'Naruto Hokage                                     ', N'5432586435     ', 459670000, 5, N'Order submited', N'Ilonia, 95164 Blanda Club, Apt. 868, 47531-8782, Zboncakshire, Wisconsin, United States 14610 Burnice Flat, Apt. 829, 89086-9097, Rossville, New Mexico, United States', CAST(N'2020-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (11, 20, N'Taric Tomoka                                      ', N'5432586435     ', 14550000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2020-12-27T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (12, 21, N'Yone Namikaze                                     ', N'5432586435     ', 298920000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2021-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (13, 21, N'Yone Namikaze                                     ', N'5432586435     ', 329320000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2021-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (14, 22, N'Darius Noburu                                     ', N'5432586435     ', 513100000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2021-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (15, 23, N'Kakashi Hakate                                    ', N'5432586435     ', 21560000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2021-05-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (16, 24, N'Alista                                            ', N'5432586435     ', 298920000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2021-07-16T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (17, 25, N'Gnar                                              ', N'5432586435     ', 30400000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2021-09-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (18, 17, N'Yasuo Namikaze                                    ', N'5432586435     ', 81600000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2021-11-19T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (19, 17, N'Yasuo Namikaze                                    ', N'5432586435     ', 529780000, 5, N'Order submited', N'Ilonia, 95164 Blanda Club, Apt. 868, 47531-8782, Zboncakshire, Wisconsin, United States 14610 Burnice Flat, Apt. 829, 89086-9097, Rossville, New Mexico, United States', CAST(N'2021-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (20, 17, N'Yasuo Namikaze                                    ', N'5432586435     ', 98700000, 5, N'Order submited', N'Ilonia, 95164 Blanda Club, Apt. 868, 47531-8782, Zboncakshire, Wisconsin, United States 14610 Burnice Flat, Apt. 829, 89086-9097, Rossville, New Mexico, United States', CAST(N'2022-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (21, 18, N'Akali CuaKicuc                                    ', N'5432586435     ', 30400000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (22, 18, N'Akali CuaKicuc                                    ', N'5432586435     ', 107140000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-03-13T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (23, 18, N'Akali CuaKicuc                                    ', N'5432586435     ', 87400000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (24, 18, N'Akali CuaKicuc                                    ', N'5432586435     ', 128700000, 5, N'Order submited', N'Ilonia, 95164 Blanda Club, Apt. 868, 47531-8782, Zboncakshire, Wisconsin, United States 14610 Burnice Flat, Apt. 829, 89086-9097, Rossville, New Mexico, United States', CAST(N'2022-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (25, 18, N'Akali CuaKicuc                                    ', N'5432586435     ', 21560000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-06-12T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (26, 14, N'Thân Quang Trung                                  ', N'5432586435     ', 32725000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-07-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (27, 14, N'Thân Quang Trung                                  ', N'5432586435     ', 0, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-08-29T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (28, 14, N'Thân Quang Trung                                  ', N'5432586435     ', 443520000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (29, 26, N'leesin                                            ', N'432654366543   ', 307850000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-10-25T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (30, 26, N'leesin                                            ', N'5432586435     ', 307850000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-11-19T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (31, 26, N'leesin                                            ', N'5432586435     ', 74745000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (32, 26, N'leesin                                            ', N'5432586435     ', 51960000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (33, 26, N'leesin                                            ', N'5432586435     ', 382595000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2023-03-15T16:50:01.137' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (34, 17, N'Yasuo Namikaze                                    ', N'5432586435     ', 298920000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (35, 17, N'Yasuo Namikaze                                    ', N'5432586435     ', 101760000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (36, 17, N'Yasuo Namikaze                                    ', N'5432586435     ', 431080000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2023-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (37, 27, N'ahri                                              ', N'5432586435     ', 108960000, 5, N'Order submited', N'Ilonia, 95164 Blanda Club, Apt. 868, 47531-8782, Zboncakshire, Wisconsin, United States 14610 Burnice Flat, Apt. 829, 89086-9097, Rossville, New Mexico, United States', CAST(N'2023-03-03T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (38, 27, N'ahri                                              ', N'5432586435     ', 87400000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2021-06-14T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (39, 27, N'ahri                                              ', N'5432586435     ', 57000000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-07-15T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (40, 27, N'ahri                                              ', N'5432586435     ', 21560000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2022-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (41, 17, N'Yasuo Namikaze                                    ', N'5432586435     ', 951790000, 1, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2023-03-16T07:48:20.883' AS DateTime))
INSERT [dbo].[ORDER] ([ID], [USERID], [CLIENTNAME], [PHONENUMBER], [TOTALPRICE], [STATUS], [LOG], [DELIVERYADDRESS], [ORDERDATE]) VALUES (42, 17, N'Yasuo Namikaze                                    ', N'5432586435     ', 30400000, 5, N'Order submited', N'Chicaga, 7868 Beth Forest, Suite 610, 96773-6854, Lake Jo, Michigan, United States 337 Murphy Ranch, Suite 944, 04490, Keatonport, Iowa, United States', CAST(N'2023-03-16T07:49:01.157' AS DateTime))
GO
INSERT [dbo].[ORDERSTATUS] ([ID], [STATUS]) VALUES (1, N'Đợi xác nhận                  ')
INSERT [dbo].[ORDERSTATUS] ([ID], [STATUS]) VALUES (2, N'Đang giao                     ')
INSERT [dbo].[ORDERSTATUS] ([ID], [STATUS]) VALUES (4, N'Đang thi công                 ')
INSERT [dbo].[ORDERSTATUS] ([ID], [STATUS]) VALUES (5, N'Hoàn thành                    ')
INSERT [dbo].[ORDERSTATUS] ([ID], [STATUS]) VALUES (6, N'Thất bại                      ')
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (1, N'Bộ sofa góc gỗ hương đá                           ', 13, N'Bộ bàn ghế sofa có thể nói là điểm nhấn quan trọng trong không gian phòng khách, nó không chỉ là nơi để tiếp khách mà nó còn góp phần tô thêm vẻ đẹp sang trọng, đẳng cấp cho không gian phòng khách. Hôm nay Nội thất Sơn Đông sẽ đem đến cho bạn một bộ sofa gỗ hiện đại với thiết kế độc lạ có 1 không 2 trên thị trường.', N'gỗ hương đá                                       ', N'+ Băng 3: pb 2m10 x sâu 63cm x cao 77cm , lọt lòng 1m8 x sâu 44.5cm+ Băng 2: pb 1m65 x sâu 63cm x cao 77cm, lọt lòng 1m3 x sâu 44.5cm+ Bàn: dài 1m44 x rộng 74cm x cao 51cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (2, N'Bộ bàn ghế như ý trương voi gỗ mun đuôi công      ', 1, N'Kiểu dáng: truyền thống', N'gỗ mun đuôi công                                  ', N'+ 1 đoản dài 240cm, rộng 60cm
 + 1 bàn 73x145cm
 + 2 ghế đơn 60x86cm + 
1 đôn cao 73x40cm
 + 1 đôn thấp 40x40cm ', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (3, N'Sofa nệm da thời thượng gỗ gõ đỏ 5M               ', 1, N'Nguồn nguyên liệu: sofa nệm được sử dụng nguyên liệu gỗ gõ đỏ kết hợp nệm da mang đến sản phẩm đạt chuẩn chất lượng. Gỗ gõ đỏ là loại gỗ có độ bền cao, chống mối mọt tốt, chịu va đập được ưa chuộng để làm nên những bộ bàn ghế đẹp.
Mẫu mã thiết kế: theo phong cách hiện đại, thời thượng, đơn giản nhưng không kém phần sang trọng, tinh tế. Kết hợp với nệm da êm ái, tạo sự thoải mái cho người ngồi.', N'Gỗ gõ đỏ                                          ', N'+ Băng D: D 250 – C 65 – S 70
+ Băng N: D 172 – C 65 – S 70
+ Bàn : 130 x 65 – C 50
+ Đôn C: vuông 70 – C 48
+ Đôn N: 100 x 50 – C 48                                                               ', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (4, N'Bộ sofa góc hoa thủy gỗ sồi nga 5 món             ', 1, N'Bộ sofa góc hoa thủy SFG074 được làm từ nguyên liệu gỗ sồi Nga có nguồn gốc rõ ràng, đạt chất lượng. Vì vậy những sản phẩm được làm bằng gỗ sồi Nga đều có trọng lượng nhẹ, dễ được uốn cong, độ bền ở mức khá cao.
Sử dụng nguyên liệu tốt kết hợp với những hoa văn đơn giản giúp không gian phòng khách thêm tinh tế và đẹp mắt hơn.
Ngoài ra bạn cũng có thể tham khảo thêm một số mẫu gối nệm để decor cho bộ sofa góc thêm đẹp và sang trọng.', N'gỗ Sồi Nga (ASH)                                  ', N'+Băng dài : Dài 2m30 ; sâu 70cm ; cao 76cm
+Ghế đơn : Dài 1m20 ; sâu 70cm ; cao 58cm
+Bàn : Dài 1m20 ; rộng 65cm ; cao 43cm
+Đôn : 40x40cm ; cao 30cm
', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (5, N'Bộ sofa nệm tay hộp thời thượng gỗ sồi nga 5 món  ', 1, N'Nếu bạn là người yêu thích không gian hiện đại thì sofa nệm sẽ là lựa chọn phù hợp dành cho những ai đang có nhu cầu muốn sắm một bộ bàn ghế phòng khách nhưng lại không thích phong cách truyền thống.', N'gỗ sồi Nga                                        ', N'+ Đoản dài: 2m2 sâu 70cm cao 65cm
+ Đoản ngắn: 1m8 sâu 70cm cao 65cm
+ Bàn 1m2: ngang 70cm cao 43cm
+ Đôn ngang: 65cm sâu 45cm cao 35cm
+ Bàn kẹp: vuông 60cm cao 47cm                              ', N'Màu gỗ óc chó                                     ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (6, N'Bộ bàn ghế louis gỗ gõ đỏ                         ', 1, N'Bộ ghế louis được nghệ nhân lựa chọn chất gỗ vân rất điều nhau. Nhưng ở bộ Louis này người thợ khi đóng bộ ghế đã đầu tư rất kĩ khi lựa chọn những tấm gỗ có Vân đẹp và đều nhau chính vì thế đã làm tăng giá trị của bộ ghế lên rất nhiều. Bộ ghế louis thuộc danh mục bàn ghế phòng khách với lối thiết kế sang trọng, hiện đại và đẳng cấp. Đảm bảo khi bộ ghế được đặt tại phòng khách sẽ mang đến nét mới lạ, đồng thời tôn vinh nên vẻ đẹp của ngôi nhà.', N'gỗ gõ đỏ                                          ', N'+ Đoản dài: 2m2 sâu 70cm cao 65cm
+ Đoản ngắn: 1m8 sâu 70cm cao 65cm
+ Bàn 1m2: ngang 70cm cao 43cm
+ Đôn ngang: 65cm sâu 45cm cao 35cm
+ Bàn kẹp: vuông 60cm cao 47cm                              ', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (7, N'Bộ bàn ghế hương đá chạm đào tựa gương tay lân    ', 1, N'Bộ bàn ghế salon tay 12 không quá lớn, với số lượng món lên đến 12 thì diện tích sử dụng sẽ tăng lên 1 tí, và rất thích hợp với gia đình có nhiều thành viên !  Phiên bản giới hạn Chạm đào 2 mặt Yếm dày 3 phân Khung bao 3 phân, Ván mặt 1.5 phân Tựa 3 phân Vân tuyển siêu đẹp.
 Bàn ghế hương đá chạm đào phiên bản nhiều món nhưng tay cột 12 không quá to tạo cảm giác nhẹ nhàng, đơn giản cho không gian phòng khách.', N'Gỗ hương đá Nam Phi                               ', N'+ Đoản: dài 2m05, sâu 64cm, cao 1m20
+ Ghế đơn: ngang 90cm, sâu 64cm, cao 1m20
+ Đôn kẹp: 66 x 56, cao 52cm
+ Đôn ngồi: 56 x 56, cao 41cm
+ Bàn nhỏ: dài 88cm, rộng 49cm, cao 56cm
+ Bàn lớn: dài 1m67, rộng 88cm, cao 56cm
  ', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (8, N'Bộ bàn ghế hoàng gia hương đá hoa hồng            ', 1, N'Bộ bàn ghế hoàng gia hương đá hoa hồng chân 14 BBG448 là một sự kết hợp độc đáo giữa phong cách cổ điển của phương Tây với nghệ thuật chạm khắc và phong cách truyền thống của phương Đông. Sản phẩm sẽ mang đến sự sang trọng cũng như ý nghĩa phong thủy cực tốt cho những gia chủ yêu thích sự độc đáo, cách tân và mới mẻ.  ', N'gỗ hương đá                                       ', N'+ Đôn ngồi: vuông 45cm, cao 49cm
+ Ghế đơn: Kích thước phủ bì: cao 1m45, ngang 1m05, sâu 72cm.
Lọt lòng: sâu 58cm, ngang 70cm.
+ Đoản: Phủ bì: cao tổng 1m47, ngang 2m6, sâu 73cm.
Lọt lòng: ngang 2m2, sâu 58cm.
+ Bàn chính: Phủ bì: rộng 90cm, dài 1m67, cao 60cm.
+ Mặt bàn: dài 1m57, rộng 79cm.
+ Đôn cao: 45cm x 79cm, cao 59cm.', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (9, N'Bộ bàn ghế gỗ gõ đỏ chạm nghê tay                 ', 1, N'10 món, hàng mộc', N'gỗ gõ đỏ                                          ', N'+ Băng 3: pb 2m10 x sâu 63cm x cao 77cm , lọt lòng 1m8 x sâu 44.5cm
+ Băng 2: pb 1m65 x sâu 63cm x cao 77cm, lọt lòng 1m3 x sâu 44.5cm
+ Bàn: dài 1m44 x rộng 74cm x cao 51cm    ', N'Màu dỏ, tự nhiên                                  ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (10, N'Bộ bàn ghế gỗ hương đào vân tuyển 6 món           ', 1, N'Siêu phẩm phòng khách, bộ bàn ghế gỗ hương đào vân tuyển được làm khác với các bộ ghế cùng loại ở nhiều chi tiết. Các nghệ nhân đã thổi hồn vào từng nét chạm khắc tinh xảo, uyển chuyển không kém phần sang trọng. Qua đó đặc tả được vẻ đẹp văn hóa cũng như nhiều ý nghĩa phong thủy tốt đẹp.', N'gỗ hương                                          ', N'+ Băng dài: Dài 2m07 cao 1m18 s 52
+ Ghế đơn: N 94 cao 118 s 52
+ Bàn : 1m35 x 67 cao 51
+ Đôn trà: 50 x 40 cao 51
+ Đôn ngồi: Vuông 40 cao 40', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (11, N'Tủ tivi cẩm lai tứ linh vệ hồn                    ', 2, N'Tủ tivi cẩm lai tứ linh vệ hồn 2,4m với thiết kế tinh xảo, chất liệu gỗ quý hiếm và ý nghĩa phong thủy cực tốt sẽ là một lựa chọn tuyệt vời cho những  gia chủ yêu thích phong cách truyền thống cùng nghệ thuật chạm khắc thủ công của dân tộc.', N'gỗ cẩm lai việt                                   ', N'+Dài 2m37 Cao 70cm Sâu 50cm ', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (12, N'Tủ tivi cẩm lai hoàng gia Lusso cẩn verneer       ', 2, N'Tủ tivi hoàng gia Lusso có chất liệu là gỗ cẩm lai thuộc nhóm I các loại gỗ quý hiếm của nước ta. Cẩm lai rất được giới thượng lưu, đặc biệt là những dân chơi sành gỗ săn đón bởi thớ mịn, vân gỗ đa hệ (mỗi cây gỗ sẽ có một hệ vân khác nhau vô cùng độc đáo) và sắc nét, có lúc cuộn tròn như những áng mây bồng bềnh. ', N'gỗ cẩm lai cao cấp                                ', N'+ 2m', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (13, N'Tủ tivi hiện đại sang trọng gỗ sồi                ', 2, N'Hiện đại sang trọng', N'gỗ Sồi Nga (ASH)                                  ', N'+ngang 2m2', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (14, N'Tủ tivi kết hợp vách ngăn phòng gỗ hương đá       ', 2, N'Với những gia chủ thích thiết kế tối giản, thông thoáng, hạn chế các bức tường ngăn cách trong nhà của mình thì tủ tivi hết hợp kệ trang trí và vách ngăn phòng khách TTV1007 sẽ là lựa chọn tuyệt vời. Sản phẩm vừa giúp tạo không gian riêng tư cho phòng khách với khu vực sinh hoạt khác mà vẫn đảm bảo sự gắng kết trong bố cục của ngôi nhà.', N'Gỗ hương đá Nam Phi                               ', N'+Ngang 3m3 x cao 2m5 x sâu 35cm', N'Tự nhiên , đỏ                                     ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (15, N'Tủ Tivi Gỗ Gụ Trụ Trơn Quảng Bình                 ', 2, N'Tủ tivi gỗ gụ trụ trơn Quảng Bình TTV601 được làm từ nguyên liệu 100% gỗ gụ, là loại gỗ quý hiếm cao cấp của Việt Nam, hơn thế gỗ gụ mang đến vẻ đẹp tự nhiên cho nên chất lượng có tốt hay không chắc không cần bàn tới nữa.', N'gỗ gụ                                             ', N'+ Ngang: 2m2 x sâu 57 x cao 89cm
+ Bậc giữa: ngang 1m15 x sâu 52cm
+ 2 bậc 2 bên: ngang 53cm x sâu 45cm
', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (16, N'Kệ trang trí khung lục bình gỗ cẩm lai            ', 3, N'Kệ trang trí khung lục bình gỗ cẩm lai', N'gỗ cẩm lai                                        ', N'+ cao 2m ngang 50cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (17, N'Kệ trang trí gỗ đỏ                                ', 3, N'Để tránh nhàm chán trong màu sắc trong thiết kế của căn phòng. Bạn nên chọn những mẫu kệ trang trí thiết kế dạng độc đáo thu hút như mẫu sản phẩm ngay hôm nay nhằm đem đến tác dụng tương sinh với màu sắc trong gia chủ. Kệ được làm từ chính dòng gỗ gõ đỏ cao cấp, đục chạm nét chữ phong thủy, kiểu dáng độc đáo bắt mắt. Thật khó có thể xác định được giá trị của những kệ trang trí làm hoàn toàn bằng gỗ tự nhiên như thế này bởi ngoài giá trị là một chiếc kệ dùng để trang trí, chúng còn là một tác phẩm nghệ thuật trang hoàng lộng lẫy cho không gian sống của gia đình bạn một cách đặc biệt và rất riêng.', N'gõ đỏ                                             ', N'+ 1m75*2m17', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (18, N'Kệ góc trưng bày gỗ gụ                            ', 3, N'Sang trọng, nâng cao đẳng cấp gia chủ', N'gỗ gụ                                             ', N'+ 1.5 m x 0.4m', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (19, N'Lục bình gỗ hương đá trơn cao                     ', 4, N'Sang trọng, nâng cao đẳng cấp gia chủ', N'Gỗ hương                                          ', N'+ cao 58cm x đường kính 18cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (20, N'Bộ lục bình gỗ hương 9 món                        ', 4, N'Sang trọng, nâng cao đẳng cấp gia chủ', N'gỗ Hương                                          ', N'+ cao từ 12cm đến 36cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (21, N'Tranh thuận buồm xuôi gió gỗ gỗ đỏ                ', 5, N' Là biểu tượng của thành công trong kinh doanh và tranh thuận buồn xuôi gió là bức tranh mang lại nhiều may mắn cho những ai sở hữu nó, làm việc gì cũng thuận lợi, buôn gì cũng thành công.', N'Gỗ Gõ Đỏ                                          ', N'+dài 1.27m x rộng 67cm', N'Tự nhiên, đen, dát vàng                           ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (22, N'Bộ tranh tứ quý gỗ hương                          ', 5, N'Bộ tứ quý là biểu hiện của sự may mắn, phú quý, sung túc. Chính vì thế nên khi về nhà mới mà treo tranh tứ quý thì gia chủ sẽ mang về may mắn, vượng khí, cân bằng sinh khí, có sức khỏe tốt và vượt mọi khó khăn để trường tồn và phúc lộc.', N'Gỗ hương                                          ', N'+dài 107cm x rộng 37cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (23, N'Tủ rượu hoàng gia cổ điển                         ', 6, N'Sang trọng, nâng cao đẳng cấp gia chủ', N'gỗ gõ đỏ                                          ', N'+Cao 270 ngang 168 sâu 58', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (24, N'Tủ rượu cẩm lai lớn Tứ Linh vệ hồn                ', 6, N'Nằm trong bộ sưu tập tứ linh vệ hồn. Sang trọng mà hiện đại, hiện đại mà cổ kính. Thể hiện đẳng cấp gia chủ.', N'Gỗ cẩm lai                                        ', N'+cao 2m75, sâu 78cm, ngang 3m7', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (25, N'Tủ rượu hương đá hoàng gia cổ điển                ', 6, N'Sang trọng, nâng cao đẳng cấp gia chủ', N'gỗ hương đá                                       ', N'+ Ngang 220 cao 235 sâu 50', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (26, N'Đồng hồ gỗ hương đá hoa lan                       ', 7, N'Sang trọng, nâng cao đẳng cấp gia chủ', N'gỗ hương đá                                       ', N'+Cao 1m74, sâu 42, ngang 72', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (27, N'Đồng hồ kim ngưu gỗ hương                         ', 7, N'Sang trọng, nâng cao đẳng cấp gia chủ', N'gỗ Hương Đá                                       ', N'+Cao 1m74, sâu 42, ngang 72', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (28, N'Di lạc gỗ pơ mu cằm thỏi vàng                     ', 8, N'Sang trọng, nâng cao đẳng cấp gia chủ', N'gỗ pơ mu                                          ', N'+ ngang 26 cm; chiều cao 24 cm.', N'Tự nhiên, dát vàng                                ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (29, N'Quan công phất cờ gỗ trắc                         ', 8, N'Võ thánh Quan Công, một trong ngũ hổ tướng của nhà Thục. Là biểu tượng của uy, dũng, trung, tín, lễ, nghĩa. Quan Công được xem là vị thánh chuyên trấn áp hung khí, chống lại những thế lực tà ma ngoại đạo. Chính vì vậy, tượng của ông chuyên dùng để chế lại những hung khí, mang lại sự bình an cho gia chủ và gia đạo. Những hướng nhà bị xấu với tuổi và mệnh của gia chủ thì nên đặt tượng Quan Công trấn giữ ở cửa. Hướng nhà bị sao xấu chiếu đến cũng dùng tượng Quan Công để chế hoá. Nhất là dùng trong các trường hợp căn nhà, những căn phòng nhiều âm khí dễ sinh tai hoạ và nhiều bệnh tật cho gia chủ.', N'gỗ Trắc                                           ', N'+ Cao 40cm, Ngang 17cm, sâu 13cm.', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (30, N'Tượng quan công cưỡi rồng                         ', 8, N'Võ thánh Quan Công, một trong ngũ hổ tướng của nhà Thục. Là biểu tượng của uy, dũng, trung, tín, lễ, nghĩa. Quan Công được xem là vị thánh chuyên trấn áp hung khí, chống lại những thế lực tà ma ngoại đạo. Chính vì vậy, tượng của ông chuyên dùng để chế lại những hung khí, mang lại sự bình an cho gia chủ và gia đạo. Những hướng nhà bị xấu với tuổi và mệnh của gia chủ thì nên đặt tượng Quan Công trấn giữ ở cửa. Hướng nhà bị sao xấu chiếu đến cũng dùng tượng Quan Công để chế hoá. Nhất là dùng trong các trường hợp căn nhà, những căn phòng nhiều âm khí dễ sinh tai hoạ và nhiều bệnh tật cho gia chủ.', N'gỗ hương                                          ', N'+ cao 60cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (31, N'Tượng song mã phi thiên tài lộc                   ', 8, N'Ngựa tượng trưng cho tốc độ, sự bền bỉ và lòng kiên trì.
– Là biểu tượng cho sự thăng tiến, thành đạt, mang lại tài lộc một cách nhanh chóng nhất.
– Theo phong thủy, trưng bày tượng gỗ song mã không chỉ giúp mang đến nguồn năng lượng tốt, giúp gia chủ trở nên tràn đầy năng lượng mà còn giúp xoay chuyển cục diện bế tắc, thăng tiến, thành công trong mọi việc.
– Tượng gỗ song mã phù hợp để trưng bày tại nhiều không gian khác nhau như phòng khách, phòng làm việc, cửa hàng… Đặc biệt là song mã còn được trưng trong phòng ngủ giúp vợ chồng hạnh phúc.', N'Gỗ cẩm lai                                        ', N'+ 55cmx71cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (32, N'Giường MIDLAND King bed                           ', 9, N'Giường ngủ gỗ óc chó kiểu hiện đại được xem là một trong nhưng xu hương nội thất ngày nay, được rất nhiều giới đại gia tin dùng và sở hữu.', N'gỗ óc chó                                         ', N'+ 1m6 x 2m', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (33, N'Giường ngủ cẩm lai chạm hoa văn                   ', 9, N'– Mẫu giường ngủ kết hợp 2 dòng gỗ cao cấp mang lại giá trị sử dụng bền bỉ
– Sản phẩm sở hữu giá trị thẫm mỹ bậc nhất nhưng lại có giá thành vô cùng hợp lí
– Giường ngủ thiết kế 2 hộc kéo cực kì tiện dụng.Khắc chạm hoa văn hoa lá tây nhẹ nhàng, tinh tế phù hợp với nhiều phong cách nội thất khác nhau.', N'gỗ cẩm lai + cốt teak                             ', N'+ 1m8 x 2m', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (34, N'Giường ngủ gỗ hương xám giá rẻ                    ', 9, N'Mẫu giường ngủ phổ thông', N'Gỗ hương xám                                      ', N'+ 1m6 x 2m', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (35, N'Giường ngủ hiện đại gõ đỏ                         ', 9, N'+ Giường được thiết kế với dạng lắp ráp vô cùng tiện lợi.
+ Thang giường được làm bằng gỗ nghiến với chất gỗ nặng, gỗ rất dai , chịu lực rất tốt.
+ Giường được thiết kế đơn giản nhưng ko kém phần sang trọng, họa tiết chạm nhẹ làm cho sản phẩm có thêm độ thu hút hơn.
+ Phần vạt giường được thiết kế kiểu vạc phản với khung bao cực kỳ dày dặn.
– Giường ngủ là một đồ nội thất vô cùng quan trọng trong ngôi nhà của bạn. Đây là nơi nghỉ ngơi, thư giãn của các thành viên trong gia đình, một giấc ngủ tốt sẽ khiến bạn tràn đầy năng lượng để làm việc hiệu quả.', N'gỗ gõ đỏ                                          ', N'+ ngang 1m8, dài 2m.', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (36, N'Giường ngủ hoa mai gỗ gõ đỏ                       ', 9, N'Mẫu giường ngủ phân khúc trung bình', N'Gỗ Gõ Đỏ                                          ', N'+ Đầu giường cao 1,1m, đuôi cao 50cm dày 8cm
+ Vai giường rộng 23cm x dày 4cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (37, N'Tủ quần áo gỗ gõ đỏ                               ', 10, N' Những chiếc tủ quần áo trong không gian phòng ngủ của gia đình bạn không chỉ là một vật dụng để đựng đồ mà nó còn thể hiện đẳng cấp của chủ nhân nó. Thật vậy, sở hữu một căn tủ đẳng cấp chưa đủ, mà việc sắp xếp đồ dùng của mình trên nó thể hiện gu thẩm mỹ của mỗi người, tính cách cũng như thể hiện được bản thân mình trong đó.', N'Gỗ gõ đỏ                                          ', N'+ Dài 1,75x cao 2,1m x sâu 60cm.', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (38, N'Tủ Quần Áo Gõ Đỏ 3 Cánh Kệ 3 Tầng xoay            ', 10, N'Một mẫu tủ quần áo mới mẻ và đa năng, kết hợp giữa khung gương và ngăn kệ xoay 360 độ, với chất liệu gỗ gõ đỏ cốt Teak – bền, đẹp, giá cả phải chăng, phù hợp với nhiều đối tượng khách hàng.', N'Gỗ Gõ Đỏ                                          ', N'+ Ngang 1m95, sâu 57cm, cao 2m05', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (39, N'Tủ quần áo hoa hồng 3 cánh                        ', 10, N'Một chiếc tủ quần áo đẹp không những sẽ giúp phòng ngủ thêm sang trọng mà cò quyến rũ hơn khi được làm từ gỗ tự nhiên cao cấp. Phòng ngủ tiêu chuẩn đòi hỏi phải ngăn nắp, sạch sẽ và gọn gàng sẽ giúp bạn có giấc ngủ sâu hơn, khỏe khoắn hơn. Tủ quần áo một trong những món đồ nội thất không thể thiếu trong không gian phòng ngủ.', N'Gỗ gõ đỏ                                          ', N'+ Ngang 1,72m x Sâu 60cm x Cao 2,34m', N'Tự nhiên, khảm vàng                               ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (40, N'Tủ quần áo gõ đỏ 1m2                              ', 10, N'ủ quần áo là một sản phẩm cần thiết cho phòng ngủ của mỗi người. Ngày nay nó không chỉ đơn thuần sử dụng để đựng quần áo, giúp căn phòng thêm gọn gàng mà nó còn như là một món đồ nội thất trang trí cho căn phòng. Ai cũng muốn căn phòng riêng của mình không chỉ thoải mái mà còn phải trông thật sang trọng, thật nổi bật', N'Gỗ gõ đỏ                                          ', N'+ cao 2m13, ngang 1m2 và sâu 60cm.', N'Tự nhiên, khảm bạc                                ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (41, N'Tủ đầu giường Hoàng gia cổ điển                   ', 11, N'Tủ đầu giường gỗ gõ đỏ sơn trắng dát vàng đẳng cấp hoàng gia – TDG029D được thiết kế theo phong cách cổ điển với những đường nét uốn lượn thanh thoát, uyển chuyển', N'gỗ gõ đỏ                                          ', N'+Cao 70cm ngang 66cm sâu 52cm', N'Trắng dát vàng, trắng dát bạc                     ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (42, N'Tủ đầu giường hoàng gia gỗ beech                  ', 11, N'Tủ đầu giường hoàng gia toát lên khí chất vương giả', N'gỗ beech                                          ', N'+Cao 70cm ngang 66cm sâu 52cm', N'Màu đồng, dát vàng                                ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (43, N'Tủ đầu giường Beauty queen                        ', 11, N'Tủ đầu giường Beauty Queen phong cách hoàng gia có chất liệu chính là gỗ beach tự nhiên kết hợp với khung gỗ HDF', N'gỗ beach                                          ', N'+Kích thước: Cao 147 sâu 50 ngang 60 cao mặt 70', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (44, N'Tủ đầu giường cổ điển gỗ gõ đỏ                    ', 11, N'Dòng cổ điển ngày nay vẫn là một cái tên vô cùng hot với người tiêu dùng, một sự lựa chọn ưa chuộng nhất trong các kiểu cách. Chính vì vậy, ngày nay những dòng sản phẩm được thiết kế rất đa dạng mẫu mã thể hiện lên đúng tiêu chuẩn cổ điển mang lại.', N'Gỗ gõ đỏ                                          ', N'+ cao 67cm ;rộng 56cm; sâu 47cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (45, N'Bàn phấn hương đá khung tròn                      ', 12, N'Bàn trang điểm hay bàn phấn quen thuộc không chỉ là sản phẩm nội thất phòng ngủ thông thường mà còn như là người bạn thân thiết của các chị em.', N'Gỗ hương đá                                       ', N'+ Dài 1m2 x Rộng 43 cm x Cao 1m74.', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (46, N'Bàn trang điểm cổ điển Royal châu Âu              ', 12, N'Bàn trang điểm được làm từ gỗ gõ đỏ nhóm 1 cao cấp, đây là loại gỗ đang thịnh hành trên thế giới với ưu điểm nổi bật vượt trội .Chưa kể đến mẫu bàn phấn trang điểm gỗ tự nhiên còn được trang bị 1 tấm gương có độ sáng trong, độ bền cao, với diện tích lớn giúp bạn có thể soi được toàn bộ khuôn mặt.', N'gỗ gõ đỏ                                          ', N'+ Ngang 1m86, sâu 57cm, cao tổng 2m02, cao từ đất lên mặt bàn : 82cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (47, N'Bàn phấn gõ đỏ mẫu mới                            ', 12, N'Bàn phấn gõ đỏ mẫu mới là món đồ nội thất phòng ngủ quan trọng góp phần tăng thêm tính thẩm mỹ cho không gian sống của gia chủ. Bàn trang điểm được thiết kế theo phong cách đơn giản trẻ trung với sự tiện lợi cho người sở hữu', N'gỗ gõ đỏ                                          ', N'+Phù bì ngang 1m09, sâu 41xm, cao từ đất lên mặt bàn 72cm, cao tổng 1m68, ghế ngồi 28×28 cao 40cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (48, N'Bộ bàn ăn cẩm lai 8 ghế chạm đào                  ', 13, N'Bộ bàn ăn cẩm lai 8 ghế chạm đào tựa bình bàn tròn mặt nu liền tấm BBA4368T là sự kết hợp giữa hai nguyên liệu đắt đỏ là gỗ cẩm lai và nu gõ đỏ, mang đến vẻ đẹp đẳng cấp. Sản phẩm được nhiều gia đình Việt lựa chọn để tô điểm cho không gian dùng bữa nhà mình thêm ấm cúng, sang trọng. Cùng tìm hiểu những đặc điểm nổi bật của bộ bàn ăn này nhé!  

', N'gỗ cẩm lai + nu gõ đỏ                             ', N'+Bàn: cao 79, đk 1m32
+Ghế: cao tổng 1m09, cao mặt ngồi 48, sâu 41
', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (49, N'Bộ bàn ăn gỗ cẩm lai hiện đại                     ', 13, N'Sử dụng bàn ghế ăn gỗ Cẩm Lai với màu sắc sang trọng, là một trong những xu hướng được rất nhiều gia đình ưa chuộng hiện nay với những đường vân mang nét đẹp huyền ảo và bắt mắt.', N'Gỗ cẩm lai                                        ', N'+Kích thước bàn ăn: Dài 1m96, rộng 97cm, cao 75cm
+Kích thước ghế ăn : Cao tổng 1m05, ngang 42cm, sâu 47. 
', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (50, N'Bộ Bàn Ăn Apollonia Gỗ Cẩm Lai                    ', 13, N'Bộ bàn Ăn Apollonia Gỗ Cẩm Lai Việt Nam Siêu Đẹp được chế tác từ gỗ Cẩm Lai Việt Nam, xứng đáng là siêu phẩm nội thất cổ điển, sang trọng, đẳng cấp để trang trí nhà lớn, biệt thự, lâu đài. Nhiều chuyên gia đánh giá cao vẻ đẹp cùng chất lượng sản phẩm. Cùng tìm hiểu đặc điểm nổi bật, thu hút của bộ bàn ăn này nhé!', N'Gỗ Cẩm Lai                                        ', N'+ 200cm x 100cm Cao 79', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (51, N'Bộ Bàn ăn hoàng gia Louis Fidia                   ', 13, N'Bộ bàn ăn hoàng gia Louis Fidia là một sản phẩm đặc biệt trong bộ sưu tập nội thất Luxury của Sơn Đông bởi thiết kế sang trọng cùng chất liệu gỗ gõ đỏ nguyên tấm quý hiếm hứa hẹn sẽ hồ biến không gian phòng ăn của những đại gia yêu thích phong cách cổ điển trở thành lâu đài xa hoa. ', N'Gỗ gõ đỏ                                          ', N'+ Rộng 1m13, dài 3m03, dày 14cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (52, N'Bộ bàn ăn hiện đại gỗ sồi bọc nệm                 ', 13, N'Mẫu bàn ăn này mang đến vẻ hiện đại cá tính và vô cùng đẳng cấp, với thiết kế chân bè cạnh vát đầy ấn tượng, tạo cảm giác phiêu lưu và mới lạ được nhiều gia chủ lựa chọn cho không gian bếp của gia đình.', N'Gỗ Sồi Mỹ + da simili cao cấp                     ', N'+Bàn: dài 2m2, rộng 1m01, cao 72cm
+Ghế: cao tổng 1m05, sâu phủ bì 58cm, ngang phủ bì 48cm, mặt ghế ngang +40cm, sâu 43cm, cao tựa lưng 60cm
', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (53, N'Bàn thờ chung cư tam cấp hoa sen                  ', 14, N'Bàn thờ gia tiên gỗ là dòng nội thất thiết yếu quan trọng hàng đầu trong không gian thờ phụng tổ tiên của người Việt Nam nói riêng và Á Đông nói chung. Được chạm trổ những hoa văn đẹp tinh tế để thể hiện ước muốn, nguyện vọng đạt được những điều tốt đẹp hơn trong cuộc sống. Thể hiện sự biết ơn với ông bà tổ tiên, tấm lòng hiếu kính của con cháu với thế hệ đi trước.', N'gỗ Gõ Đỏ                                          ', N'+ Bậc 1: cao 1,07m x sâu 54cm.
+ Bậc 2: cao + 18cm x sâu 17cm.
+ Bậc 3: cao + 27cm x sâu 14cm.', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (54, N'Bàn thờ ngũ phúc gỗ gõ đỏ nhị cấp                 ', 14, N'Bàn thờ gia tiên gỗ là dòng nội thất thiết yếu quan trọng hàng đầu trong không gian thờ phụng tổ tiên của người Việt Nam nói riêng và Á Đông nói chung. Được chạm trổ những hoa văn đẹp tinh tế để thể hiện ước muốn, nguyện vọng đạt được những điều tốt đẹp hơn trong cuộc sống. Thể hiện sự biết ơn với ông bà tổ tiên, tấm lòng hiếu kính của con cháu với thế hệ đi trước.', N'gỗ Gõ Đỏ                                          ', N'+ Kích thước tổng: ngang 1m53, sâu 81cm và cao 1m47
+ Bậc nhị: ngang 1m53, cao so với mặt dưới 20cm, sâu 20cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (55, N'Bàn thờ treo gỗ gõ đỏ chạm sen                    ', 14, N'Bàn thờ treo chạm sen BTT207 cao cấp được sử dụng 100% gỗ gõ đỏ có độ cứng và bền bỉ cao: Gỗ gõ Đỏ có độ cứng cao, có khả năng chịu va đập mạnh, chống chịu ẩm, nước tốt. Do đó đồ nội thất làm từ gỗ này sẽ có tuổi thọ cao.', N'gỗ Gõ Đỏ                                          ', N'+ Ngang 1m07 ; sâu 57cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (56, N'Tủ thờ gõ đỏ 13 ô trám cẩn ốc                     ', 15, N'Tủ thờ gỗ mang đến gian phòng thờ trang trọng hơn, ngoài ra tủ thờ còn thuận tiện hơn vì có chỗ để đồ thờ cúng trong tủ như nhang, đèn, bình hoa,… kín đáo tạo cho gian thờ cảm giác gọn gàng, trang trọng', N'Gỗ Gõ Đỏ                                          ', N'+ Cao tổng 1m54 Mặt Ngang 1m34, sâu 67cm Chân ngang 1m4, sâu 69cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (57, N'Tủ thờ gõ đỏ tam đa lắp ráp, mặt bầu              ', 15, N'Chi tiết: Tủ được thiết kế theo kiểu lắp ráp. Mặt chạm rất tỉ mỉ hội tụ phong thủy với các hình ảnh : Tam Đa, Hạc, Tứ linh. Tủ mang những đường nét chạm rất tỉ mỉ, kèm theo đó là màu sắc và vân gỗ gõ đỏ tự nhiên , những đường vân gỗ được hiện lên rất rõ và rất nổi bật, làm cho bộ sản phẩm càng thêm sự thu hút và nổi bật.', N'gỗ gõ đỏ                                          ', N'+ 1m5 x 2m', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (58, N'Bàn làm việc cổ điển Obama gỗ gõ đỏ               ', 16, N'Với những vị thương gia thành đạt, một gian phòng làm việc trang trọng luôn được quan tâm hàng đầu bởi không chỉ là nơi khơi dậy cảm hứng làm việc mà đại diện cho đẳng cấp của người chủ nhân cũng như để tiếp đón đối tác, những vị khách quý. Dù là ở công ty hay phòng làm việc riêng tại nhà đều cần được chăm chút tỉ mỉ. Chính vì thế mà Sơn Đông đã chế tác nên sản phẩm bàn làm việc cổ điển Obama gỗ gõ đỏ BLV16 từ chất liệu gỗ cao cấp, thiết kế tinh xảo và kỳ công sẽ giúp không gian phòng làm việc của quý khách toát lên sự sang trọng và đẳng cấp. ', N'Gỗ gõ đỏ                                          ', N'+Bàn dài 2m17, rộng 1m07, cao 81cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (59, N'Bàn làm việc CEO Luxury dát vàng Ý                ', 16, N'CEO mới ngồi được vào bàn làm việc này. Sang trọng, đẳng cấp, quý phái.', N'Gỗ gõ đỏ + Dát vàng Ý                             ', N'+ D 197 S 87 C 81', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (60, N'Ghế làm việc LUXURY siêu phẩm                     ', 17, N'Trời sinh một cặp với bàn làm việc CEO Luxury. Gói gọn trong một từ "Siêu phẩm"', N'gỗ gõ đỏ + bọc da xịn                             ', N'+ C137 S 61 N 68', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (61, N'Mẫu nhà bếp cổ điển đẹp 2020 MTB020               ', 18, N'Liên hệ để tiến hành đặt gói thi công', NULL, NULL, N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (62, N'Mẫu tủ bếp sang trọng gỗ quý tại sài gòn MTB008   ', 18, N'Liên hệ để tiến hành đặt gói thi công', NULL, NULL, N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (63, N'Mẫu cửa chính châu âu thiên thần DR013            ', 19, N'Liên hệ để tiến hành đặt gói thi công', NULL, NULL, N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (64, N'Cửa phòng tân cổ điển châu âu CP010               ', 20, N'Liên hệ để tiến hành đặt gói thi công', NULL, NULL, N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (65, N'Mẫu cầu thang cổ điển Châu Âu CT016               ', 21, N'Liên hệ để tiến hành đặt gói thi công', NULL, NULL, N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (66, N'Ván sàn gỗ căm xe – VSCX001                       ', 22, N'-Dày 1,5cm  x  rộng 9cm x dài 45cm = 850.000đ/m2

-Dày 1,5cm  x  rộng 9cm x dài 60cm = 890.000đ/m2

-Dày 1,5cm  x  rộng 9cm x dài 75cm = 910.000đ/m2

-Dày 1,5cm  x  rộng 9cm x dài 90cm = 930.000đ/m2

-Dày 1,5cm  x  rộng 9cm x dài 120cm = 980.000đ/m2

-Dày 1,5cm  x  rộng 12cm x dài 45cm = 830.000đ/m2

-Dày 1,5cm  x  rộng 12cm x dài 60cm = 920.000đ/m2

-Dày 1,5cm  x  rộng 12cm x dài 75cm = 960.000đ/m2

-Dày 1,5cm  x  rộng 12cm x dài 90cm = 990.000đ/m2

-Dày 1,5cm  x  rộng 12cm x dài 120cm = 1.050.000đ/m2

-Dày 1,5cm  x  rộng 15cm x dài 45cm = 940.000đ/m2

-Dày 1,5cm  x  rộng 15cm x dài 60cm = 960.000đ/m2

-Dày 1,5cm  x  rộng 15cm x dài 75cm = 1.060.000đ/m2

-Dày 1,5cm  x  rộng 15cm x dài 90cm = 1.120.000đ/m2

-Dày 1,5cm  x  rộng 15cm x dài 120cm = 1.300.000đ/m2', N'gỗ Căm Xe                                         ', NULL, N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (67, N'Minh quốc Triện Gỗ Nu Nghiến                      ', 1, N'Nếu là một dân chơi sành gỗ và luôn muốn sở hữu những sản phẩm quý hiếm, độc đáo thì bộ bàn ghế Minh Quốc Triện gỗ nu nghiến – BBG535 sẽ là ứng cử viên sáng giá cho bộ sưu tập nội thất gỗ cao cấp của quý khách.', N'gỗ nu nghiến                                      ', N'+ 1 Băng dài: dài 1,97m x rộng 65cm x cao 1,2m
+ 4 Ghế đơn : Ngang 90cm, sâu 65cm. Cao mặt ngồi 41cm, cao phủ bì 1,2m
+ 1 Bàn: 83cm x 1,35m x cao 58cm
+ 2 Đôn kẹp : 50cm x 60cm x cao 59cm
+ 2 Đôn ngồi: 50cm x 57cm cao 53cm', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (68, N'Combo Phòng ngủ Royal Châu Âu VIP PN309           ', 9, N'Bộ Gồm:
+ Giường ngủ cổ điển Royal châu Âu VIP – GN309 – 106.900.000 ₫
+ Bàn phấn cổ điển Royal châu Âu VIP – BP309 – 76.900.000 ₫
+ Tủ đầu giường cổ điển Royal châu Âu VIP – TDG309 – 29.900.000 ₫
+ Tủ tivi hoàng gia louis Royal 2.4M VIP – TTV866 – 59.500.000 ₫', NULL, NULL, N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (69, N'Sofa Gỗ Dát Vàng Hoàng Gia Michael Jackson        ', 1, N'Sofa phòng khách được làm bằng nguyên liệu gỗ beech kết hợp với những họa tiết được dát vàng ý đầy sang trọng, đẳng cấp.
Điều đặc biệt tạo nên sự êm ái cho chiếc ghế đó chính là phần tựa lưng, tay ghế và mặt ghế được bọc nệm với nguyên liệu da bò cao cấp.
Chiếc bàn được dát vàng ý 100%, được đục chạm hình ảnh hoa lá tây đẹp mắt.', N'gỗ beech                                          ', N'+ Ghế : Cao 147 dai 320 sâu 120.
+ Bàn: 180 x 90 cao 53
', N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (70, N'Bộ sofa bọc da bò ý 8 món gỗ beech – BBG613HD     ', 1, N'Bộ gồm: 1 bàn, 1 băng dài, 2 ghế đơn, 2 đôn ngồi
Chất liệu: gỗ beech + da bò Italia + dát vàng
Phong cách: tân cổ điển', N'gỗ beach                                          ', NULL, N'Tự nhiên                                          ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (72, N'Than Quang Than                                   ', 3, N'fdsafdsa', N'8999                                              ', N'432', N'rewq                                              ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (73, N'Giường MIDLAND King bed GN702                     ', 9, N'Giường ngủ gỗ óc chó kiểu hiện đại được xem là một trong nhưng xu hương nội thất ngày nay, được rất nhiều giới đại gia tin dùng và sở hữu.', N'gỗ óc chó                                         ', N'Lọt lòng 1m6 x 2m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (74, N'Giường MIDLAND super King gỗ óc chó GN701         ', 9, N'Giường ngủ gỗ óc chó kiểu hiện đại được xem là một trong nhưng xu hương nội thất ngày nay, được rất nhiều giới đại gia tin dùng và sở hữu.', N'gỗ óc chó                                         ', N'Lọt lòng 1m8 x 2m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (75, N'Giường ngủ hiện đại nhung xám 1m8 GN801           ', 9, N'Giường ngủ gỗ óc chó kiểu hiện đại được xem là một trong nhưng xu hương nội thất ngày nay, được rất nhiều giới đại gia tin dùng và sở hữu.', N'gỗ óc chó                                         ', N'Lọt lòng 1m6 x 2m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (76, N'Giường Ngủ Gỗ Sồi Trơn Giá Rẻ                     ', 1, N'Kiểu dáng hiện đại hướng đến sự đơn giản, nhẵn nhụi và trơn láng. Chiếc giường ngủ này sẽ đi kèm cùng với các tông chủ yếu như màu đen góp phần tăng thêm sứt hút cho gian phòng ngủ của bạn.', N'gỗ sồi Nga                                        ', N'1m8x2m', N'màu đen                                           ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (77, N'Tủ quần áo tân cổ điển sang trọng siêu to khổng lồ', 1, N'Tủ quần áo tân cổ điển sang trọng siêu to khổng lồ với kích thước siêu khủng và mang đến vô vàng sự tiện lợi khác cho quý khách hàng', N'gỗ gõ đỏ                                          ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (78, N'Tủ áo hương đá 4 cánh,3 buồng 2,17m               ', 10, N'Điểm nổi bật nhất của tủ quần áo này chính là được thiết kế theo phong cách cổ điển với hình ảnh chạm hoa văn vô cùng đẹp mắt, đường nét uốn lượn tạo cho bộ sản phẩm có độ thẩm mỹ cao cũng như là tạo điểm nhấn cho sản phẩm thêm thu hút.', N'gỗ hương đá                                       ', N'cao 2m17,ngang 2m17 sâu 65cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (79, N'Tủ quần áo thông minh gỗ gõ đỏ 3 buồng 1m75       ', 10, N'Xã hội ngày càng phát triển, song song với đó, nhu cầu mặc đẹp của mọi người cũng ngày càng tăng. Những chiếc tủ quần áo không còn đáp ứng được sự gia tăng nhanh chóng của áo quần của các thành viên trong gia đình. Chính vì vậy, những chiếc giường ngủ, tủ quần áo được thiết kế tích hợp cả phòng thay đồ sẽ trở nên phổ biến trong tương lai.', N'Gỗ gõ đỏ                                          ', N'Dài 1,75x cao 2,1m x sâu 60cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (80, N'Tủ quần áo gỗ sồi 2 cánh LCMTU01                  ', 10, N'Gia công tỉ mỉ, trau chuốt trong ngoài từng chi tiết.', N'Gỗ sồi                                            ', N'2 cánh và 2 hộc', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (81, N'Tủ quần áo gõ đỏ 1m2-TQA20                        ', 10, N'Tủ quần áo là một sản phẩm cần thiết cho phòng ngủ của mỗi người. Ngày nay nó không chỉ đơn thuần sử dụng để đựng quần áo, giúp căn phòng thêm gọn gàng mà nó còn như là một món đồ nội thất trang trí cho căn phòng. Ai cũng muốn căn phòng riêng của mình không chỉ thoải mái mà còn phải trông thật sang trọng, thật nổi bật.', N'Gỗ gõ đỏ                                          ', N'cao 2m13, ngang 1m2 và sâu 60cm.', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (82, N'Tủ đầu giường gõ đỏ 1 cánh TDG10                  ', 11, N'Có thể kể đến tủ quần áo là nơi lữu trữ rộng và tiện lợi cho chúng ta nhất trong phòng ngủ. Bạn có thể đặt các loại quần áo từ hè sang đông, từ chăn ga đến gối đệm mà không lo chúng chiếm diện tích hay mất mỹ quan căn phòng. Thế nhưng tủ đầu giường lại có công năng lưu trữ riêng, tập trung vào các món đồ nhỏ, lặt vặt mang tính cá nhân khác nhau như tiền bạc, thuốc men, mỹ phẩm, bánh kẹo hay đồ lưu niệm. Và tất cả chúng có thể với tới rất dễ dàng khi cần, đúng như tên gọi “tủ đầu giường” của nó.', N'100% gỗ gõ đỏ                                     ', N'ngang 48cm x sâu 38cm x cao 61cm.', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (83, N'Tủ đầu giường hoàng gia cổ điển dát vàng          ', 11, N'Kiểu dáng hiện đại hướng đến sự đơn giản, nhẵn nhụi và trơn láng.', N'KHUNG GỖ KẾT HỢP HDF CẨN NU + HOA VĂN             ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (84, N'Tủ đầu giường Beauty queen                        ', 11, N'Kiểu dáng hiện đại hướng đến sự đơn giản, nhẵn nhụi và trơn láng.', N'gỗ gõ đỏ                                          ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (85, N'Tủ đầu giường cổ điển Royal châu Âu VIP           ', 11, N'Kiểu dáng hiện đại hướng đến sự đơn giản, nhẵn nhụi và trơn láng.', N'gỗ sồi Nga                                        ', N'Ngang 61cm Cao 69cm sâu 47cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (86, N'Tủ đầu giường gỗ sồi 2 hộc – LCMTDG02             ', 11, N'Gia công tỉ mỉ, trau chuốt trong ngoài từng chi tiết.', N'Gỗ sồi                                            ', N'Rộng: 600 Sâu: 400 Cao: 450', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (87, N'Bộ bàn ăn Nature 8 ghế 3 nan bọc nệm bàn 1.8m     ', 13, N'Sản phẩm mang phong cách hiện đại, mộc mạc, tinh tế nên được nhiều gia đình Việt ưa chuộng sử dụng trong nhà. Cùng tìm hiểu một số lý do sản phẩm này trở nên phổ biến.', N'gỗ sồi Nga                                        ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (88, N'Bộ bàn ăn hiện đại Haiti 6 ghế bàn đá             ', 13, N'Sản phẩm mang phong cách hiện đại, mộc mạc, tinh tế nên được nhiều gia đình Việt ưa chuộng sử dụng trong nhà. Cùng tìm hiểu một số lý do sản phẩm này trở nên phổ biến.', N'gỗ Cao Su                                         ', N'rộng 90cm, dài 1m6, cao 78cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (89, N'Bộ bàn ăn hiện đại Neva 6 ghế bàn đá              ', 13, N'Sản phẩm mang phong cách hiện đại, mộc mạc, tinh tế nên được nhiều gia đình Việt ưa chuộng sử dụng trong nhà. Cùng tìm hiểu một số lý do sản phẩm này trở nên phổ biến.', N'gỗ Cao Su                                         ', N'rộng 90cm, dài 1m6, cao 79cm.', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (90, N'Bộ bàn ăn cabin hiện đại 4 ghế bàn vuông          ', 13, N'Sản phẩm mang phong cách hiện đại, mộc mạc, tinh tế nên được nhiều gia đình Việt ưa chuộng sử dụng trong nhà. Cùng tìm hiểu một số lý do sản phẩm này trở nên phổ biến.', N'gỗ Cao Su                                         ', N'Bàn: dài 1m2, rộng 75cm, cao 75cm. Ghế: cao tổng 85cm, ngang 41cm, sâu 42cm,cao từ đất trên mặt ngồi 47cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (91, N'Bàn ăn gỗ sồi chữ nhật Lớn 6 ghế – LCMBBA04       ', 13, N'Sản phẩm mang phong cách hiện đại, mộc mạc, tinh tế nên được nhiều gia đình Việt ưa chuộng sử dụng trong nhà. Cùng tìm hiểu một số lý do sản phẩm này trở nên phổ biến.', N'gỗ sồi Nga                                        ', N'1 Bàn: 1800 x 750 x 760 6 Ghế’ 450 x 600 x 1000', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (92, N'Bàn ăn tròn hoàng gia gõ đỏ Louis Fidia Cẩn veneer', 13, N'Những mẫu bàn ăn hình tròn luôn mang đến sự mềm mại, trang nhã và an toàn. Ngay sau đây, đội ngũ tác giả Sơn Đông xin giới thiệu đến quý vị mẫu bàn ăn tròn hoàng gia gõ đỏ Louis Fidia Cẩn veneer', N'Gỗ gõ đỏ + cẩn veneer                             ', N'đường kính 1m25, dày 15cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (93, N'Bàn ăn hoàng gia Fidia gỗ cẩm lai Việt cẩn nu     ', 13, N'Những siêu phẩm nội thất bàn ăn làm từ gỗ Cẩm Lai chưa bao giờ làm quý khách hàng phải thất vọng. Chúng không chỉ bền bỉ mà còn sở hữu vẻ đẹp vô cùng đẳng cấp.', N'gỗ sồi Nga                                        ', N'1.27m chân trụ tròn – BA401', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (94, N'Bàn ăn cẩm lai tròn trụ lăng 1.4m                 ', 13, N'Gỗ Cẩm Lai vốn là loại gỗ quý hiểm, đắt đỏ và có giá trị kinh tế cao.', N'Gỗ cẩm lai VN                                     ', N'đường kính 1m4 ( mâm xoay 80cm x cao từ đất tới mặt 80cm)', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (95, N'Bàn trang trí | Bàn đại sảnh FIDIA                ', 13, N'Những sản phẩm nội thất được làm từ gỗ gõ đỏ tự nhiên 100% luôn chiếm được cảm tình từ khách hàng nhờ vẻ đẹp hoàn mỹ, đi kèm chất lượng vượt trội.', N'Gỗ gõ đỏ                                          ', N'Cao 81 DK mặt bàn 83 . DK trụ 43cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (96, N'Bàn thờ treo gõ đỏ chạm rồng 1.07m – BTT229       ', 14, N'Bàn thờ treo gõ đỏ chạm rồng là sự lựa chọn tối ưu cho việc thờ cúng trong nhà, có thể dùng thờ Phật, gia tiên, gọn nhẹ, phù hợp cho mọi không gian.', N'gỗ gõ đỏ                                          ', N'ngang 1m07 ; sâu 57cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (97, N'Bàn thờ treo gõ đỏ chạm sen 80cm BTT228 cao cấp   ', 14, N'Bàn thờ treo gõ đỏ chạm rồng là sự lựa chọn tối ưu cho việc thờ cúng trong nhà, có thể dùng thờ Phật, gia tiên, gọn nhẹ, phù hợp cho mọi không gian.', N'gỗ gõ đỏ                                          ', N'Ngang 80cm,sâu 48cm,cao 24cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (98, N'Bàn thờ gỗ hương đá ngũ phúc 1m76 – SD296         ', 14, N'Bàn thờ ngũ phúc được chế tác từ 100% nguyên liệu gỗ hương đá tự nhiên cao cấp, kích thước tủ lớn với chiều ngang dài 1m76.', N'Gỗ hương đá                                       ', N'Ngang 1m76, sâu 82, cao1m27', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (99, N'Bàn thờ tam cấp triện hoa sen 1.97m SD548         ', 14, N'gỗ gõ đỏ', N'gỗ tự nhiên                                       ', N'+ Dài 1,97m + sâu 81cm + Cao tổng 1,78m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (100, N'Bàn thờ gõ đỏ chạm rồng 1.27 SD312                ', 14, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ gõ đỏ                                          ', N'Cao 1.27m x Sâu 81cm x Rộng 1.27m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (101, N'Tủ thờ gỗ cẩm lai cẩn ốc siêu VIP 1,76m SD490     ', 15, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ cẩm lai                                        ', N'Dài 1,76m Cao 1,53m Sâu 81cm', N'gỗ tự nhiên                                       ')
GO
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (102, N'Tủ thờ gỗ cẩm lai cột hoa văn cẩn ốc              ', 15, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'Gỗ cẩm lai xịn                                    ', N'ngang 1m53 ; cao 1m55 ; sâu 75cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (103, N'Tủ thờ cẩm lai công tử Bạc Liêu cẩn ốc đỏ         ', 15, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ cẩm lai                                        ', N'Cao 160 ngang 145 sau 75cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (104, N'Tủ thờ cầm lai 13 ô trám cẩn ốc siêu xịn          ', 15, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ cẩm lai                                        ', N'Cao 1,53m ,rộng 1,53m Sâu 67cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (105, N'Tủ thờ cẩm lai bụng phẳng Nam Bộ                  ', 15, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ cẩm lai nam phi.                               ', N'1m76.', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (106, N'Bộ bàn ghế làm việc khổng minh gỗ gõ đỏ           ', 16, N'Kiểu dáng hiện đại hướng đến sự đơn giản, nhẵn nhụi và trơn láng. Chiếc giường ngủ này sẽ đi kèm cùng với các tông chủ yếu như màu đen góp phần tăng thêm sứt hút cho gian phòng ngủ của bạn.', N'100% gỗ gõ đỏ                                     ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (107, N'Bộ bàn ghế làm việc khổng minh gỗ hương huyết     ', 16, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ sồi Nga                                        ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (108, N'Bàn làm việc gỗ đỏ 1,2m BLV120                    ', 16, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ sồi Nga                                        ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (109, N'Bàn làm việc chạm cổ điển châu Âu                 ', 16, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ sồi Nga                                        ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (110, N'Bàn làm việc gỗ gõ đỏ-BGD06                       ', 16, N'Kiểu dáng hiện đại hướng đến sự đơn giản, nhẵn nhụi và trơn láng. Chiếc giường ngủ này sẽ đi kèm cùng với các tông chủ yếu như màu đen góp phần tăng thêm sứt hút cho gian phòng ngủ của bạn.', N'gỗ sồi Nga                                        ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (111, N'Bàn làm việc cổ điển gỗ gõ đỏ 1,76m               ', 16, N'Kiểu dáng hiện đại hướng đến sự đơn giản, nhẵn nhụi và trơn láng. Chiếc giường ngủ này sẽ đi kèm cùng với các tông chủ yếu như màu đen góp phần tăng thêm sứt hút cho gian phòng ngủ của bạn.', N'gỗ sồi Nga                                        ', N'1m8x2m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (112, N'Ghế Gaming Extreme Zero S                         ', 17, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'Đệm ghế bằng mút xốp Foam nguyên khối bọc da PU   ', N'1m8x2m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (113, N'Ghế Văn Phòng Lưng Lưới Chân Quỳ TM_VP4001        ', 17, N'Đệm ngồi của ghế được làm bằng lưới bọc mút xốp Foam cao cấp tạo cảm giác thoáng mát, cho người ngồi. Lưng ghế bằng lưới cao cấp có độ bền cao mang lại sự đàn hồi tốt trong suốt thời gian sử dụng.', N'asdsadsad                                         ', N'asdadsad', N'adsadsa                                           ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (114, N'Ghế làm việc LUXURY siêu phẩm – GLV201            ', 17, N'Đệm ngồi của ghế được làm bằng lưới bọc mút xốp Foam cao cấp tạo cảm giác thoáng mát, cho người ngồi. Lưng ghế bằng lưới cao cấp có độ bền cao mang lại sự đàn hồi tốt trong suốt thời gian sử dụng.', N'gỗ sồi Nga                                        ', N'1m8x2m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (115, N'Ghế làm việc tựa hoa tây cổ điển, bọc da GGD061   ', 17, N'Đệm ngồi của ghế được làm bằng lưới bọc mút xốp Foam cao cấp tạo cảm giác thoáng mát, cho người ngồi. Lưng ghế bằng lưới cao cấp có độ bền cao mang lại sự đàn hồi tốt trong suốt thời gian sử dụng.', N'gỗ gõ đỏ + bọc da xịn                             ', N'1m8x2m', N'màu đen                                           ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (116, N'Bàn làm việc cổ điển Obama cẩn veneer gỗ gõ đỏ    ', 16, N'Kiểu dáng hiện đại hướng đến sự đơn giản, nhẵn nhụi và trơn láng. Chiếc giường ngủ này sẽ đi kèm cùng với các tông chủ yếu như màu đen góp phần tăng thêm sứt hút cho gian phòng ngủ của bạn.', N'Gỗ gõ đỏ                                          ', N'dài 1m96, rộng 97cm, cao 81cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (117, N'Bàn làm việc cổ điển obama sơn trắng dát vàng     ', 16, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ gõ đỏ                                          ', N'1m8x2m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (118, N'Bàn làm việc cổ điển gỗ gõ đỏ                     ', 16, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ sồi Nga                                        ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (119, N'Bàn làm việc gõ đỏ 1,4m BLV140                    ', 16, N'Kiểu dáng hiện đại hướng đến sự đơn giản, nhẵn nhụi và trơn láng. Chiếc giường ngủ này sẽ đi kèm cùng với các tông chủ yếu như màu đen góp phần tăng thêm sứt hút cho gian phòng ngủ của bạn.', N'gỗ gõ đỏ                                          ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (120, N'Bàn lãnh đạo royal-HRP1890L2Y1 chất lượng         ', 16, N'Kiểu dáng hiện đại hướng đến sự đơn giản, nhẵn nhụi và trơn láng. Chiếc giường ngủ này sẽ đi kèm cùng với các tông chủ yếu như màu đen góp phần tăng thêm sứt hút cho gian phòng ngủ của bạn.', N'gỗ sồi Nga                                        ', N'1m8x2m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (121, N'Yasuo GG                                          ', 1, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'rewq                                              ', N'rewq', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (122, N'San pham moi 55                                   ', 1, N'Phong tục thờ cúng gia tiên vẫn luôn là một nét đẹp văn hóa, tâm linh tín ngưỡng được xem trọng trong mỗi gia đình người Việt.', N'gỗ sồi Nga                                        ', N'1m8x2m', N'gỗ tự nhiên                                       ')
INSERT [dbo].[PRODUCT] ([ID], [NAME], [CATEGORYID], [DESCRIBE], [MATERIAL], [SIZE], [COLOR]) VALUES (123, N'Yasuo Gank team                                   ', 1, N'rew', N'gỗ sồi Nga                                        ', N'cao 2m89 x rộng 3m1 x sâu 64cm', N'gỗ tự nhiên                                       ')
GO
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (0, 2, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (0, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (0, 4, 1, 1, 15000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (0, 67, 1, 1, 939000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (1, 2, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (1, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (1, 4, 1, 1, 15000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (1, 67, 1, 1, 939000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (2, 1, 1, 1, 58000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (2, 4, 1, 1, 15000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (3, 1, 1, 1, 58000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (3, 2, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (3, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (3, 4, 1, 1, 15000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (3, 5, 1, 1, 21000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (3, 7, 1, 1, 109000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (3, 67, 1, 1, 939000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (4, 4, 1, 1, 15000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (4, 67, 1, 1, 939000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (5, 16, 1, 1, 26970000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (5, 71, 1, 1, 332051896)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (6, 6, 1, 3, 16150000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (6, 10, 1, 1, 48500000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (7, 2, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (7, 6, 1, 1, 16150000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (7, 16, 1, 1, 26970000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (8, 11, 1, 1, 85260000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (8, 33, 1, 1, 13440000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (8, 51, 1, 1, 298920000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (8, 57, 1, 1, 20160000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (8, 59, 1, 1, 81600000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (9, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (9, 52, 1, 1, 57000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (10, 6, 1, 1, 16150000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (10, 50, 1, 1, 443520000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (11, 4, 1, 1, 14550000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (12, 51, 1, 1, 298920000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (13, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (13, 51, 1, 1, 298920000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (14, 49, 1, 1, 69580000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (14, 50, 1, 1, 443520000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (15, 60, 1, 1, 21560000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (16, 51, 1, 1, 298920000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (17, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (18, 59, 1, 1, 81600000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (19, 2, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (19, 11, 1, 1, 85260000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (19, 33, 1, 1, 13440000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (19, 51, 1, 1, 298920000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (19, 57, 1, 1, 20160000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (19, 59, 1, 1, 81600000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (20, 11, 1, 1, 85260000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (20, 33, 1, 1, 13440000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (21, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (22, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (22, 40, 1, 1, 19740000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (22, 52, 1, 1, 57000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (23, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (23, 52, 1, 1, 57000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (24, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (24, 40, 1, 1, 19740000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (24, 52, 1, 1, 57000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (24, 60, 1, 1, 21560000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (25, 60, 1, 1, 21560000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (26, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (26, 55, 1, 1, 2325000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (27, 63, 1, 1, 0)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (28, 50, 1, 1, 443520000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (28, 63, 1, 1, 0)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (29, 34, 1, 1, 8930000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (29, 51, 1, 1, 298920000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (30, 34, 1, 1, 8930000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (30, 51, 1, 1, 298920000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (31, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (31, 35, 1, 1, 22785000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (31, 60, 1, 1, 21560000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (32, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (32, 60, 1, 1, 21560000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (33, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (33, 34, 1, 1, 8930000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (33, 35, 1, 1, 22785000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (33, 51, 1, 1, 298920000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (33, 60, 1, 1, 21560000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (34, 51, 1, 1, 298920000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (35, 57, 1, 1, 20160000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (35, 59, 1, 1, 81600000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (36, 2, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (36, 51, 1, 1, 298920000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (36, 57, 1, 1, 20160000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (36, 59, 1, 1, 81600000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (37, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (37, 52, 1, 1, 57000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (37, 60, 1, 1, 21560000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (38, 3, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (38, 52, 1, 1, 57000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (39, 52, 1, 1, 57000000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (40, 60, 1, 1, 21560000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (41, 2, 1, 1, 30400000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (41, 32, 1, 1, 19950000)
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (41, 67, 1, 1, 901440000)
GO
INSERT [dbo].[SUBORDER] ([ORDERID], [PRODUCTID], [OPTIONID], [QUANTITY], [PRICEPERUNIT]) VALUES (42, 2, 1, 1, 30400000)
GO
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (1, N'Thân Quang Phương                                 ', N'phuongpro                ', N'123456              ', N'094233246543   ', N'Hồng Thái Việt Yên Bắc Giang  Nếnh
                                                                ', 0, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (2, N'Chu Thị Tuyết Thanh                               ', N'oanhchu                  ', N'123456              ', N'09077777       ', N'Hà nội việt nam                                                                                     ', 0, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (3, N'admin1                                            ', N'admin1                   ', N'123456              ', NULL, NULL, NULL, 1)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (4, N'admin2                                            ', N'admin2                   ', N'123456              ', NULL, NULL, NULL, 2)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (5, N'test                                              ', N'phuongpro2               ', N'123456              ', NULL, NULL, NULL, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (6, N'phuong                                            ', N'phuongoanh               ', N'123456              ', NULL, NULL, NULL, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (11, N'phuong                                            ', N'phuongceo                ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (12, N'garenaobama                                       ', N'phuongpro123             ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (13, N'garenaobama432                                    ', N'phuongpro43215           ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (14, N'Thân Quang Trung                                  ', N'trungpro                 ', N'123456              ', N'4529876439     ', N'bac giang                                                                                           ', 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (15, N'Nguyễn Mai Anh                                    ', N'maianhht123              ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (16, N'Thân Quang Bình                                   ', N'binhprojj                ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (17, N'Yasuo GG                                          ', N'yasuo123                 ', N'123456              ', N'09786666       ', N'Ilonia                                                                                              ', 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (18, N'Akali CuaKicuc                                    ', N'akali123                 ', N'123456              ', NULL, NULL, 0, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (19, N'Naruto Hokage                                     ', N'naruto123                ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (20, N'Taric Tomoka                                      ', N'Taric123                 ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (21, N'Yone Namikaze                                     ', N'yone123                  ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (22, N'Darius Noburu                                     ', N'darius                   ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (23, N'Kakashi Hakate                                    ', N'kakashi                  ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (24, N'Alista                                            ', N'alista                   ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (25, N'Gnar                                              ', N'gnar123                  ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (26, N'leesin                                            ', N'leesin123                ', N'123456              ', NULL, NULL, 1, 0)
INSERT [dbo].[USER] ([ID], [NAME], [USERNAME], [PASSWORD], [PHONENUMBER], [ADDRESS], [GENDER], [ROLE]) VALUES (27, N'ahri                                              ', N'ahri123                  ', N'123456              ', NULL, NULL, 0, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__USER__B15BE12ED70024AC]    Script Date: 22/03/2023 8:16:21 SA ******/
ALTER TABLE [dbo].[USER] ADD UNIQUE NONCLUSTERED 
(
	[USERNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CART] ADD  DEFAULT (getdate()) FOR [ADDDATE]
GO
ALTER TABLE [dbo].[ORDER] ADD  DEFAULT ((1)) FOR [STATUS]
GO
ALTER TABLE [dbo].[ORDER] ADD  DEFAULT (getdate()) FOR [ORDERDATE]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT (N'Tự nhiên') FOR [COLOR]
GO
ALTER TABLE [dbo].[USER] ADD  DEFAULT ((0)) FOR [ROLE]
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD FOREIGN KEY([USERID])
REFERENCES [dbo].[USER] ([ID])
GO
ALTER TABLE [dbo].[OPTION]  WITH CHECK ADD FOREIGN KEY([PRODUCTID])
REFERENCES [dbo].[PRODUCT] ([ID])
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD FOREIGN KEY([STATUS])
REFERENCES [dbo].[ORDERSTATUS] ([ID])
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD FOREIGN KEY([USERID])
REFERENCES [dbo].[USER] ([ID])
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([CATEGORYID])
REFERENCES [dbo].[CATEGORY] ([ID])
GO
ALTER TABLE [dbo].[SUBORDER]  WITH CHECK ADD FOREIGN KEY([ORDERID])
REFERENCES [dbo].[ORDER] ([ID])
GO
