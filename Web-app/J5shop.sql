DROP DATABASE IF EXISTS J5Shop ;
go
create database J5Shop;
go
-- Create table
USE J5Shop
go
CREATE TABLE Accounts(
	username varchar(50) NOT NULL primary Key,
	activated bit NOT NULL,
	admin bit NOT NULL,
	email varchar(50) NULL,
	fullname nvarchar(50) NULL,
	password varchar(150) NULL,
	photo varchar(50) NULL
)
go
CREATE TABLE Address(
	id int IDENTITY(1,1) NOT NULL primary key,
	country nvarchar(250) NULL,
	firstname nvarchar(250) NULL,
	lastname nvarchar(250) NULL,
	address nvarchar(250) NULL,
	phone nvarchar(250) NULL,
	email varchar(250) NULL,
	username varchar(50) NULL,
	FOREIGN KEY (username) REFERENCES Accounts(username)
)
go
CREATE TABLE Roles(
	Id varchar(10) NOT NULL primary key,
	Name nvarchar(50) NULL
)
go
CREATE TABLE Authorities(
	Id int IDENTITY(1,1) NOT NULL primary key,
	Username varchar(50) NULL,
	RoleId varchar(10) NULL,
	FOREIGN KEY (username) REFERENCES Accounts(username),
	FOREIGN KEY (RoleId) REFERENCES Roles(Id)
)
go
CREATE TABLE Categories(
	id int NOT NULL primary key,
	name nvarchar(50) NULL
)
go
CREATE TABLE Details(
	id int IDENTITY(1,1) NOT NULL primary key,
	createdate date NULL,
	status bit NULL,
	total float NULL,
	name varchar(50) NULL,
	username varchar(50) NULL
)
go
CREATE TABLE Products(
	id int NOT NULL primary key,
	name nvarchar(50) NULL,
	image nvarchar(50) NULL,
	price float NULL,
	createdate date NULL,
	available bit NULL,
	categoryid int NULL,
	qty int NULL,
	origin nvarchar(50) NULL,
	manufacture nvarchar(50) NULL,
	describle nvarchar(500) NULL,
	review nvarchar(250) NULL,
	FOREIGN KEY (categoryid) REFERENCES Categories(id),
)
go
CREATE TABLE Orders(
	id bigint IDENTITY(1,1) NOT NULL primary key,
	username varchar(50) NULL,
	createdate date NULL,
	address nvarchar(100) NULL,
	productid int NULL,
	name varchar(50) NULL,
	status bit NULL,
	qty int NULL,
	FOREIGN KEY (username) REFERENCES Accounts(username),
	FOREIGN KEY (productid) REFERENCES Products(id)
)
go
-- Create data
INSERT Accounts  VALUES (N'rongkho001@gmail.com', 0, 0, N'rongkho001@gmail.com', NULL, N'$2a$10$i4lT/KvCxZh5GUJdomr6dOMhZ06eSvvQSwW8/Q.nCyH1ZWqDc3mIu', NULL),
						(N'user1', 0, 0, N'rongkho2@gmail.com', N'Bui Duc Minh', N'$2a$10$AkslCmNm.EOW52U7gKX6ROL5XI5gQlCi9bvgBaoeBMXJriY09majC', NULL),
						(N'user2', 0, 0, N'my22@gmail.com', N'Tran Ha My', N'$2a$10$AkslCmNm.EOW52U7gKX6ROL5XI5gQlCi9bvgBaoeBMXJriY09majC', NULL),
						(N'user3', 0, 0, N'huy33@gmail.com', N'Le Huy', N'$2a$10$AkslCmNm.EOW52U7gKX6ROL5XI5gQlCi9bvgBaoeBMXJriY09majC', NULL),
						(N'user4', 0, 0, N'ha3@gmail.com', N'Nhu Ha', N'$2a$10$AkslCmNm.EOW52U7gKX6ROL5XI5gQlCi9bvgBaoeBMXJriY09majC', NULL)
go
INSERT Address VALUES (N'Vietnam', N'minh', N'MINH', N'QWE', N'9123123', N'rongkho2@gmail.com', N'user2'),
					  (N'Vietnam', N'Minh', N'BÙI', N'106 Lý thường Kiệt', N'0914054080', N'rongkho2@gmail.com', N'user3'),
					  (N'Vietnam', N'DUC', N'hà', N'106 ly thường kiệt, HCM CITY, VN', N'0914054080', N'rongkho2@gmail.com', N'user1'),
					  (N'Vietnam', N'DUC', N'MINH', N'106 ly thường kiệt, HCM CITY, VN', N'0914054080', N'rongkho2@gmail.com', N'user4')
