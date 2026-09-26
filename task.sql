-- Use our database
USE ShopDB;

START TRANSACTION;

INSERT INTO Orders (CustomerID, Date)
VALUES (1, CURDATE());

INSERT INTO OrderItems (OrderID, ProductID, Count)
VALUES (1, 1, 1);

UPDATE Products
JOIN OrderItems
ON Products.ID = OrderItems.ProductID
SET Products.WarehouseAmount = Products.WarehouseAmount - OrderItems.Count
WHERE Products.ID = 1 AND OrderItems.OrderID = 1;

COMMIT;