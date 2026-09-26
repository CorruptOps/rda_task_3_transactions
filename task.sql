-- Use our database
USE ShopDB; 


START TRANSACTION; 

insert into Orders (CustomerID, Date)
values(1, CURDATE());

insert into OrderItems (OrderID, ProductID, Count)
values(1, 1, 1);

update Products
join OrderItems
on Products.ID = OrderItems.ProductID
set Products.WarehouseAmount = Products.WarehouseAmount - OrderItems.Count
where Products.ID = 1 and OrderItems.OrderID = 1;

COMMIT; 