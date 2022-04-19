use master
go

if exists (select 'true' from master.dbo.sysdatabases where name = 'Bai_2_22')
	drop database Bai_2_22
create database Bai_2_22

use Bai_2_22
go

create table Department(
	DepartmentNo int primary key,
	DepartmentName char(25) not null,
	Location char(25) not null
)

create table Employee(
	EmpNo int primary key,
	Fname varchar(15) not null,
	Lname varchar(25) not null,
	Job varchar(25) not null,
	HireDate datetime not null,
	Salary numeric not null,
	Commision numeric,
	DepartmentNo int,
	constraint fk_Department_Enployee foreign key (DepartmentNo) references Department(DepartmentNo)
)

insert into Department values
(10, 'Accounting', 'Melbourne'),
(20, 'Research', 'Adealide'),
(30, 'Sales', 'Sydney'),
(40, 'Operations', 'Perth')

insert into Employee values
(1, 'John','Smith', 'Clerk', '17-Dec-1980', 800, null, 20),
(2, 'Peter','Allen', 'Salesman', '20-Feb-1981', 1600, 300, 30),
(3, 'Kate','Ward', 'Salesman', '22-Feb-1981', 1250, 500, 30),
(4, 'Jack','Jones', 'Manager', '02-Apr-1981', 2975, null, 20),
(5, 'Joe','Martin', 'Salesman', '28-Sep-1981', 1250, 1400, 30)

select * from Department
select *from Employee