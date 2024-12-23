use [Final Exercise]

insert into City (CityId, CityName) values
(4456, 'Haifa'),
(8657, 'Tokyo'),
(6741, 'Osaka'),
(3641, 'Ramat Gan'),
(7894, 'Jerusalem'),
(1274, 'London'),
(7854, 'Berlin'),
(9673, 'Moscow'),
(5197, 'Kuala Lampur'),
(4153, 'Edinburough'),
(6674, 'Dublin'),
(8345, 'Manchester'),
(9217, 'Stugart'),
(5237, 'Frankfurt'),
(6728, 'Venice')

insert into Neighborhood (NeighborhoodId, CityId, NeighborhoodName, Street) values
(000001, 4456, 'Downtown', 'Main Street'),
(000002, 8657, 'Northside', 'First Ave'),
(000003, 6741, 'South Beach', 'Ocean Drive'),
(000004, 3641, 'West End', 'Elm Street'),
(000005, 7894, 'Eastside', 'Park Ave'),
(000006, 1274, 'Hillcrest', 'Maple Street'),
(000007, 7854, 'Uptown', 'Broadway'),
(000008, 9673, 'Midtown', '5th Ave'),
(000009, 5197, 'Central', 'Market Street'),
(000010, 4153, 'The Village', 'Green Street'),
(000011, 6674, 'Old Town', 'Main Street'),
(000012, 8345, 'University', 'Campus Drive'),
(000013, 9217, 'Riverfront', 'River Road'),
(000014, 5237, 'Harborview', 'Harbor Street'),
(000015, 6728, 'Lakeview', 'Lake Road');

insert into Houses (HousesId, NeighborhoodId, HouseTypeId, Rooms, DateBuilt) values 
(1, 000001, 17, 3,'2021-03-15'),
(2, 000002, 28, 4, '2019-06-20'),
(3, 000003, 37, 2, '2017-10-12'),
(4, 000004, 11, 5, '2022-01-05'),
(5, 000005, 25, 3, '2016-04-18'),
(6, 000006, 34, 4, '2018-09-30'),
(7, 000007, 13, 2, '2019-12-25'),
(8, 000008, 29, 4, '2020-08-10'),
(9, 000009, 35, 5, '2021-05-01'),
(10, 000010, 16, 3, '2017-08-22'),
(11, 000011, 22, 4, '2022-02-28'),
(12, 000012, 33, 3, '2016-11-11'),
(13, 000013, 14, 2, '2018-05-09'),
(14, 000014, 26, 4, '2020-10-15'),
(15, 000015, 39, 5, '2019-03-01');

insert into HouseType (HouseTypeId, HouseType) values 
(17, 'Single Family Home'),
(28, 'Apartment'),
(37, 'Townhouse'),
(11, 'Condominium'),
(25, 'Villa'),
(34, 'Bungalow'),
(13, 'Mansion'),
(29, 'Cottage'),
(35, 'Ranch'),
(16, 'Duplex'),
(22, 'Mobile Home'),
(33, 'Tiny House'),
(14, 'Log Cabin'),
(26, 'Castle'),
(39, 'Houseboat');

insert into Sale (SaleId, HousesId, SalesManId, CustomerId, SalePrice) values
(01, 1, 001, 10, 250000),
(02, 2, 002, 21, 350000),
(03, 3, 003, 32, 175000),
(04, 4, 004, 43, 500000),
(05, 5, 005, 54, 225000),
(06, 6, 006, 65, 400000),
(07, 7, 007, 76, 150000),
(08, 8, 008, 87, 275000),
(09, 9, 009, 98, 425000),
(010, 10, 0010, 100, 275000),
(011, 11, 0011, 111, 350000),
(012, 12, 0012, 122, 225000),
(013, 13, 0013, 133, 125000),
(014, 14, 0014, 144, 300000),
(015, 15, 0015, 155, 175000);

insert into SalesMan (SalesManId, HouseTypeId, FirstName, LastName, Address, PhoneNumber) values
(001, 17, 'John', 'Doe', '123 Main St', '1234567890'),
(002, 28, 'Jane', 'Smith', '456 Elm St', '2345678902'),
(003, 37, 'David', 'Lee', '789 Oak St', '3456789013'),
(004, 11, 'Sarah', 'Johnson', '234 Maple St', '4567890124'),
(005, 25, 'Michael', 'Brown', '567 Pine St', '5678901235'),
(006, 34, 'Jessica', 'Garcia', '890 Cedar St', '6789012346'),
(007, 13, 'Christopher', 'Martinez', '321 Birch St', '7890123457'),
(008, 29, 'Amanda', 'Davis', '654 Spruce St', '8901234568'),
(009, 35, 'William', 'Taylor', '987 Fir St', '9012345679'),
(0010,16, 'Emily', 'Wilson', '654 Elm St', '0123456789'),
(0011,22, 'Daniel', 'Anderson', '321 Oak St', '2345678901'),
(0012,33, 'Olivia', 'Gonzalez', '987 Maple St', '3456789012'),
(0013,14, 'Matthew', 'Hernandez', '654 Cedar St', '4567890123'),
(0014,26, 'Samantha', 'Lopez', '321 Birch St', '5678901234'),
(0015,39, 'Andrew', 'Martin', '987 Spruce St', '6789012345');

insert into Customer (CustomerId, FirstName, LastName, PhoneNumber, DesiredPrice) values
(10, 'John', 'Doe', '1234567890', 567657),
(21, 'Jane', 'Smith', '2345678901', 768389),
(32, 'David', 'Lee', '3456789013', 9085493),
(43, 'Sarah', 'Johnson', '4567890124', 2137654),
(54, 'Michael', 'Brown', '5678901234', 324324),
(65, 'Jessica', 'Garcia', '6789012345', 1232),
(76, 'Christopher', 'Martinez', '7890123456', 423543),
(87, 'Amanda', 'Davis', '8901234567', 1234),
(98, 'William', 'Taylor', '9012345678', 53256),
(100, 'Emily', 'Wilson', '0123456789', 2143234),
(111, 'Daniel', 'Anderson', '2345678902', 123254),
(122, 'Olivia', 'Gonzalez', '3456789011', 45623),
(133, 'Matthew', 'Hernandez', '4567890123', 2313456),
(144, 'Samantha', 'Lopez', '5678901235', 123214),
(155, 'Andrew', 'Martin', '6789012346', 6542);




