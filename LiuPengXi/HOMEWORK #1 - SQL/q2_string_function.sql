SELECT DISTINCT ShipName, SUBSTR(ShipName, 0, INSTR(ShipName,'-')) AS 'Area' FROM "Order"
WHERE ShipName LIKE '%-%'
ORDER BY ShipName ASC;