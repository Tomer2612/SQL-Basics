use [Final Exercise]

--A
select ht.HouseTypeId, ht.HouseType, c.DesiredPrice, s.SalePrice, sum(s.SalePrice - c.DesiredPrice) as 'Profit'
from Customer c
join Sale s on c.CustomerId = s.CustomerId
join Houses h on s.HousesId = h.HousesId
join HouseType ht on h.HouseTypeId = ht.HouseTypeId
group by ht.HouseTypeId, ht.HouseType, c.DesiredPrice, s.SalePrice
order by 'Profit' desc

--B
select *
from Customer c
join Sale s on c.CustomerId = s.CustomerId
where c.DesiredPrice > s.SalePrice
order by s.SalePrice desc

--C
select n.NeighborhoodName, c.CityName, s.SalePrice, avg(s.SalePrice) as 'Avarage Sale Price'
from City c
join Neighborhood n on c.CityId = n.CityId
join Houses h on n.NeighborhoodId = h.NeighborhoodId
join Sale s on h.HousesId = s.HousesId
group by n.NeighborhoodName, c.CityName, s.SalePrice
order by s.SalePrice desc

--D
select top 1 s.SalePrice, sm.FirstName, sm.LastName
from SalesMan sm
join Sale s on sm.SalesManId = s.SalesManId

--E
select cc.CityName, s.SalePrice, h.Rooms
from Customer c 
join Sale s on c.CustomerId = s.CustomerId
join Houses h on s.HousesId = h.HousesId
join Neighborhood n on h.NeighborhoodId = n.NeighborhoodId
join City cc on n.CityId = cc.CityId
where h.Rooms >= 5
