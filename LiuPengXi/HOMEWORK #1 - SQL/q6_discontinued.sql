SELECT ProductName, CompanyName, ContactName
FROM (
      SELECT ProductName, min(OrderDate), CompanyName, ContactName
      FROM (
            SELECT Product.Id , ProductName , OrderDate, CompanyName, ContactName
            FROM Product , Customer ,"Order" ,  OrderDetail
            WHERE Discontinued = 1 AND "Order".CustomerId = Customer.Id 
            AND OrderDetail.OrderId = "Order".Id AND OrderDetail.ProductId = Product.Id
           )
			GROUP BY ProductName
			)
ORDER BY ProductName ASC;