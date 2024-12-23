use [Final Exercise]

create table City (
CityId	int primary key,
CityName nvarchar (50)
);

create table Neighborhood (
NeighborhoodId	int primary key,
CityId int references  City (CityId) not null,
NeighborhoodName nvarchar (50),
Street nvarchar (50)
);


create table Houses (
HousesId int primary key,
NeighborhoodId int references  Neighborhood (NeighborhoodId) not null,
HouseTypeId int references  HouseType (HouseTypeId) not null,
Rooms int,
DateBuilt date
);


create table HouseType (
HouseTypeId	int primary key,
HouseType nvarchar (50)
);


create table Sale (
SaleId	int primary key,
HousesId int references  Houses (HousesId),
SalesManId int references  SalesMan (SalesManId) not null,
CustomerId int references  Customer (CustomerId) not null,
SalePrice int not null
);


create table SalesMan (
SalesManId int primary key,
HouseTypeId int references  HouseType (HouseTypeId) not null,
FirstName nvarchar(50),
LastName nvarchar(50),
Address nvarchar(50), 
PhoneNumber char(10) not null unique
);


create table Customer (
CustomerId	int primary key,
FirstName nvarchar(50),
LastName nvarchar(50),
PhoneNumber char(10) not null unique,
DesiredPrice int
);

