-- Objective: Refactor complex queries to improve performance.

-- Instructions:

-- Write an initial query that retrieves all bookings
--along with the user details, property details, and payment details
SELECT *
FROM
User AS u  INNER JOIN Booking AS b ON b.user_id = u.user_id
INNER JOIN Property AS p ON b.property_id = p.property_id
INNER JOIN Payment AS pa ON pa.booking_id = b.booking_id;