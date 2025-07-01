-- Write a query to find the total number of bookings
-- made by each user, using the COUNT function and GROUP BY clause.

SELECT user_id, count(*) AS booking_count FROM booking GROUP BY user_id; 