go
INSERT Roles VALUES (N'ADMIN', N'Administrators'),
					(N'GUEST', N'Guests'),
					(N'USER', N'Users')
go
INSERT Authorities VALUES (N'user2', N'USER'),
						  ( N'user4', N'GUEST'),
						  (N'rongkho001@gmail.com', N'GUEST'),
						  (N'user3', N'ADMIN'),
						  (N'user1', N'GUEST')
go
INSERT Categories VALUES (3, N'Máy tính'),
						 (4, N'Điện thoại di động'),
						 (5, N'Phụ kiện & Kháca')
go
INSERT Details VALUES (CAST(N'2022-04-07' AS Date), 0, 200, N'569120', N'user3'),
					  (CAST(N'2022-04-20' AS Date), 1, 0, N'682731', N'USER2'))
go
INSERT Products VALUES (0, N'i3 - Gen 10th', N'p1.PNG', 200, CAST(N'9999-12-31' AS Date), 0, 3, 98, N'Việt Nam', N'Itel', N'Intel Core i3 Gen 10 là một bộ xử lý độc quyền của Intel được xây dựng trên khuôn khổ của kiến ​​trúc đa xử lý. Nó là một loại vi xử lý lõi kép với một đơn vị xử lý đồ họa tích hợp (GPU).', N'91% người dùng thích sản phẩm này !'),
					   (1, N'Chuột Razor Gaming', N'p2.PNG', 150, CAST(N'2001-12-31' AS Date), 0, 5, 79, N'Việt Nam', N'MSI', N'Razer DeathAdder Essential thiết kế đơn giản với kiểu dáng truyền thống, tạo điểm nhấn nhờ logo Razer nổi bật phong cách gaming, hình thái vừa vặn tay đảm bảo không gây mỏi cổ tay cả khi sử dụng lâu.', N'80% người dùng thích sản phẩm này !'),
					   (2, N'Vỏ PC Cao Cấp', N'p6.PNG', 200, CAST(N'2000-03-31' AS Date), 0, 3, -944, N'Việt Nam', N'Lenovo', N'Đây là loại vỏ bé nhất và cũng có giá trị decor (trang trí) cao nhất cho những người dùng ưa thích sự đơn giản, nhỏ gọn. Đặc điểm của loại vỏ case này là có diện tích và khoảng không rất bé, thế nên khi lựa chọn và sử dụng các linh kiện, bạn phải nghiên cứu và tìm hiểu kỹ trước khi đưa ra quyết định mua sắm.', N'75% người dùng thích sản phẩm này !'),
					   (3, N'Tai Nghe Gaming', N'p4.PNG', 230, CAST(N'2000-03-31' AS Date), 0, 5, 82, N'Việt Nam', N'SamSung', N'Tai nghe nhét trong Samsung EG920B có đi nút đệm tai nghe dạng móc Giúp người đeo khi vận động mạnh sẽ không bị rớt ra.', N'91% người dùng thích sản phẩm này !'),
					   (4, N'Chuột MSI', N'p5.PNG', 40, CAST(N'1999-03-12' AS Date), 0, 5, 99, N'Việt Nam', N'MSI', N'Chuột MSI Interceptor DS300 Laser GAMING được thiết kế để đảm bảo phù hợp với người thuận tay phải nhất cho các game thủ. ', N'94% người dùng thích sản phẩm này !'),
					   (5, N'Vỏ PC Cao Cấp 2', N'p3.PNG', 245, CAST(N'2003-03-11' AS Date), 0, 3, 80, N'Việt Nam', N'Acer', N'Vỏ Case Máy Tính Thermaltake Level 20 XT Tempered Glass CA-1L1-00F1WN-00 E-ATX sở hữu lớp vỏ hình khối được thiết kế đặc biệt để thể hiện các hệ thống làm mát bằng chất lỏng tùy chỉnh, bo mạch chủ có thiết kế phẳng độc đáo, đặt các bộ phận được hiển thị từ mọi góc độ và thiết kế buồng ngăn cách các bộ phận làm mát', N'100% người dùng thích sản phẩm này !'),
					   (6, N'Itel Core I7 - Gen 10th', N'p7.PNG', 400, CAST(N'1987-04-21' AS Date), 0, 3, 98, N'Việt Nam', N'Itel', N'Core i7 Gen 10 là dòng vi xử lý 64-bit x86-64 hiệu suất cao được Intel thiết kế cho máy tính để bàn và máy tính xách tay cao cấp. Core i7 được giới thiệu vào năm 2008 sau khi dòng Core 2 Quad nghỉ hưu.', N'91% người dùng thích sản phẩm này !'),
					   (7, N'Tay Cầm Chơi Game Điện Thoại', N'p8.PNG', 20, CAST(N'2002-04-11' AS Date), 0, 4, 99, N'Việt Nam', N'Xiaomi', N'Đối với những thể loại game như bóng đá hoặc đua xe thì lợi ích của việc chơi game với tay cầm chơi game hơn hẳn bàn phím. Khi bạn trải nghiệm nút Trigger ở tay cầm Xbox One hoặc PlayStation 4 trong game đua xe bạn có thể ga nhẹ hoặc tăng tốc với nhiều mức độ khác nhau', N'91% người dùng thích sản phẩm này !'),
					   (8, N'Củ Sạc Baseus', N'p9.PNG', 30, CAST(N'1999-03-12' AS Date), 0, 5, 90, N'Việt Nam', N'China', N'Sạc nhanh A2633 20W sở hữu thiết kế nhỏ gọn với hình lục giác thời trang. Công nghệ sạc nhanh lên đến 20W, đáp ứng nhu cầu sử dụng của người dùng, sạc đầy pin nhanh chóng.', N'61% người dùng thích sản phẩm này !'),
					   (9, N'Bàn Phím Cơ Cao Cấp', N'p10.PNG', 45, CAST(N'2003-03-11' AS Date), 0, 3, 100, N'Việt Nam', N'China', N'Thiết kế thời thường, gọn nhẹ, rất thích hợp để chơi game, làm việc. Có đến 104 phím, vùng phím số dễ dàng thao tác. Sử dụng Green Mechanical Switch cho xúc giác chân thật khi tác động,', N'56% người dùng thích sản phẩm này !'),
					   (10, N'Quạt Tản Nhiệt RGB', N'p11.PNG', 100, CAST(N'1987-04-21' AS Date), 0, 3, 100, N'Việt Nam', N'Asus', N'Fan Case Vitra Luna ARGB ( 5 Fan Pack / Kèm điều khiển) là chiếc quạt tản nhiệt cao cấp với đèn RGB bắt mắt, rất đẹp mắt khi dùng để trang trí case máy tính. Đồng thời Vitra Luna ARGB còn đem lại hiệu năng tản nhiệt tốt, phù hợp với các cấu hình chơi game cao cấp.', N'85% người dùng thích sản phẩm này !'),
					   (11, N'Đồ Chơi Trẻ Em', N'p12.PNG', 5000, CAST(N'2002-04-11' AS Date), 0, 5, 80, N'Việt Nam', N'Toy', N'Đồ chơi trẻ em với tính năng siêu việt giúp trở thành thiên tài', N'52% người dùng thích sản phẩm này !'),
					   (12, N'1 Ổ SSD Gigabyte 512GB', N'p13.PNG', 300, CAST(N'2003-03-11' AS Date), 0, 3, 77, N'Việt Nam', N'Gigabyte', N'Ổng cứng KC300 tích hợp TCG Opal 1.0 vô cùng lý tưởng cho các công ty đang thực thi phần mềm quản trị trung tâm để quản lý các chính sách bảo mật, khôi phục mật khẩu, nhật ký thực hiện, cập nhật tự động và tạo/xóa người dùng', N'56% người dùng thích sản phẩm này !'),
					   (13, N'Zoom Cam Cho ĐT', N'p14.PNG', 85, CAST(N'1987-04-21' AS Date), 0, 4, 40, N'Việt Nam', N'Apple', N'Zoom số hiện đang phát triển khá mạnh mẽ, nhờ tính tiện dụng, giá thành rẻ và công nghệ phát triển mạnh, được sử dụng không chỉ trên máy ảnh mà cả trên các dòng smartphone với khả năng zoom ấn tượng.', N'75% người dùng thích sản phẩm này !')
go
INSERT Orders VALUES (N'user3', null, N'106 Lý thường Kiệt', 2, N'569120', 0, 1)
GO
