SELECT CompanyName, ROUND(latenum * 100.0/ totalnum, 2) AS Precentage
FROM 
(
  SELECT ShipVia, COUNT(*) AS totalnum 
  FROM 'Order', Shipper
	WHERE 'Order'.ShipVia = Shipper.Id
  GROUP BY ShipVia
) AS total,
(
  SELECT ShipVia, COUNT(*) AS latenum 
  FROM 'Order', Shipper
  WHERE ShippedDate > RequiredDate AND 'Order'.ShipVia = Shipper.Id
  GROUP BY ShipVia
) AS late , Shipper
WHERE total.ShipVia = late.ShipVia AND total.ShipVia = Shipper.Id
ORDER BY Precentage DESC;