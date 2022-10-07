SELECT RegionDescription, FirstName, LastName, MAX(BirthDate)
FROM Employee , EmployeeTerritory , Region , Territory
WHERE TerritoryId = Territory.Id AND EmployeeId = Employee.Id AND RegionId = Region.Id
GROUP BY RegionDescription
ORDER BY Region.Id;