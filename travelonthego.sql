Create Database if not exists `TravelOnTheGo` ;
use `TravelOnTheGo`;

-- 1) You are required to create two tables PASSENGER and PRICE with the following attributes and properties 
create table if not exists `PASSENGER`(`Passenger_name` varchar(50),
 `Category` varchar(50),
 `Gender` varchar(50),
 `Boarding_City` varchar(50),
 `Destination_City` varchar(50),
 `Distance` int,
 `Bus_Type` varchar(50)
);

CREATE TABLE IF NOT EXISTS `PRICE` (
  `Bus_Type` VARCHAR(20),
  `Distance` INT,
  `Price` INT
  );
  
  
 --  2) Insert the following data in the tables
insert into `PASSENGER` values("Sejal", "AC", "F", "Bengaluru", "Chennai", 350, "Sleeper");
insert into `PASSENGER` values("Anmol", "Non-AC", "M", "Mumbai", "Hyderabad", 700, "Sitting");
insert into `PASSENGER` values("Pallavi", "AC", "F", "Panaji", "Bengaluru", 600, "Sleeper");
insert into `PASSENGER` values("Khusboo", "AC", "F", "Chennai", "Mumbai", 1500, "Sleeper");
insert into `PASSENGER` values("Udit", "Non-AC" ,"M" ,"Trivandrum" ,"panaji" ,1000, "Sleeper");
insert into `PASSENGER` values("Ankur", "AC", "M", "Nagpur", "Hyderabad" ,500, "Sitting");
insert into `PASSENGER` values("Hemant", "Non-AC", "M", "panaji", "Mumbai", 700, "Sleeper");
insert into `PASSENGER` values("Manish", "Non-AC", "M", "Hyderabad", "Bengaluru", 500, "Sitting");
insert into `PASSENGER` values("Piyush", "AC", "M", "Pune", "Nagpur", 700, "Sitting");

insert into `PRICE` values("Sleeper",350, 770);
insert into `PRICE` values("Sleeper",500, 1100);
insert into `PRICE` values("Sleeper",600,1320);
insert into `PRICE` values("Sleeper",700,1540);
insert into `PRICE` values("Sleeper",1000,2200);
insert into `PRICE` values("Sleeper",1200,2640);
insert into `PRICE` values("Sleeper",350,434);
insert into `PRICE` values("Sitting",500, 620);
insert into `PRICE` values("Sitting",500, 620);
insert into `PRICE` values("Sitting", 600, 744);
insert into `PRICE` values("Sitting",700, 868);
insert into `PRICE` values("Sitting",1000, 1240);
insert into `PRICE` values("Sitting",1200, 1488);
insert into `PRICE` values("Sitting", 1500, 1860);

-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s? 
SELECT gender,COUNT( gender ) AS `total` 
FROM   `passenger` 
WHERE   distance<=600 
GROUP BY  `gender`;

-- 4) Find the minimum ticket price for Sleeper Bus. 
SELECT bus_type,min(price) as price FROM travelonthego.price
 where Bus_Type="sleeper";
 
 -- 5) Select passenger names whose names start with character 'S' 
 SELECT * FROM travelonthego.passenger
 where Passenger_name like "s%";
 
 
 -- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
SELECT passenger.Passenger_name, passenger.Boarding_City, passenger.Destination_City, `price`.Bus_Type , `price`.Price
FROM passenger
left JOIN `price` ON passenger.Distance = `price`.Distance;

-- 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KM s 
SELECT passenger.Passenger_name , `price`.Price, `price`.Bus_Type
FROM passenger
left JOIN `price` ON passenger.Distance = `price`.Distance
where  `price`.Distance=1000 and `price`.Bus_Type="sitting";


-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
SELECT passenger.Passenger_name , `price`.Price, `price`.Bus_Type
FROM passenger
left JOIN `price` ON passenger.Distance = `price`.Distance
where  passenger.Passenger_name="Pallavi";


-- 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order
SELECT DISTINCT Distance
FROM passenger
order by Distance desc;


-- 10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables 
SELECT Passenger_name, Distance * 100.0 / (select sum(Distance) from passenger) as percentage FROM passenger;


-- 11) Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise
call category();
