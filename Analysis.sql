SELECT YEAR(registration_date) AS Year,
       type,
       COUNT(vehicle_id) AS NumberOfVehicles
FROM vehicles
GROUP BY YEAR(registration_date), type
ORDER BY YEAR(registration_date), type;


SELECT manufacturer,
       type,
       COUNT(vehicle_id) AS TotalVehicles
FROM vehicles
GROUP BY manufacturer, type
ORDER BY TotalVehicles DESC;


SELECT manufacturer,
       type,
       tax_exempt_status,
       COUNT(vehicle_id) AS Count
FROM vehicles
WHERE tax_exempt_status = TRUE
GROUP BY manufacturer, type, tax_exempt_status
ORDER BY Count DESC;
