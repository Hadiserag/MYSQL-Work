-- Script 1: EV Population Growth Over Time
SELECT YEAR(registration_date) AS Year,
       type,
       COUNT(vehicle_id) AS NumberOfVehicles
FROM vehicles
GROUP BY YEAR(registration_date), type
ORDER BY YEAR(registration_date), type;

-- Script 2: Dominance Analysis by Manufacturer
SELECT manufacturer,
       type,
       COUNT(vehicle_id) AS TotalVehicles
FROM vehicles
GROUP BY manufacturer, type
ORDER BY TotalVehicles DESC;

-- Script 3: Clean Alternative Fuel Vehicle Program Eligibility
SELECT manufacturer,
       type,
       tax_exempt_status,
       COUNT(vehicle_id) AS Count
FROM vehicles
WHERE tax_exempt_status = TRUE
GROUP BY manufacturer, type, tax_exempt_status
ORDER BY Count DESC;

-- Script 4: Geographic Distribution of EVs
SELECT city,
       COUNT(vehicle_id) AS TotalVehicles
FROM vehicles
GROUP BY city
ORDER BY TotalVehicles DESC;

-- Script 5: EVs Registration by Model Year
SELECT model_year,
       COUNT(vehicle_id) AS NumberOfVehicles
FROM vehicles
GROUP BY model_year
ORDER BY model_year DESC;

-- Script 6: Most Popular EV Models
SELECT model,
       COUNT(vehicle_id) AS TotalVehicles
FROM vehicles
GROUP BY model
ORDER BY TotalVehicles DESC
LIMIT 10;

-- Script 7: Analysis of Vehicle Types Over Time
SELECT YEAR(registration_date) AS Year,
       type,
       COUNT(vehicle_id) AS NumberOfVehicles
FROM vehicles
GROUP BY YEAR(registration_date), type
ORDER BY YEAR(registration_date), type;

-- Script 8: Electric Vehicle Type Distribution
SELECT `Electric Vehicle Type`, COUNT(*) AS TotalVehicles
FROM vehicles
GROUP BY `Electric Vehicle Type`;

-- Script 9: Electric Range Analysis
SELECT `Electric Vehicle Type`, AVG(`Electric Range`) AS AverageRange
FROM vehicles
GROUP BY `Electric Vehicle Type`;

-- Script 10: Most Popular Makes by Electric Vehicle Type
SELECT `Make`, `Electric Vehicle Type`, COUNT(*) AS Total
FROM vehicles
GROUP BY `Make`, `Electric Vehicle Type`
ORDER BY `Electric Vehicle Type`, Total DESC
LIMIT 10;

-- Script 11: Registration Analysis by County
SELECT `County`, COUNT(*) AS TotalRegistrations
FROM vehicles
GROUP BY `County`
ORDER BY TotalRegistrations DESC;

-- Script 12: CAFV Eligibility Analysis
SELECT `Clean Alternative Fuel Vehicle (CAFV) Eligibility`, COUNT(*) AS NumberOfVehicles
FROM vehicles
GROUP BY `Clean Alternative Fuel Vehicle (CAFV) Eligibility`;
