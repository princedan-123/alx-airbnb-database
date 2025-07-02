-- Write SQL CREATE INDEX commands to create appropriate indexes for columns
-- and save them on database_index.sql
EXPLAIN ANALYZE CREATE INDEX first_name_last_name_idx ON User(first_name, last_name);
EXPLAIN ANALYZE CREATE INDEX total_price_idx ON Booking(total_price);
EXPLAIN ANALYZE CREATE INDEX location_idx ON Property(location);
EXPLAIN ANALYZE CREATE INDEX pricepernight_idx ON Property(pricepernight);