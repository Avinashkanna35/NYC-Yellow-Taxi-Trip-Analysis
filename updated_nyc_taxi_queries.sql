
-- 1. View First 10 Records
SELECT * 
FROM yellow_tripdata
LIMIT 10;

-- 2. Count Total Number of Trips
SELECT COUNT(*) AS total_trips
FROM yellow_tripdata;

-- 3. Calculate Total Revenue Generated
SELECT SUM(total_amount) AS total_revenue
FROM yellow_tripdata;

-- 4. Find Average Trip Distance
SELECT AVG(trip_distance) AS average_trip_distance
FROM yellow_tripdata;

-- 5. Display Top 10 Longest Trips
SELECT *
FROM yellow_tripdata
ORDER BY trip_distance DESC
LIMIT 10;

-- 6. Analyze Trips by Payment Type
SELECT payment_type, COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY payment_type
ORDER BY total_trips DESC;

-- 7. Calculate Average Fare Amount
SELECT AVG(fare_amount) AS average_fare
FROM yellow_tripdata;

-- 8. Count Trips by Passenger Count
SELECT passenger_count, COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY passenger_count
ORDER BY passenger_count;

-- 9. Identify Top Pickup Locations
SELECT PULocationID, COUNT(*) AS pickup_count
FROM yellow_tripdata
GROUP BY PULocationID
ORDER BY pickup_count DESC
LIMIT 10;

-- 10. Daily Trip Analysis
SELECT 
    DATE(tpep_pickup_datetime) AS trip_date,
    COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY DATE(tpep_pickup_datetime)
ORDER BY trip_date;

-- 11. Find Trips with Highest Tips
SELECT *
FROM yellow_tripdata
ORDER BY tip_amount DESC
LIMIT 10;

-- 12. Analyze Trips by Pickup Hour
SELECT 
    EXTRACT(HOUR FROM tpep_pickup_datetime) AS pickup_hour,
    COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY pickup_hour
ORDER BY pickup_hour;

-- 13. Average Total Amount by Payment Type
SELECT 
    payment_type,
    AVG(total_amount) AS average_total
FROM yellow_tripdata
GROUP BY payment_type
ORDER BY average_total DESC;

-- 14. Find Trips with Fare Amount Greater Than 100
SELECT *
FROM yellow_tripdata
WHERE fare_amount > 100;

-- 15. Identify Top Drop Locations
SELECT 
    DOLocationID,
    COUNT(*) AS total_dropoffs
FROM yellow_tripdata
GROUP BY DOLocationID
ORDER BY total_dropoffs DESC
LIMIT 10;
