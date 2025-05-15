## Objective: Identify and create indexes to improve query performance
## Instructions:

### Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).
**Answer**
- High usage columns in User table include user_id, email, first_name and last_name
- High usage columns in Booking table include booking_id, property_id, user_id and total_price
- High usage columns in Property column are host_id, property_id, location, pricepernight, name

### Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql
**Answer**
#### User table ####
- user_id and email are already indexes (in MySQL PRIMARY KEYS and UNIQUE constraints are automatic indexes)
- ` CREATE INDEX first_name_last_name_idx ON User(first_name, last_name)`
#### Booking table ####
- `CREATE INDEX total_price_idx ON Booking(total_price)`
- booking_id is a PRIMARY KEY, hence it is already indexed
### Property table ####
- `CREATE INDEX location_idx ON Property(location)`
- `CREATE INDEX pricepernight_idx ON Property(pricepernight)`
- property_id is already indexed as it is a PRIMARY KEY
Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.