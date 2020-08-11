use challenge2db;
go

create schema dbo;
go

create table dbo.Department
(
  ID int not null identity (1,1),
  [Name] nvarchar(250) null,
  [Location] nvarchar(250) null,
  constraint PK_DeptID primary key (ID),
);

create table dbo.Employee
(
  ID int not null identity (1,1),
  FirstName nvarchar(250) null,
  LastName nvarchar(250) null,
  SSN int null,
  DeptID int not null, /*FK*/
  constraint PK_EmpID primary key (ID),
);

create table dbo.EmpDetails
(
  ID int not null identity (1,1),
  EmployeeID int not null,  /*FK*/
  Salary int null,
  Address1 nvarchar(250) null,
  Address2 nvarchar(250) null,
  City nvarchar(250) null,
  [State] nvarchar(250) null,
  County nvarchar(250) null,
  constraint PK_DetID primary key (ID)
);

alter table dbo.Employee
  add constraint FK_DBO_DeptID foreign key (DeptID) references dbo.Department(ID)
GO

alter table dbo.Employee
  add constraint FK_DBO_ID foreign key (ID) references dbo.EmpDetails(EmployeeID)
GO

alter table dbo.EmpDetails
  add constraint FK_DBO_EmployeeID foreign key (EmployeeID) references dbo.Employee(ID)
GO

select *
from dbo.Department

select *
from dbo.Employee

select *
from dbo.EmpDetails