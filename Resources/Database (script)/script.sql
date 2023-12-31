USE [Decorations]
GO
/****** Object:  Table [dbo].[PickUpPoint]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoint](
	[PickUpPointID] [int] IDENTITY(1,1) NOT NULL,
	[PickUpPointAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_PickUpPoints] PRIMARY KEY CLUSTERED 
(
	[PickUpPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPickUpPoints]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewPickUpPoints]
AS
SELECT        PickUpPointID, PickUpPointAddress AS [Пункт выдачи]
FROM            dbo.PickUpPoint
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductUnitOfMeasurement] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 2) NOT NULL,
	[ProductMaxDiscountAmount] [int] NOT NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductSupplier] [nvarchar](255) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductDiscountAmount] [tinyint] NOT NULL,
	[ProductQuantityInStock] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](255) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewCountArticles]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewCountArticles]
AS
SELECT        ProductArticleNumber AS Артикул, ProductQuantityInStock AS [На складе]
FROM            dbo.Product
GO
/****** Object:  Table [dbo].[Order]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NULL,
	[OrderDeliveryDate] [date] NULL,
	[OrderPickupPoint] [int] NULL,
	[OrderClient] [int] NULL,
	[OrderCode] [int] NULL,
	[OrderStatus] [nvarchar](30) NULL,
	[OrderCost] [decimal](19, 2) NULL,
	[OrderDiscountAmount] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewOrder]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewOrder]
AS
SELECT        OrderID, OrderDate AS [Дата заказа], OrderDeliveryDate AS [Дата доставки], OrderPickupPoint AS [Пункт выдачи], OrderClient AS Клиент, OrderCode AS [Код заказа], OrderStatus AS [Статус заказа], 
                         OrderCost AS Стоимость, OrderDiscountAmount AS [Сумма скидки]
FROM            dbo.[Order]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[OrderQuantity] [int] NULL,
 CONSTRAINT [PK_OrderProduct_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewOrderProduct]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewOrderProduct]
AS
SELECT        OrderID, ProductArticleNumber AS Артикул, OrderQuantity AS [Кол-во на складе]
FROM            dbo.OrderProduct
GO
/****** Object:  Table [dbo].[User]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](255) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[UserPatronymic] [nvarchar](255) NOT NULL,
	[UserLogin] [nvarchar](255) NOT NULL,
	[UserPassword] [nvarchar](255) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewOrderMA]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewOrderMA]
AS
SELECT        dbo.[Order].OrderCode AS [Номер заказа], dbo.OrderProduct.ProductArticleNumber AS Артикул, dbo.Product.ProductName AS Наименование, dbo.Product.ProductManufacturer AS Производитель, 
                         dbo.Product.ProductCategory AS Категория, dbo.OrderProduct.OrderQuantity AS Количество, dbo.Product.ProductQuantityInStock AS [Остаток на складе], dbo.[Order].OrderDate AS [Дата заказа], 
                         dbo.[Order].OrderDeliveryDate AS [Дата доставки], dbo.[Order].OrderCost AS [Общая стоимость заказа], dbo.[Order].OrderDiscountAmount AS [Общая сумма скидки], dbo.[Order].OrderStatus AS [Статус заказа], 
                         dbo.[User].UserSurname AS Фамилия, dbo.[User].UserName AS Имя, dbo.[User].UserPatronymic AS Отчество
FROM            dbo.Product INNER JOIN
                         dbo.OrderProduct ON dbo.Product.ProductArticleNumber = dbo.OrderProduct.ProductArticleNumber RIGHT OUTER JOIN
                         dbo.[Order] ON dbo.OrderProduct.OrderID = dbo.[Order].OrderID LEFT OUTER JOIN
                         dbo.[User] ON dbo.[Order].OrderClient = dbo.[User].UserID
GO
/****** Object:  View [dbo].[ViewProducts]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewProducts]
AS
SELECT        ProductArticleNumber AS Артикул, ProductName AS Наименование, ProductUnitOfMeasurement AS [Ед. измерения], ProductCost AS Стоимость, ProductMaxDiscountAmount AS [Размер макс. скидки], 
                         ProductManufacturer AS Производитель, ProductSupplier AS Поставщик, ProductCategory AS Категория, ProductDiscountAmount AS [Действ. скидка], ProductQuantityInStock AS [Кол-во на складе], 
                         ProductDescription AS Описание, CAST(ProductCost - ProductCost / 100 * ProductDiscountAmount AS DECIMAL(19, 2)) AS [Цена со скидкой]
FROM            dbo.Product
GO
/****** Object:  Table [dbo].[Role]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (1, CAST(N'2022-05-01' AS Date), CAST(N'2022-05-09' AS Date), 2, 51, 111, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (2, CAST(N'2022-05-02' AS Date), CAST(N'2022-05-13' AS Date), 8, NULL, 112, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (3, CAST(N'2022-05-03' AS Date), CAST(N'2022-05-12' AS Date), 10, NULL, 113, N'Завершен', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (4, CAST(N'2022-05-04' AS Date), CAST(N'2022-05-09' AS Date), 12, NULL, 114, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (5, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-09' AS Date), 15, NULL, 115, N'Завершен', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (6, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-09' AS Date), 18, 52, 116, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (7, CAST(N'2022-05-07' AS Date), CAST(N'2022-05-09' AS Date), 20, NULL, 117, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (8, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-09' AS Date), 25, NULL, 118, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (9, CAST(N'2022-05-09' AS Date), CAST(N'2022-05-09' AS Date), 30, NULL, 119, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (10, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-09' AS Date), 36, 53, 120, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (11, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 121, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (12, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 122, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (13, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 2, 1, 123, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (14, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 2, 1, 124, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (15, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 125, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (16, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 126, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (17, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 1, 1, 127, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (18, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 1, 1, 128, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (19, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 2, 1, 129, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (20, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 2, 1, 130, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (21, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 6, 1, 131, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (22, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 7, 1, 132, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (23, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 27, 1, 133, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (24, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 6, 1, 134, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (25, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 135, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (26, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 136, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (27, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 137, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (28, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 138, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (29, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 139, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (30, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 140, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (31, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 1, 1, 141, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (32, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 1, 1, 142, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (33, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 3, NULL, 143, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (34, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 144, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (35, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 145, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (36, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 146, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (37, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 1, 1, 147, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (38, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 1, 1, 148, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (39, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 3, 1, 149, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (40, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 33, 1, 150, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (41, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 3, 1, 151, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (42, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 2, 1, 152, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (43, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 3, 1, 153, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (44, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 17, 1, 154, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (45, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 3, 1, 155, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (46, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 6, 1, 156, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (47, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 2, 1, 157, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (48, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 158, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (49, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 159, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (50, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 160, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (51, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 7, 1, 161, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (52, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 9, 1, 162, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (53, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 163, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (54, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 164, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (55, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 10, 1, 165, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (56, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 2, 1, 166, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (57, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 167, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (58, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 9, 1, 168, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (59, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 3, 1, 169, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (60, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 1, 1, 170, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (61, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 8, 1, 171, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (62, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 13, 1, 172, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (63, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 173, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (64, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 174, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (65, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 6, 1, 175, N'Новый', NULL, NULL)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (66, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 176, N'Новый', CAST(1558.20 AS Decimal(19, 2)), 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (67, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 3, 1, 177, N'Новый', CAST(2537.22 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (68, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 3, 1, 178, N'Новый', CAST(2537.22 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (69, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 7, 1, 179, N'Новый', CAST(2146.20 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (70, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 7, 1, 180, N'Новый', CAST(2146.20 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (71, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 181, N'Новый', CAST(480.00 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (72, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 3, 1, 182, N'Завершен', CAST(480.00 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (73, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 23, 1, 183, N'Новый', CAST(1344.00 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (74, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 184, N'Новый', CAST(676.20 AS Decimal(19, 2)), 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (75, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 185, N'Новый', CAST(245.00 AS Decimal(19, 2)), 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (76, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 8, 1, 186, N'Новый', CAST(1558.20 AS Decimal(19, 2)), 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (77, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 187, N'Новый', CAST(588.00 AS Decimal(19, 2)), 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (78, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 8, 1, 188, N'Новый', CAST(588.00 AS Decimal(19, 2)), 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (79, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 189, N'Новый', CAST(1344.00 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (80, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 14, 1, 190, N'Новый', CAST(1344.00 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (81, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 6, 1, 191, N'Новый', CAST(1558.20 AS Decimal(19, 2)), 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (82, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 6, 1, 192, N'Завершен', CAST(1736.30 AS Decimal(19, 2)), 3)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (83, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 8, 1, 193, N'Новый', CAST(344.64 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (84, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 8, 1, 194, N'Новый', CAST(344.64 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (85, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, NULL, 195, N'Новый', CAST(970.00 AS Decimal(19, 2)), 3)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (86, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 196, N'Новый', CAST(480.00 AS Decimal(19, 2)), 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (87, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 5, 1, 197, N'Новый', CAST(1764.00 AS Decimal(19, 2)), 6)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (88, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 198, N'Новый', CAST(2520.00 AS Decimal(19, 2)), 8)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (89, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 4, 1, 199, N'Новый', CAST(17363.00 AS Decimal(19, 2)), 30)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDeliveryDate], [OrderPickupPoint], [OrderClient], [OrderCode], [OrderStatus], [OrderCost], [OrderDiscountAmount]) VALUES (90, CAST(N'2023-12-08' AS Date), CAST(N'2022-05-09' AS Date), 10, NULL, 200, N'Новый', CAST(1736.30 AS Decimal(19, 2)), 3)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (1, N'F933T5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (1, N'K478R4', 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (2, N'D034T5', 6)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (2, N'S563T4', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (3, N'D826T5', 11)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (3, N'K083T5', 11)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (4, N'B037T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (4, N'D832R2', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (5, N'D044T5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (5, N'R922T5', 7)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (6, N'F933T5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (6, N'V783T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (7, N'H937R3', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (8, N'F903T5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (8, N'F937R4', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (9, N'D826T5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (9, N'R836R5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (10, N'D044T5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (10, N'D832R2', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (15, N'D044T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (17, N'K478R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (19, N'D832R2', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (22, N'D832R2', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (23, N'S937T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (24, N'D826T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (25, N'D044T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (27, N'D044T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (29, N'D832R2', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (30, N'D034T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (31, N'D826T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (32, N'D832R2', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (33, N'D826T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (34, N'D034T5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (35, N'D034T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (36, N'D044T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (37, N'D826T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (38, N'D826T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (39, N'B037T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (40, N'D034T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (41, N'D044T5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (42, N'D044T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (43, N'F903T5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (44, N'D044T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (45, N'D044T5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (46, N'D044T5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (47, N'D947R5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (48, N'D947R5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (49, N'F903T5', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (50, N'F933T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (51, N'D044T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (52, N'F837T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (53, N'F837T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (54, N'F903T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (55, N'F903T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (56, N'K937T4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (57, N'F903T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (58, N'K937T4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (59, N'F903T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (60, N'F837T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (61, N'F837T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (62, N'F903T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (63, N'F933T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (64, N'F903T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (65, N'D832R2', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (66, N'F928T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (67, N'F837T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (68, N'F928T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (69, N'F903T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (70, N'F928T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (71, N'D947R5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (72, N'D947R5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (73, N'F933T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (74, N'R922T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (76, N'F928T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (77, N'F903T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (78, N'F903T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (79, N'F933T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (80, N'F933T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (81, N'F928T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (82, N'D044T5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (83, N'F937R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (84, N'F937R4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (85, N'D832R2', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (86, N'D947R5', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (87, N'F903T5', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (88, N'F903T5', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (89, N'D044T5', 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [OrderQuantity]) VALUES (90, N'D044T5', 1)
GO
SET IDENTITY_INSERT [dbo].[PickUpPoint] ON 

INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (1, N'344288, г. Ковров, ул. Чехова, 1')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (2, N'614164, г.Ковров,  ул. Степная, 30')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (3, N'394242, г. Ковров, ул. Коммунистическая, 43')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (4, N'660540, г. Ковров, ул. Солнечная, 25')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (5, N'125837, г. Ковров, ул. Шоссейная, 40')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (6, N'125703, г. Ковров, ул. Партизанская, 49')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (7, N'625283, г. Ковров, ул. Победы, 46')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (8, N'614611, г. Ковров, ул. Молодежная, 50')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (9, N'454311, г.Ковров, ул. Новая, 19')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (10, N'660007, г.Ковров, ул. Октябрьская, 19')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (11, N'603036, г. Ковров, ул. Садовая, 4')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (12, N'450983, г.Ковров, ул. Комсомольская, 26')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (13, N'394782, г. Ковров, ул. Чехова, 3')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (14, N'603002, г. Ковров, ул. Дзержинского, 28')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (15, N'450558, г. Ковров, ул. Набережная, 30')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (16, N'394060, г.Ковров, ул. Фрунзе, 43')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (17, N'410661, г. Ковров, ул. Школьная, 50')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (18, N'625590, г. Ковров, ул. Коммунистическая, 20')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (19, N'625683, г. Ковров, ул. 8 Марта')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (20, N'400562, г. Ковров, ул. Зеленая, 32')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (21, N'614510, г. Ковров, ул. Маяковского, 47')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (22, N'410542, г. Ковров, ул. Светлая, 46')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (23, N'620839, г. Ковров, ул. Цветочная, 8')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (24, N'443890, г. Ковров, ул. Коммунистическая, 1')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (25, N'603379, г. Ковров, ул. Спортивная, 46')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (26, N'603721, г. Ковров, ул. Гоголя, 41')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (27, N'410172, г. Ковров, ул. Северная, 13')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (28, N'420151, г. Ковров, ул. Вишневая, 32')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (29, N'125061, г. Ковров, ул. Подгорная, 8')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (30, N'630370, г. Ковров, ул. Шоссейная, 24')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (31, N'614753, г. Ковров, ул. Полевая, 35')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (32, N'426030, г. Ковров, ул. Маяковского, 44')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (33, N'450375, г. Ковров ул. Клубная, 44')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (34, N'625560, г. Ковров, ул. Некрасова, 12')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (35, N'630201, г. Ковров, ул. Комсомольская, 17')
INSERT [dbo].[PickUpPoint] ([PickUpPointID], [PickUpPointAddress]) VALUES (36, N'190949, г. Ковров, ул. Мичурина, 26')
SET IDENTITY_INSERT [dbo].[PickUpPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B025Y1', N'Блюдо', N'шт.', CAST(1890.00 AS Decimal(19, 2)), 5, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 3, N'4', N'Блюдо декоративное flower 35 см Home Philosophy', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B025Y3', N'Блюдо', N'шт.', CAST(1890.00 AS Decimal(19, 2)), 5, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 19, N'3', N'Блюдо декоративное flower 35 см Home Philosophy', N'D034T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B025Y6', N'Блюдо', N'шт.', CAST(2000.00 AS Decimal(19, 2)), 10, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 8, N'8', N'Блюдо декоративное flower 35 см Home Philosophy', N'D034T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'B037T5', N'Блюдо', N'шт.', CAST(690.00 AS Decimal(19, 2)), 5, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 2, N'18', N'Блюдо декоративное Flower 35 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'BO25Y5', N'Блюдок', N'шт.', CAST(2000.00 AS Decimal(19, 2)), 17, N'Home Philipsy', N'Стокманн', N'Интерьер', 15, N'22', N'Блюдо', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'BO2Y57', N'Блюдо', N'шт.', CAST(4000.00 AS Decimal(19, 2)), 9, N'Gallery', N'Стокманн', N'Интерьерная посуда', 13, N'8', N'Пусто', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D034T5', N'Диффузор', N'шт.', CAST(800.00 AS Decimal(19, 2)), 20, N'Miksdo', N'Hoff', N'Ароматы для дома', 2, N'8', N'Диффузор Mikado intense Апельсин с корицей', N'D034T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D044T5', N'Декор настенный', N'шт.', CAST(1790.00 AS Decimal(19, 2)), 5, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 3, N'29', N'Декор настенный Фантазия 45х45х1 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D826T5', N'Диффузор', N'шт.', CAST(600.00 AS Decimal(19, 2)), 5, N'True Scents', N'Hoff', N'Ароматы для дома', 2, N'0', N'Диффузор True Scents 45 мл манго', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D832R2', N'Растение', N'шт.', CAST(1000.00 AS Decimal(19, 2)), 10, N'Home Philosophy', N'Стокманн', N'Интерьерные аксессуары', 3, N'3', N'Декоративное растение 102 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'D947R5', N'Диффузор', N'шт.', CAST(500.00 AS Decimal(19, 2)), 5, N'Aroma', N'Hoff', N'Ароматы для дома', 4, N'6', N'Диффузор Aroma Harmony Lavender', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F837T5', N'Фоторамка', N'шт.', CAST(999.00 AS Decimal(19, 2)), 5, N'Gallery', N'Hoff', N'Картины и фоторамки', 2, N'9', N'Шкатулка для украшений из дерева Stowit', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F903T5', N'Фоторамка', N'шт.', CAST(600.00 AS Decimal(19, 2)), 15, N'Gallery', N'Hoff', N'Картины и фоторамки', 2, N'14', N'Фоторамка Gallery 20х30 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F928T5', N'Фоторамка', N'шт.', CAST(1590.00 AS Decimal(19, 2)), 25, N'Umbra', N'Стокманн', N'Картины и фоторамки', 2, N'33', N'Фоторамка Prisma 10х10 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F933T5', N'Кашпо', N'шт.', CAST(1400.00 AS Decimal(19, 2)), 20, N'Cube Color', N'Hoff', N'Горшки и подставки', 4, N'17', N'Настольное кашпо с автополивом Cube Color', N'F933T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'F937R4', N'Фоторамка', N'шт.', CAST(359.00 AS Decimal(19, 2)), 15, N'Gallery', N'Hoff', N'Картины и фоторамки', 4, N'15', N'Фоторамка 10х15 см Gallery серый с патиной/золотой', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H023R8', N'Часы', N'шт.', CAST(5600.00 AS Decimal(19, 2)), 15, N'Umbra', N'Стокманн', N'Часы', 2, N'8', N'Часы настенные Ribbon 30,5 см', N'H023R8.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'H937R3', N'Часы', N'шт.', CAST(999.00 AS Decimal(19, 2)), 10, N'Umbra', N'Hoff', N'Часы', 3, N'8', N'Часы настенные 6500 30,2 см', N'H937R3.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K083T5', N'Аромат', N'шт.', CAST(2790.00 AS Decimal(19, 2)), 20, N'Esteban', N'Стокманн', N'Ароматы для дома', 2, N'6', N'Сменный аромат Figue noire 250 мл', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K478R4', N'Аромат', N'шт.', CAST(3500.00 AS Decimal(19, 2)), 30, N'Esteban', N'Стокманн', N'Ароматы для дома', 4, N'7', N'Аромат для декобукета Esteban', N'K478R4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'K937T4', N'Аромат', N'шт.', CAST(7900.00 AS Decimal(19, 2)), 25, N'Esteban', N'Стокманн', N'Ароматы для дома', 2, N'12', N'Деко-букет Кедр 250 мл', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'P846R4', N'Подставка', N'шт.', CAST(1400.00 AS Decimal(19, 2)), 15, N'Valley', N'Стокманн', N'Горшки и подставки', 3, N'12', N'Подставка для цветочных горшков 55x25x35 см Valley', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'P927R1', N'Подсветка', N'шт.', CAST(3000.00 AS Decimal(19, 2)), 18, N'True Scene', N'Стокманн', N'Свечи', 15, N'5', N'Свеча', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'P927R2', N'Подставка', N'шт.', CAST(4000.00 AS Decimal(19, 2)), 15, N'Valley', N'Стокманн', N'Горшки и подставки', 2, N'3', N'Подставка для цветочных горшков Valley', N'P927R2.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'P936E4', N'Подставка', N'шт.', CAST(3590.00 AS Decimal(19, 2)), 15, N'Umbra', N'Стокманн', N'Горшки и подставки', 4, N'9', N'Подставка для газет и журналов Zina', N'P936E4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'R836R5', N'Шкатулка', N'шт.', CAST(8000.00 AS Decimal(19, 2)), 30, N'Umbra', N'Стокманн', N'Шкатулки и подставки', 5, N'11', N'Шкатулка для украшений из дерева Stowit', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'R922T5', N'Шкатулка', N'шт.', CAST(690.00 AS Decimal(19, 2)), 10, N'Home Philosophy', N'Стокманн', N'Шкатулки и подставки', 2, N'14', N'Шкатулка из керамики Lana 6х7 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S563T4', N'Свеча', N'шт.', CAST(1000.00 AS Decimal(19, 2)), 20, N'True Scents', N'Hoff', N'Свечи', 3, N'12', N'Свеча в стакане True Scents', N'S563T4.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S936Y5', N'Свеча', N'шт.', CAST(299.00 AS Decimal(19, 2)), 15, N'True Scents', N'Hoff', N'Ароматы для дома', 3, N'66', N'Свеча в стакане True Scents', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'S937T5', N'Подсвечник', N'шт.', CAST(2600.00 AS Decimal(19, 2)), 10, N'Kersten', N'Стокманн', N'Ароматы для дома', 3, N'19', N'Подсвечник 37 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V432R6', N'Ваза', N'шт.', CAST(1990.00 AS Decimal(19, 2)), 10, N'Kersten', N'Стокманн', N'Вазы', 3, N'30', N'Ваза из фаянса 28,00 x 9,50 x 9,50 см', NULL)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V483R7', N'Ваза', N'шт.', CAST(100.00 AS Decimal(19, 2)), 15, N'Весна', N'Hoff', N'Вазы', 3, N'43', N'Ваза «Весна» 18 см стекло, цвет прозрачный', N'V483R7.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V783T5', N'Ваза', N'шт.', CAST(1300.00 AS Decimal(19, 2)), 25, N'Home Philosophy', N'Стокманн', N'Вазы', 2, N'13', N'Ваза из керамики Betty', N'V783T5.jpg')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V937E3', N'Диффузор', N'шт.', CAST(1000.00 AS Decimal(19, 2)), 10, N'Aroma', N'Hoff', N'Ароматы', 5, N'10', N'Декоратив', N'傉䝎਍ਚ ഀ䡉剄 送 Ⰱ؈ Â 朄䵁A넀ஏ懼 挠剈M稀&耀切 耀è甀0`㨀ᜀ鱰冺< 瀉奈s฀¼฀Ƽ법䥲 ㈢䑉呁幸鷭됇啭蕹閟ࠪਪ⡘舢ꢢ捑訋豢譢塭▆ể�潢Ձ嘛褐⤁ሂᔔ࢐⠪䑖ၔ豑쐅쐮첒有嶞⻎㟟㟆篎뻷癷ﭛ箟�㓖헄带幝㓙麞疧祍륭岎湏㜠힔ᮑ䷊෥曤蛲䛲獲薹勜壞䓞瓞团뜓�淈漋뜮랓뢘蔎主햼랔�쩩곛��革曚ꥱ뱭펒旭닚앭팗派滙�楳훙턓䣻텋電뻍潦ㄶꇻ䧷﷫竓赟矞�ｺ绶뵮寏￯ή퍶꺉긍협拵覣ᾮ⎮➮絶﫩흢꺕긷휻鐺韚�鸶⋶뾧뱪雒军咯䡯퀷쥻쮿豈礡ﲰ祏㲨Ṝ輩ᾖ잗俉俊쿉鏈')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductUnitOfMeasurement], [ProductCost], [ProductMaxDiscountAmount], [ProductManufacturer], [ProductSupplier], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (N'V937E4', N'Ваза', N'шт.', CAST(1999.00 AS Decimal(19, 2)), 15, N'Kersten', N'Hoff', N'Вазы', 3, N'21', N'Ваза 18H2535S 30,5 см', NULL)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Гость')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Алексеев', N'Владислав', N'Аркадьевич', N'loginDEbct2018', N'Qg3gff', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Савельева', N'Евфросиния', N'Арсеньевна', N'loginDEvtg2018', N'ETMNzL', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Никонов', N'Мэлс', N'Лукьевич', N'loginDEuro2018', N'a1MIcO', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Горшкова', N'Агафья', N'Онисимовна', N'loginDEpst2018', N'0CyGnX', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Горбачёв', N'Пантелеймон', N'Германович', N'loginDEpsu2018', N'Vx9cQ{', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Ершова', N'Иванна', N'Максимовна', N'loginDEzqs2018', N'qM9p7i', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Туров', N'Денис', N'Геласьевич', N'loginDEioe2018', N'yMPu&2', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Носова', N'Наина', N'Эдуардовна', N'loginDEcmk2018', N'3f+b0+', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Куликов', N'Андрей', N'Святославович', N'loginDEfsp2018', N'&dtlI+', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Нестеров', N'Агафон', N'Георгьевич', N'loginDExcd2018', N'SZXZNL', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Козлов', N'Геласий', N'Христофорович', N'loginDEvlf2018', N'O5mXc2', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Борисова', N'Анжелика', N'Анатольевна', N'loginDEanv2018', N'Xiq}M3', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Суханов', N'Станислав', N'Фролович', N'loginDEzde2018', N'tlO3x&', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Тетерина', N'Феврония', N'Эдуардовна', N'loginDEriv2018', N'GJ2mHL', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Муравьёва', N'Александра', N'Ростиславовна', N'loginDEhcp2018', N'n2nfRl', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Новикова', N'Лукия', N'Ярославовна', N'loginDEwjv2018', N'ZfseKA', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Агафонова', N'Лариса', N'Михаиловна', N'loginDEiry2018', N'5zu7+}', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Сергеева', N'Агата', N'Юрьевна', N'loginDEgbr2018', N'}+Ex1*', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Колобова', N'Елена', N'Евгеньевна', N'loginDExxv2018', N'+daE|T', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Ситников', N'Николай', N'Филатович', N'loginDEbto2018', N'b1iYMI', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Белов', N'Роман', N'Иринеевич', N'loginDEfbs2018', N'v90Rep', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Волкова', N'Алла', N'Лукьевна', N'loginDEple2018', N'WlW+l8', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Кудрявцева', N'Таисия', N'Игоревна', N'loginDEhhx2018', N'hmCHeQ', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Семёнова', N'Октябрина', N'Христофоровна', N'loginDEayn2018', N'Ka2Fok', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Смирнов', N'Сергей', N'Яковович', N'loginDEwld2018', N'y9HStF', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Брагина', N'Алина', N'Валерьевна', N'loginDEhuu2018', N'X31OEf', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Евсеев', N'Игорь', N'Донатович', N'loginDEmjb2018', N'5mm{ch', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Суворов', N'Илья', N'Евсеевич', N'loginDEdgp2018', N'1WfJjo', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Котов', N'Денис', N'Мартынович', N'loginDEgyi2018', N'|7nYPc', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Бобылёва', N'Юлия', N'Егоровна', N'loginDEmvn2018', N'Mrr9e0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Брагин', N'Бронислав', N'Георгьевич', N'loginDEfoj2018', N'nhGc+D', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Александров', N'Владимир', N'Дамирович', N'loginDEuuo2018', N'42XmH1', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Фокин', N'Ириней', N'Ростиславович', N'loginDEhsj2018', N's+jrMW', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Воронов', N'Митрофан', N'Антонович', N'loginDEvht2018', N'zMyS8Z', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Маслов', N'Мстислав', N'Антонинович', N'loginDEeqo2018', N'l5CBqA', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Щербаков', N'Георгий', N'Богданович', N'loginDExrf2018', N'mhpRIT', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Кириллова', N'Эмилия', N'Федосеевна', N'loginDEfku2018', N'a1m+8c', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Васильев', N'Серапион', N'Макарович', N'loginDExix2018', N'hzxtnn', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Галкина', N'Олимпиада', N'Владленовна', N'loginDEqrf2018', N'mI8n58', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Яковлева', N'Ксения', N'Онисимовна', N'loginDEhlk2018', N'g0jSed', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Калашникова', N'Александра', N'Владимировна', N'loginDEwoe2018', N'yOtw2F', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Медведьева', N'Таисия', N'Тихоновна', N'loginDExyu2018', N'7Fg}9p', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Карпова', N'Ольга', N'Лукьевна', N'loginDEcor2018', N'2cIrC8', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Герасимов', N'Мстислав', N'Дамирович', N'loginDEqon2018', N'YeFbh6', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Тимофеева', N'Ксения', N'Валерьевна', N'loginDEyfd2018', N'8aKdb0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Горбунов', N'Вячеслав', N'Станиславович', N'loginDEtto2018', N'qXYDuu', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Кошелева', N'Кира', N'Владиславовна', N'loginDEdal2018', N'cJWXL0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Панфилова', N'Марина', N'Борисовна', N'loginDEbjs2018', N'Xap2ct', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Кудрявцев', N'Матвей', N'Игоревич', N'loginDEdof2018', N'kD|LRU', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Зуев', N'Эдуард', N'Пантелеймонович', N'loginDEsnh2018', N'qwerty0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (51, N'Архипова', N'Оливия', N'Дмитриевна', N'loginDEeee2018', N'qwerty1', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (52, N'Никонова', N'Татьяна', N'Захаровна', N'loginDEeer2018', N'qwerty2', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (53, N'Рябова', N'Диана', N'Павловна', N'loginDEeet2018', N'qwerty3', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PickUpPoints] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickUpPoint] ([PickUpPointID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Orders_PickUpPoints]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([OrderClient])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
/****** Object:  StoredProcedure [dbo].[CheckCredentials]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckCredentials]
	
	@login NVARCHAR(255),
	@password NVARCHAR(255)

AS
BEGIN
	SELECT * 
	FROM dbo.[User]
	WHERE UserLogin = @login AND UserPassword = @password
END
GO
/****** Object:  StoredProcedure [dbo].[DelProduct]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DelProduct]

@ProductArticleNumber nvarchar(100)

AS
BEGIN
	DELETE 
	FROM dbo.ViewOrderProduct
	WHERE Артикул = @ProductArticleNumber
	DELETE 
	FROM dbo.ViewProducts
	WHERE Артикул = @ProductArticleNumber 
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllDiscounts]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAllDiscounts] 
AS
BEGIN
	SELECT *
	FROM dbo.ViewProducts
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrders]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetAllOrders]
AS
BEGIN
	
	SELECT *
	FROM dbo.ViewOrderMA

END
GO
/****** Object:  StoredProcedure [dbo].[GetCountArticles]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCountArticles]

@countArticles int,
@productArticleNumber nvarchar(100) 

AS
BEGIN
	UPDATE dbo.ViewCountArticles
	SET [На складе] = 
	CASE 
		WHEN [На складе] > 0 THEN [На складе] - @countArticles 
		ELSE [На складе]
	END 
	WHERE [Артикул] = @productArticleNumber
END
GO
/****** Object:  StoredProcedure [dbo].[GetDiscountBeforeFourteen]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetDiscountBeforeFourteen]
AS
BEGIN
	SELECT *
	FROM dbo.ViewProducts
	WHERE [Действ. скидка] BETWEEN 10 and 14
END
GO
/****** Object:  StoredProcedure [dbo].[GetDiscountBeforeNine]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetDiscountBeforeNine]
AS
BEGIN
	SELECT *
	FROM dbo.ViewProducts
	WHERE [Действ. скидка] BETWEEN 0 and 9
END
GO
/****** Object:  StoredProcedure [dbo].[GetDiscountMoreFifteen]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetDiscountMoreFifteen]
AS
BEGIN
	SELECT *
	FROM dbo.ViewProducts
	WHERE [Действ. скидка] >= 15
END
GO
/****** Object:  StoredProcedure [dbo].[GetMaxOrderCode]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetMaxOrderCode]

AS
BEGIN
	
	SELECT MAX([Код заказа])
	FROM dbo.ViewOrder

END
GO
/****** Object:  StoredProcedure [dbo].[GetOrdersBeforeFourteen]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetOrdersBeforeFourteen]
AS
BEGIN
	SELECT *
	FROM dbo.ViewOrderMA
	WHERE [Общая сумма скидки] BETWEEN 11 and 14
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrdersBeforeTen]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetOrdersBeforeTen]
AS
BEGIN
	SELECT *
	FROM dbo.ViewOrderMA
	WHERE [Общая сумма скидки] BETWEEN 0 and 10
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrdersMoreFifteen]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetOrdersMoreFifteen]
AS
BEGIN
	SELECT *
	FROM dbo.ViewOrderMA
	WHERE [Общая сумма скидки] >= 15
END
GO
/****** Object:  StoredProcedure [dbo].[GetPickUpPoints]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetPickUpPoints]
AS
BEGIN
	SELECT *
	FROM dbo.ViewPickUpPoints
END
GO
/****** Object:  StoredProcedure [dbo].[GetQuantityInStock]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetQuantityInStock]

	@ProductArticleNumber nvarchar(100)

AS
BEGIN
	
	SELECT Артикул
	FROM dbo.ViewCountArticles
	WHERE Артикул = @ProductArticleNumber
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertOrder]

	@OrderDate date,
	@OrderDeliveryDate date,
	@OrderPickupPoint int,
	@OrderClient int,
	@OrderCost decimal(19, 2),
	@OrderDiscountAmount int

AS
BEGIN

	INSERT INTO dbo.ViewOrder ([Дата заказа], [Дата доставки], [Пункт выдачи], Клиент, [Код заказа],  [Статус заказа], Стоимость, [Сумма скидки]) 
	OUTPUT INSERTED.OrderID
	VALUES (@OrderDate, @OrderDeliveryDate, @OrderPickupPoint, @OrderClient, (SELECT MAX([Код заказа]) + 1 FROM dbo.ViewOrder), 'Новый', @OrderCost, @OrderDiscountAmount)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrderProduct]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertOrderProduct]

	@OrderID int,
	@ProductArticleNumber nvarchar(100),
	@OrderQuantity int

AS
BEGIN

	INSERT INTO dbo.ViewOrderProduct (OrderID, Артикул, [Кол-во на складе])
	VALUES (@OrderID, @ProductArticleNumber, @OrderQuantity)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertPhoto]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertPhoto]

	@ProductPhoto nvarchar(255),
	@ProductArticleNumber nvarchar(100)

AS
BEGIN
	
	UPDATE dbo.Product
	SET ProductPhoto = @ProductPhoto
	WHERE ProductArticleNumber = @ProductArticleNumber
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProduct]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertProduct]

	@ProductArticleNumber nvarchar(100),
	@ProductName nvarchar(max),
	@ProductUnitOfMeasurement nvarchar(max),
	@ProductCost decimal(19, 2),
	@ProductMaxDiscountAmount int,
	@ProductManufacturer nvarchar(max),
	@ProductSupplier nvarchar(255),
	@ProductCategory nvarchar(max),
	@ProductDiscountAmount tinyint,
	@ProductQuantityInStock nvarchar(max),
	@ProductDescription nvarchar(max)

AS
BEGIN

	INSERT INTO dbo.ViewProducts (Артикул, Наименование, [Ед. измерения], Стоимость, [Размер макс. скидки], Производитель, Поставщик, Категория, [Действ. скидка], [Кол-во на складе], Описание)
	VALUES (@ProductArticleNumber, @ProductName, @ProductUnitOfMeasurement, @ProductCost, @ProductMaxDiscountAmount, @ProductManufacturer, @ProductSupplier, @ProductCategory, @ProductDiscountAmount, @ProductQuantityInStock, @ProductDescription)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 25.12.2023 9:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateOrder]

@OrderStatus nvarchar(30),
@OrderDeliveryDate date,
@OrderCode int
AS
BEGIN
	UPDATE dbo.ViewOrderMA 
	SET [Статус заказа] = @OrderStatus,
	[Дата доставки] = @OrderDeliveryDate
	WHERE [Номер заказа] = @OrderCode
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
         Begin Table = "Product"
            Begin Extent = 
               Top = 29
               Left = 136
               Bottom = 159
               Right = 381
            End
            DisplayFlags = 280
            TopColumn = 6
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCountArticles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewCountArticles'
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
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 5
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrder'
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
         Begin Table = "Product"
            Begin Extent = 
               Top = 158
               Left = 471
               Bottom = 288
               Right = 716
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "OrderProduct"
            Begin Extent = 
               Top = 6
               Left = 286
               Bottom = 119
               Right = 495
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 120
               Left = 286
               Bottom = 250
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         Column = 2460
         Alias = 4560
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         So' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrderMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'rtType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrderMA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrderMA'
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
         Begin Table = "OrderProduct"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 247
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrderProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewOrderProduct'
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
         Begin Table = "PickUpPoint"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 234
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPickUpPoints'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPickUpPoints'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[24] 2[9] 3) )"
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
         Begin Table = "Product"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 283
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         Column = 2685
         Alias = 4005
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewProducts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewProducts'
GO
