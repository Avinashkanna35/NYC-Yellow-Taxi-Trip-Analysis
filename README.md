# NYC Taxi Data Analysis

## Project Overview
This project analyzes NYC Yellow Taxi Trip data using PostgreSQL, pgAdmin, Python, and SQL queries.  
The dataset was originally in Parquet format and converted into CSV format using Python before importing into PostgreSQL.

---

## Tools & Technologies Used
- PostgreSQL
- pgAdmin
- SQL
- GitHub

---

## Dataset Information
Dataset: NYC Yellow Taxi Trip Data (February 2023)

Source:
https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

Total Records Imported:
2,913,955 rows

---

## Project Workflow

1. Downloaded Parquet dataset
2. Imported CSV into PostgreSQL using pgAdmin
3. Created SQL queries for data analysis
4. Uploaded project files into GitHub

---

## SQL Analysis Performed

- Total number of trips
- Revenue analysis
- Average fare amount
- Trip distance analysis
- Payment type analysis
- Passenger count analysis
- Pickup and drop location analysis
- Highest tip analysis
- Hourly trip analysis

---

## Files Included

- updated_nyc_taxi_queries.sql
- README.md
- Documentation file
- Screenshots

---

## Sample Queries

### Count Total Trips
```sql
SELECT COUNT(*) AS total_trips
FROM yellow_tripdata;
```

### Average Fare Amount
```sql
SELECT AVG(fare_amount) AS average_fare
FROM yellow_tripdata;
```

### Top Pickup Locations
```sql
SELECT PULocationID, COUNT(*) AS pickup_count
FROM yellow_tripdata
GROUP BY PULocationID
ORDER BY pickup_count DESC
LIMIT 10;
```

---

## Conclusion
This project demonstrates the process of handling large datasets using Python and PostgreSQL.  
It also showcases SQL querying and database management skills for real-world data analysis projects.

