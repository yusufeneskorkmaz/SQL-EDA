USE yek;

# Whole table
SELECT * FROM yek.ev_cars;

# Distinct car names
SELECT DISTINCT car_name
FROM ev_cars;

# Average battery capacity
SELECT avg(battery) as avg_battery_capacity
FROM ev_cars;

# Maximum and minimum range of cars
ALTER TABLE ev_cars
RENAME COLUMN `Range` TO `Car_Range`; 

SELECT max(Car_range) as max_range, min(Car_range) as min_range
FROM ev_cars;

# Fastest car
SELECT Car_name, Top_speed
FROM ev_cars
ORDER BY Top_speed DESC
LIMIT 1;

# Decreasing by battery capacity
ALTER TABLE ev_cars
RENAME COLUMN `Price.DE.` TO `Prices`; 

SELECT Car_name, Prices, Battery
FROM ev_cars
ORDER BY Battery DESC;

# Car with highest battery capacity
SELECT Car_name, Battery
FROM ev_cars
WHERE Battery= (SELECT max(Battery) FROM ev_cars);

# Car with lowest battery capacity
SELECT Car_name, Battery
FROM ev_cars
WHERE Battery= (SELECT min(Battery) FROM ev_cars);

# Comparison by battery
SELECT Car_name, Battery
FROM ev_cars
WHERE Car_name IN ('Tesla Model Y Long Range Dual Motor', 'Tesla Model 3');

# decreasing by efficiency
SELECT Car_name, Battery, Efficiency 
FROM ev_cars
ORDER BY Efficiency DESC;

# The most efficient car
SELECT Car_name, Battery, Efficiency 
FROM ev_cars
WHERE Efficiency= (SELECT max(Efficiency) FROM ev_cars);

# Comparison by efficiency
SELECT Car_name, Battery, Efficiency 
FROM ev_cars
WHERE Car_name IN ('Tesla Model Y Long Range Dual Motor' , 'BYD ATTO 3');

# Sorting by fast charging values
 SELECT Car_name, Battery, Prices, Efficiency, Fast_charge
 FROM ev_cars
 ORDER BY Fast_charge DESC;
 
 # Highest fast charging
SELECT Car_name, Battery, Prices, Efficiency, Fast_charge
FROM ev_cars 
WHERE Fast_charge= (SELECT max(Fast_charge) FROM ev_cars); 

# Comparison by fast charging
SELECT Car_name, Battery, Prices, Efficiency, Fast_charge
FROM ev_cars 
WHERE Car_name IN ('Tesla Model Y Long Range Dual Motor', 'BYD ATTO 3');

# PRICE ANALYSIS

# Decreasing by price
SELECT *
FROM ev_cars
ORDER BY Prices DESC;

# Most expensive car
SELECT Car_name, Prices
FROM ev_cars
WHERE Prices= (SELECT max(Prices) FROM ev_cars);

# Cheapest car
SELECT Car_name, Prices
FROM ev_cars
WHERE Prices= (SELECT min(Prices) FROM ev_cars);

# Average price
SELECT avg(Prices) as avg_price
FROM ev_cars;

# Sorting by acceleration (0-100km/h)
ALTER TABLE ev_cars
RENAME COLUMN `acceleration..0.100.` TO `Acceleration`; 

SELECT Car_name, Acceleration 
FROM ev_cars
ORDER BY Acceleration ASC;

# Number of cars by brand
SELECT
  CASE WHEN INSTR(Car_name, ' ') > 0 THEN SUBSTR(Car_name, 1, INSTR(Car_name, ' ') - 1) ELSE Car_name END AS Brand,
  COUNT(*) AS count
FROM ev_cars
GROUP BY Brand
ORDER BY count DESC; 

# Average range by brand
SELECT
  CASE 
   WHEN INSTR(Car_name, ' ') > 0 
   THEN SUBSTR(Car_name, 1, INSTR(Car_name, ' ') - 1) 
   ELSE Car_name END AS Brand,
  avg(Car_range) AS avg_range
 FROM ev_cars
 GROUP BY Brand 
 ORDER BY avg_range DESC;
 
 # Average efficiency by brand
 SELECT
  CASE 
   WHEN INSTR(Car_name, ' ') > 0 
   THEN SUBSTR(Car_name, 1, INSTR(Car_name, ' ') - 1) 
   ELSE Car_name END AS Brand,
  avg(Efficiency) AS avg_efficiency
 FROM ev_cars
 GROUP BY Brand 
 ORDER BY avg_efficiency DESC; 
 
 
 SELECT
  CASE 
   WHEN INSTR(Car_name, ' ') > 0 
   THEN SUBSTR(Car_name, 1, INSTR(Car_name, ' ') - 1) 
   ELSE Car_name END AS Brand,
  avg(Prices) AS avg_prices
 FROM ev_cars
 GROUP BY Brand 
 ORDER BY avg_prices DESC; 
 
 SELECT
  Car_name,
  ((Battery + Top_speed) / Prices) * (1 / Acceleration) * Efficiency AS price_performance_ratio
FROM ev_cars
ORDER BY price_performance_ratio DESC;

 
 
 






 
 




