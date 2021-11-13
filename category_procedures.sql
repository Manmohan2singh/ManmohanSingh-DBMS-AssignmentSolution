CREATE DEFINER=`root`@`localhost` PROCEDURE `category`()
BEGIN
select price.distance,price.price,
Case
    when price.price> 1000 then 'Expensive'
    when price.price <1000 and price.price >500 then 'Average'
    Else 'Cheap'
End as price from price;
END
