SELECT 
    P.Category,
    SUM(OD.Quantity * OD.Price) AS TotalRevenue,
    COUNT(DISTINCT O.UserID) AS UniqueCustomers,
    STRING_AGG(CONCAT(P.ProductName, ': ', ProductSales), ', ') WITHIN GROUP (ORDER BY ProductSales DESC) AS Top3Products
FROM 
    Products AS P
JOIN 
    OrderDetails AS OD ON P.ProductID = OD.ProductID
JOIN 
    Orders AS O ON OD.OrderID = O.OrderID
WHERE 
    O.OrderDate >= DATEADD(month, -1, GETDATE())
GROUP BY 
    P.Category
ORDER BY 
    TotalRevenue DESC;
