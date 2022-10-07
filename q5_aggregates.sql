SELECT CategoryName ,
COUNT(*) AS Number ,
ROUND(AVG(Product.UnitPrice), 2) AS AverageUnitPrice,
MIN(Product.UnitPrice) AS MinimumUnitPrice,
MAX(Product.UnitPrice) AS MaximumUnitPrice,
SUM(Product.UnitsOnOrder) AS TotalUnitsOnOrder 
FROM Category , Product
WHERE Product.CategoryId = Category.Id
GROUP BY CategoryName
HAVING Number > 10
ORDER BY Category.Id ASC;