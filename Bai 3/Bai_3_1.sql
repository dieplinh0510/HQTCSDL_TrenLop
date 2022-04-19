use master
go

if exists (select 'true' from master.dbo.sysdatabases where name = 'Bai_3_1')
	drop database Bai_3_1

create database Bai_3_1

use Bai_3_1
go

create table Khoa(
	makhoa char(10) primary key,
	tenkhoa char(30),
	dienthoai char(10)
)

create table GiangVien(
	magv int primary key,
	hotengv char(30),
	luong decimal(5,2),
	makhoa char(10),
	constraint fk_GiangVien_Khoa foreign key (makhoa) references Khoa(makhoa)
)

create table SinhVien(
	masv int primary key,
	hotensv char(30),
	makhoa char(10),
	namsinh int,
	quequan char(30),
	constraint fk_SinhVien_Khoa foreign key (makhoa) references Khoa(makhoa)
)

create table DeTai(
	madt char(10) primary key,
	tendt char(30), 
	kinhphi int,
	noithuctap char(30)
)

create table HuongDan(
	masv int primary key,
	madt char(10),
	magv int, 
	ketqua decimal(5,2),
	constraint fk_SinhVien_HuongDan foreign key (masv) references SinhVien(masv),
	constraint fk_Detai_HuongDan foreign key (madt) references DeTai(madt),
	constraint fk_GiangVien_HuongDan foreign key (magv) references GiangVien(magv)

)

insert into Khoa values
('K01', 'Dia ly', '012345678'),
('K02', 'QLTN', '012345678'),
('K03', 'Cong nghe sinh hoc', '012345678'),
('K04', 'Toan', '011111111'),
('K05', 'Van', '012345678')

insert into GiangVien values
(1, 'Tran Thi Hoa', 100.00, 'K01'),
(2, 'Nguyen Van A', 200.00, 'K02'),
(3, 'Nguyen Thi B', 120.00, 'K03'),
(4, 'Tran Phuong Hoa', 160.00, 'K01'),
(5, 'Nguyen Thi C', 190.00, 'K02')

insert into SinhVien values
(5, 'Lam', 'K04', 2029, 'Bac Giang'),
(1, 'Tran Thi D', 'K01', 2019, 'Bac Giang'),
(2, 'Truong Thi H', 'K03', 2019, 'Quang Ninh'),
(3, 'Nguyen Van Hien', 'K02', 2019, 'Ha Noi'),
(4, 'Tran Phuong Lan', 'K04', 2019, 'Bac Ninh'),


insert into DeTai values
('DT01', 'Khoa hoc', 10000, 'samsung'),
('DT02', 'Thien nhien', 100000, 'oppo'),
('DT03', 'Tu nhien', 20000, 'iphone')

insert into HuongDan values
(1, 'DT01', 1, 400.00),
(2, 'DT02', 3, 500.00),
(3, 'DT02', 3, 700.00),
(4, 'DT03', 2, 400.00)

select * from Khoa
select * from GiangVien
select * from SinhVien
select * from DeTai
select * from HuongDan

select GiangVien.magv, GiangVien.hotengv, Khoa.tenkhoa
from GiangVien inner join Khoa on GiangVien.makhoa = Khoa.makhoa

select GiangVien.magv, GiangVien.hotengv, Khoa.tenkhoa
from GiangVien inner join Khoa on GiangVien.makhoa = Khoa.makhoa
--where Khoa.tenkhoa = 'Dia ly' or Khoa.tenkhoa = 'QLTN'
where Khoa.tenkhoa in ('Dia ly', 'QLTN')

select count(masv) as 'Sinh vien'
from SinhVien inner join Khoa on SinhVien.makhoa = Khoa.makhoa
where Khoa.tenkhoa = 'Cong nghe sinh hoc'

select SinhVien.masv, SinhVien.hotensv, year(getdate())-namsinh as 'tuoi'
from SinhVien inner join Khoa on SinhVien.makhoa = Khoa.makhoa
where Khoa.tenKhoa = 'Toan'

select count(magv) as 'So Giang Vien'
from GiangVien inner join Khoa on GiangVien.makhoa = Khoa.makhoa
where Khoa.tenkhoa = 'Cong nghe sinh hoc'

select *
from SinhVien
where masv not in (select masv
					from HuongDan )

select Khoa.makhoa, Khoa.tenkhoa, count(magv)
from Khoa inner join GiangVien on Khoa.makhoa = GiangVien.makhoa
group by Khoa.makhoa, Khoa.tenkhoa

select Khoa.dienthoai
from Khoa inner join SinhVien on Khoa.makhoa = SinhVien.makhoa
where hotensv = 'Le van Son'