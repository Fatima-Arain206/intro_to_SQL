CREATE TRIGGER tr_UpdateInventory
ON Sales.Orders
AFTER INSERT
AS
BEGIN
    UPDATE Inventory.Products
    SET QuantityInStock = QuantityInStock - i.Quantity
    FROM Inventory.Products p
    INNER JOIN inserted i ON p.ProductID = i.ProductID;
END;