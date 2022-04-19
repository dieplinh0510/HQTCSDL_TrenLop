use master 
go

if exists (select 1 from master.dbo.sysdatabases where name = 'Bai2_2')
	drop database Bai2_2

create database Bai2_2

use Bai2_2
go

create table HangSX (
	MaHangSX nchar(10) not null primary key,
	TenHang nvarchar(20),
	DiaChi nvarchar(20),
	SoDT nvarchar(20),
	Email nvarchar(30)
)

create table SanPham(
	MaSP nchar(10) not null primary key,
	MaHangSX nchar(10),
	TenSP nvarchar(20),
	SoLuong int,
	MauSac nvarchar(20),
	GiaBan money,
	DonViTinh nchar(10),
	MoTa nvarchar(max),
	constraint fk_SanPham_HangSX foreign key (MaHangSX) references HangSX(MaHangSX)
)

create table NhanVien(
	MaNV nchar(10) not null primary key,
	TenNV nvarchar(20),
	GioiTinh nchar(10),
	DiaChi nvarchar(30),
	SoDT nvarchar(20),
	Email nvarchar(30),
	TenPhong nvarchar(30)
)

create table PNhap(
	SoHDN nchar(10) not null primary key,
	NgayNhap date,
	MaNV nchar(10),
	constraint fk_Nhap_NhanVien foreign key (MaNV) references NhanVien(MaNV)
)

create table Nhap(
	SoHDN nchar(10),
	MaSP nchar(10),
	SoLuongN int,
	DonGiaN money,
	constraint pk_Nhap_PNhap primary key (SoHDN, MaSP),
	constraint fk_PNhap_Nhap foreign key (SoHDN) references PNhap(SoHDN),
	constraint fk_SanPham_Nhap foreign key (MaSP) references SanPham(MaSP)
)

create table PXuat(
	SoHDX nchar(10) not null primary key,
	NgayXuat date,
	MaNV nchar(10),
	constraint fk_NhanVien_PXuat foreign key (MaNV) references NhanVien(MaNV)
)

create table Xuat(
	SoHDX nchar(10),
	MaSP nchar(10),
	SoLuongX int,
	constraint pk_Xuat_PXuat primary key (SoHDX, MaSP),
	constraint fk_PXuat_Xuat foreign key (SoHDX) references PXuat(SoHDX),
	constraint fk_SanPham_Xuat foreign key (MaSP) references SanPham(MaSP)
)

insert into HangSX values
('H01', 'SamSung', N'Korea', '011-08271717', 'ss@gmail.com.kr'),
('H02', 'OPOP', N'China', '081-08626262', 'oppo@gmail.com.cn'),
('H03', 'Vinfone', N'Việt Nam', '084-098262626', 'vf@gmail.com.vn')

insert into NhanVien values 
('NV01', N'Nguyễn Thị Thu', N'Nữ', N'Hà Nội', 09826262521, 'thu@gmail.com', N'Kế toán'),
('NV02', N'Lê Văn Nam', N'Nam', N'Bắc Ninh', 0972525252, 'nam@gmail.com', N'Vật tư'),
('NV03', N'Trần Hòa Bình', N'Nữ', N'Hà Nội', 0328388388, 'hb@gmail.com', N'Kế toán')

insert into SanPham values
('SP01', 'H02', 'F1 Plus', 100, N'Xám', 7000000, N'Chiếc', N'Hàng cận cao cấp'),
('SP02', 'H01', 'Galaxy Note 11', 50, N'Đỏ', 19000000, N'Chiếc', N'Hàng cao cấp'),
('SP03', 'H02', 'F3 lite', 200, N'Nâu', 3000000, N'Chiếc', N'Hàng phổ thông'),
('SP04', 'H03', 'Vjoy3', 200, N'Xám', 15000000, N'Chiếc', N'Hàng phổ thông'),
('SP05', 'H01', 'Galaxy V21', 500, N'Nâu', 8000000, N'Chiếc', N'Hàng cận cao cấp')

insert into PNhap values 
('N01', '02-05-2019', 'NV01'),
('N02', '04-07-2020', 'NV02'),
('N03', '05-17-2020', 'NV02'),
('N04', '03-22-2020', 'NV03'),
('N05', '07-07-2020', 'NV01')

insert into Nhap values
('N01', 'SP02', 10, 17000000),
('N02', 'SP01', 30, 6000000),
('N03', 'SP04', 20, 12000000),
('N04', 'SP01', 10, 62000000),
('N05', 'SP05', 20, 70000000)

insert into PXuat values
('X01', '06-14-2020', 'NV02'),
('X02', '03-05-2019', 'NV03'),
('X03', '12-12-2020', 'NV01'),
('X04', '06-02-2020', 'NV02'),
('X05', '05-18-2020', 'NV01')

insert into Xuat values 
('X01', 'SP03', 5),
('X02', 'SP01', 3),
('X03', 'SP02', 1),
('X04', 'SP03', 2),
('X05', 'SP05', 1)


select * from HangSX
select * from SanPham
select * from NhanVien
select * from PNhap
select * from Nhap
select * from PXuat
select * from Xuat
