-- Write SQL CREATE INDEX commands to create appropriate indexes for columns
-- and save them on database_index.sql
CREATE INDEX first_name_last_name_idx ON User(first_name, last_name);
CREATE INDEX total_price_idx ON Booking(total_price);
CREATE INDEX location_idx ON Property(location);
CREATE INDEX pricepernight_idx ON Property(pricepernight);