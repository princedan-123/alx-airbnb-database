-- Write a query to find the total number of bookings
-- made by each user, using the COUNT function and GROUP BY clause.

SELECT User.first_name, count(*) as total_booking FROM User INNER JOIN Booking ON User.user_id = Booking.user_id Group By Booking.user_id;