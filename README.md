# 🚕 NYC Yellow Taxi Trip Data — SQL Analysis

SQL queries for exploring and analyzing the NYC Yellow Taxi trip dataset for **February 2023**, sourced from the [NYC Taxi & Limousine Commission (TLC)](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page).

---

## 📁 Repository Structure

```
├── yellow_tripdata_2023-02.csv   # Raw trip data (2,913,955 records)
├── updated_nyc_taxi_queries.sql  # 15 SQL analysis queries
└── README.md
```

---

## 📦 Dataset Overview

| Property | Details |
|---|---|
| File | `yellow_tripdata_2023-02.csv` |
| Period | February 2023 |
| Total Records | 2,913,955 trips |
| Columns | 19 |
| Source | NYC TLC Trip Record Data |

### Column Reference

| Column | Description |
|---|---|
| `VendorID` | Provider: 1 = Creative Mobile Technologies, 2 = VeriFone Inc. |
| `tpep_pickup_datetime` | Date and time the meter was engaged (trip start) |
| `tpep_dropoff_datetime` | Date and time the meter was disengaged (trip end) |
| `passenger_count` | Number of passengers (driver-entered) |
| `trip_distance` | Trip distance in miles reported by the taximeter |
| `RatecodeID` | 1=Standard, 2=JFK, 3=Newark, 4=Nassau/Westchester, 5=Negotiated, 6=Group ride |
| `store_and_fwd_flag` | Y = record held in vehicle memory before sending; N = sent immediately |
| `PULocationID` | TLC Taxi Zone where the meter was engaged |
| `DOLocationID` | TLC Taxi Zone where the meter was disengaged |
| `payment_type` | 1=Credit card, 2=Cash, 3=No charge, 4=Dispute, 5=Unknown, 6=Voided |
| `fare_amount` | Time-and-distance fare calculated by the meter |
| `extra` | Miscellaneous surcharges (e.g. $0.50 rush hour, $1.00 overnight) |
| `mta_tax` | $0.50 MTA tax triggered by the metered rate |
| `tip_amount` | Tip — auto-populated for credit card payments only |
| `tolls_amount` | Total tolls paid during the trip |
| `improvement_surcharge` | $0.30 surcharge assessed at flag drop |
| `total_amount` | Total charged to the passenger (excludes cash tips) |
| `congestion_surcharge` | Applied for trips in/through Manhattan south of 96th St |
| `Airport_fee` | $1.25 pickup fee at LaGuardia and JFK airports |

---

## 🔍 Queries

### 1. View First 10 Records
Preview raw data to inspect column values and data quality.
```sql
SELECT * FROM yellow_tripdata LIMIT 10;
```

---

### 2. Count Total Number of Trips
Returns the total number of trip records in the dataset.
```sql
SELECT COUNT(*) AS total_trips FROM yellow_tripdata;
```

---

### 3. Calculate Total Revenue Generated
Sums all `total_amount` values across all trips.
```sql
SELECT SUM(total_amount) AS total_revenue FROM yellow_tripdata;
```

---

### 4. Find Average Trip Distance
Computes the mean trip distance in miles.
```sql
SELECT AVG(trip_distance) AS average_trip_distance FROM yellow_tripdata;
```
> **Tip:** Filter `WHERE trip_distance > 0` to exclude zero-distance anomalies.

---

### 5. Display Top 10 Longest Trips
Lists the 10 trips with the greatest distance traveled.
```sql
SELECT * FROM yellow_tripdata ORDER BY trip_distance DESC LIMIT 10;
```

---

### 6. Analyze Trips by Payment Type
Groups trip counts by payment method.
```sql
SELECT payment_type, COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY payment_type
ORDER BY total_trips DESC;
```
> **Payment codes:** 1=Credit card, 2=Cash, 3=No charge, 4=Dispute, 5=Unknown, 6=Voided

---

### 7. Calculate Average Fare Amount
Returns the mean base meter fare (excluding tips, tolls, and surcharges).
```sql
SELECT AVG(fare_amount) AS average_fare FROM yellow_tripdata;
```

---

### 8. Count Trips by Passenger Count
Shows the distribution of trips by number of passengers.
```sql
SELECT passenger_count, COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY passenger_count
ORDER BY passenger_count;
```

---

### 9. Identify Top Pickup Locations
Finds the 10 most frequently used TLC pickup zone IDs.
```sql
SELECT PULocationID, COUNT(*) AS pickup_count
FROM yellow_tripdata
GROUP BY PULocationID
ORDER BY pickup_count DESC
LIMIT 10;
```
> **Tip:** Cross-reference with the [TLC Taxi Zone Lookup Table](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) to get human-readable zone names.

---

### 10. Daily Trip Analysis
Aggregates trip counts by calendar date to identify daily trends.
```sql
SELECT DATE(tpep_pickup_datetime) AS trip_date, COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY DATE(tpep_pickup_datetime)
ORDER BY trip_date;
```

---

### 11. Find Trips with Highest Tips
Returns the 10 trips with the largest tip amounts.
```sql
SELECT * FROM yellow_tripdata ORDER BY tip_amount DESC LIMIT 10;
```
> **Note:** `tip_amount` is only populated for credit card payments (type 1). Cash tips are not captured.

---

### 12. Analyze Trips by Pickup Hour
Counts trips by hour of the day (0–23) to identify peak demand periods.
```sql
SELECT EXTRACT(HOUR FROM tpep_pickup_datetime) AS pickup_hour, COUNT(*) AS total_trips
FROM yellow_tripdata
GROUP BY pickup_hour
ORDER BY pickup_hour;
```

---

### 13. Average Total Amount by Payment Type
Compares average total charge across payment methods.
```sql
SELECT payment_type, AVG(total_amount) AS average_total
FROM yellow_tripdata
GROUP BY payment_type
ORDER BY average_total DESC;
```

---

### 14. Find Trips with Fare Amount Greater Than $100
Filters for high-fare trips to identify long-distance rides or anomalies.
```sql
SELECT * FROM yellow_tripdata WHERE fare_amount > 100;
```

---

### 15. Identify Top Drop-off Locations
Finds the 10 most common TLC drop-off zone IDs.
```sql
SELECT DOLocationID, COUNT(*) AS total_dropoffs
FROM yellow_tripdata
GROUP BY DOLocationID
ORDER BY total_dropoffs DESC
LIMIT 10;
```

---

## ✅ Prerequisites

- A SQL-compatible database: **PostgreSQL**, **MySQL**, **BigQuery**, **DuckDB**, or similar
- The `yellow_tripdata` table loaded with TLC trip record data
- Optional: [TLC Taxi Zone Lookup Table](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page) to resolve zone IDs to borough/zone names

## 🚀 Usage

```bash
# Run all queries with psql
psql -d your_database -f updated_nyc_taxi_queries.sql

# Or run a single query
psql -d your_database -c "SELECT COUNT(*) FROM yellow_tripdata;"
```

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
