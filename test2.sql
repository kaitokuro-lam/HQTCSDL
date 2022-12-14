USE [QLDiem]
GO
/****** Object:  UserDefinedFunction [dbo].[thongke]    Script Date: 12/15/2022 5:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[thongke] (@tmh nvarchar(20))
returns int
as
begin
 declare @dem int
 set @dem = (select count(@tmh) from Diem join MonHoc on MonHoc.MaMON = Diem.MaMON where Diem.DiemThi<5)
 return @dem
end
GO
/****** Object:  UserDefinedFunction [dbo].[tksv]    Script Date: 12/15/2022 5:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[tksv] (@tmh nvarchar(20))
returns int
as
begin
	declare @dem int
	set @dem = (select DiemThi
	from Diem
	where @dem<5)
	return @dem
end
GO
/****** Object:  Table [dbo].[Diem]    Script Date: 12/15/2022 5:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diem](
	[MaSV] [varchar](4) NOT NULL,
	[MaMon] [varchar](4) NOT NULL,
	[DiemThi] [float] NULL,
 CONSTRAINT [PK_MaSV_MaMon] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 12/15/2022 5:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMon] [varchar](4) NOT NULL,
	[TenMon] [nvarchar](30) NULL,
	[SoTC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 12/15/2022 5:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [varchar](4) NOT NULL,
	[HoTen] [nvarchar](30) NULL,
	[NgaySinh] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemThi]) VALUES (N'SV01', N'01', 0.1)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemThi]) VALUES (N'SV01', N'02', 0)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemThi]) VALUES (N'SV01', N'03', 3)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemThi]) VALUES (N'SV02', N'02', 5)
INSERT [dbo].[Diem] ([MaSV], [MaMon], [DiemThi]) VALUES (N'SV03', N'01', 2)
GO
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC]) VALUES (N'01', N'Cơ sở dữ liệu', 2)
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC]) VALUES (N'02', N'Lập trình mạng', 2)
INSERT [dbo].[MonHoc] ([MaMon], [TenMon], [SoTC]) VALUES (N'03', N'GIS', 3)
GO
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh]) VALUES (N'SV01', N'Trần thanh Lâm', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh]) VALUES (N'SV02', N'Trần Đức Độ', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [NgaySinh]) VALUES (N'SV03', N'Trần Phong Lê', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_MaMon] FOREIGN KEY([MaMon])
REFERENCES [dbo].[MonHoc] ([MaMon])
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_MaMon]
GO
ALTER TABLE [dbo].[Diem]  WITH CHECK ADD  CONSTRAINT [FK_MaSV] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[Diem] CHECK CONSTRAINT [FK_MaSV]
GO
/****** Object:  StoredProcedure [dbo].[nhapDiem]    Script Date: 12/15/2022 5:22:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[nhapDiem](@MaSV char(5),@MaMon char(5), @DiemThi float)
as
insert into Diem(MaSV,MaMon,Diemthi) values(@MaSV,@MaMon,@DiemThi)
GO
