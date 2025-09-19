select * from customer;
select * from customeraddress;
select * from delivery;
select * from deliveryagent;
select * from loginaudit;
select * from menu;
select * from ORDERS;
select * from restaurant;

SELECT * FROM Orders
WHERE TotalAmount > 1000;

-- Location wise sales and orders
SELECT 
    r.Location AS RestaurantLocation,
    COUNT(o.OrderID) AS TotalOrders,
    round(sum(o.TotalAmount),0) AS TotalRevenue
FROM Orders o
JOIN Restaurant r ON o.RestaurantID = r.RestaurantID
GROUP BY r.Location
ORDER BY TotalOrders DESC;

-- category wise totalorders
SELECT 
    m.Category,
    COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Restaurant r ON o.RestaurantID = r.RestaurantID
JOIN Menu m ON r.RestaurantID = m.RestaurantID
GROUP BY m.Category
ORDER BY TotalOrders DESC;





-- membership wise order and revenue  
SELECT 
    c.Membershipstatus,
    COUNT(o.OrderID) AS TotalOrders,
    round(SUM(o.TotalAmount),0) AS TotalRevenue
FROM Orders o
JOIN Customer c ON o.CustomerID = c.CustomerID
GROUP BY c.Membershipstatus
ORDER BY TotalRevenue DESC;

-- Top 5 Resturant wise sales
SELECT 
    r.Name AS RestaurantName,
    round(SUM(o.TotalAmount),0) AS TotalRevenue
FROM Orders o
JOIN Restaurant r ON o.RestaurantID = r.RestaurantID
GROUP BY r.RestaurantID, r.Name, r.Location
ORDER BY TotalRevenue DESC
LIMIT 5;


--  Top 5 most ordered menu items
SELECT 
    m.ItemName,
    COUNT(o.OrderID) AS OrderCount
FROM Orders o
JOIN Menu m ON o.RestaurantID = m.RestaurantID
GROUP BY m.ItemName
ORDER BY OrderCount DESC
LIMIT 5;