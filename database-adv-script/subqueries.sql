-- Objective: Write both correlated and non-correlated subqueries.
-- Write a query to find all properties
-- where the average rating is greater than 4.0 using a subquery.
SELECT property_id, name FROM Property WHERE property_id IN(SELECT property_id FROM Review  GROUP BY property_id HAVING AVG(rating));

-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT user_id FROM User u WHERE (SELECT COUNT(*) FROM Booking b WHERE u.user_id = b.user_id) > 3;