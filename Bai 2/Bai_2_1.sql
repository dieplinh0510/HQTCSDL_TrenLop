use master
go

if EXISTS (SELECT 'true' From master.dbo.SysDatabases Where name = 'Bai2_1')
	Drop database Bai2_1
create database Bai2_1


Go
use Bai2_1
go

create table HangSX(
	maHangSX char(20) not null primary key,
	tenHang char(20),
	diaChi char(30),
	soDT int,
	email char(20),
)

create table SanPham(
	maSP char(20) not null primary key,
	maHangSX char(20), 
	tenSP char(30),
	soLuong int,
	mauSac char(10),
	giaBan int,
	donViTinh char(10),
	moTa char(30)
	constraint fk_HangSX_SanPham foreign key (maHangSX) references HangSX(maHangSX)
)

create table NhanVien(
	maNV char(10) not null primary key,
	tenNV char(30), 
	gioiTinh char(10),
	diaChi char(30),
	soDT int,
	email char(20),
	tenPhong char(20)
)

create table PNhap(
	soHDN char(10) not null primary key,
	ngayNhap date,
	maNV char(10)
	constraint fk_PNhap_NhanVien foreign key (maNV) references NhanVien(maNV)
)

create table Nhap(
	soHDN char(10),
	maSP char(20),
	soLuongN int, 
	donGiaN int,
	constraint pk_Nhap primary key (soHDN, maSP),
	constraint fk_PNhap_Nhap foreign key (soHDN) references PNhap(soHDN),
	constraint fk_SanPham_Nhap foreign key (maSP) references SanPham(maSP)
)

create table PXuat(
	soHDX char(10) not null primary key,
	ngayXuat date,
	maNV char(10),
	constraint pk_PXuat_NhanVien foreign key (maNV) references NhanVien(maNV)
)

create table Xuat(
	soHDX char(10),
	maSP char(20),
	soLuongX int,
	constraint pk_Xuat primary key (soHDX, maSP),
	constraint pk_Xuat_PXuat foreign key (soHDX) references PXuat(soHDX),
	constraint pk_SanPham_Xuat foreign key (maSP) references SanPham(maSP)
)

insert into SanPham values 
('SP01', 'MH01', 'But chi', 2, 'Mau hong', 10000, 'VND', 'But'),
('SP02', 'MH02', 'Thuoc ke', 3, 'Mau trang', 20000, 'VND', 'Thuoc'),
('SP03', 'MH03', 'But may', 5, 'Mau den', 400000, 'VND', 'But')


insert into HangSX values
('MH01', 'But', 'Ha Noi', 11111, 'email@gmail.com'),
('MH02', 'Thuoc', 'Da Nang', 22222, 'email@gmail.com'),
('MH03', 'But', 'Ho Chi Minh', 33333, 'email@gmail.com')


insert into NhanVien values
('NV01', 'Lam', 'Nu', 'Ha Noi', 011111111, 'email@gmail.com', 'Hanh chinh'),
('NV02', 'Linh', 'Nu', 'Bac Giang', 02222222, 'email@gmail.com', 'Ke Toan'),
('NV03', 'Lam Linh', 'Nam', 'Bac Ninh', 033333333, 'email@gmail.com', 'Hanh chinh')

insert into Nhap values
('HDN01', 'SP01', 30, 100000),
('HDN02', 'SP02', 20, 300000),
('HDN03', 'SP03', 80, 400000)

insert into PNhap values
('HDN01', '02/03/2002', 'NV01'),
('HDN02', '01/03/2002', 'NV02'),
('HDN03', '04/03/2002', 'NV01')

insert into Xuat values
('HDX01', 'SP01', 10),
('HDX02', 'SP02', 1),
('HDX03', 'SP01', 2)

insert into PXuat values
('HDX01', '01/02/2002', 'NV01'),
('HDX02', '03/02/2002', 'NV02'),
('HDX03', '03/02/2002', 'NV02')

select * from HangSX
select * from NhanVien
select * from Nhap
select * from PNhap
select * from PXuat
select * from SanPham
select * from Xuat