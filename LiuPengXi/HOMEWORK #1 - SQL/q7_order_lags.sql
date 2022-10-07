SELECT Id, OrderDate, PreviousOrderDate, ROUND(julianday(OrderDate) - julianday(PreviousOrderDate), 2) AS Difference
FROM (SELECT Id, OrderDate, LAG(OrderDate, 1, OrderDate) OVER (ORDER BY OrderDate ASC) AS PreviousOrderDate
FROM "Order"
WHERE CustomerId = 'BLONP'
ORDER BY OrderDate ASC
LIMIT 10);