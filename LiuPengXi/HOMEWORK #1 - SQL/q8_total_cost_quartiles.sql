SELECT * , NTILE(4) OVER (ORDER BY Total ASC) AS BottomQuartile
FROM(SELECT IFNULL(Customer.CompanyName, 'MISSING_NAME') AS CompanyName, Customer.Id, 
ROUND(SUM(OrderDetail.UnitPrice * OrderDetail.Quantity),2) AS Total
FROM Customer ,"Order" , OrderDetail
WHERE ("Order".CustomerId = Customer.Id AND OrderDetail.OrderId = "Order".Id) 
GROUP BY Customer.Id)
WHERE BottomQuartile = 1
ORDER BY Total ASC;
