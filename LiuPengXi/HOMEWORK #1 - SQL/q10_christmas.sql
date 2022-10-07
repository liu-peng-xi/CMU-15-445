SELECT GROUP_CONCAT(ProductName) AS ProductName
FROM (SELECT ProductName
FROM "Order", Customer , Product ,OrderDetail
WHERE julianday('2014-12-26') - julianday(OrderDate) > 0 AND julianday('2014-12-26') - julianday(OrderDate) < 1
AND CompanyName = 'Queen Cozinha' 
AND "Order".CustomerId = Customer.Id 
AND "Order".Id = OrderDetail.OrderId 
AND OrderDetail.ProductId = Product.Id
ORDER BY Product.Id ASC);