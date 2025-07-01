use hotel_management;
-- 1. Scalar Subquery in SELECT
SELECT 
  Name,
  (SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID) AS total_orders
FROM Customers;
-- 2. Subquery in WHERE with IN
SELECT Name
FROM Customers
WHERE CustomerID IN(
	SELECT CustomerID FROM Orders WHERE Product = 'Laptop'
    );
    
-- 3. Subquery with EXISTS
    SELECT Name
    FROM Customers c
    WHERE EXISTS (
		SELECT 1 FROM Orders o WHERE o.CustomerID = c.CustomerID
        );
        
-- 4. Correlated Subquery in WHERE
SELECT name
FROM Customers c
WHERE EXISTS (
	SELECT 1 FROM Orders o
    WHERE o.CustomerID = c.CustomerID AND O.Product = 'Mouse' );
    

