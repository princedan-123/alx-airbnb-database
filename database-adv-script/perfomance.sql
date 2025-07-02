-- Objective: Refactor complex queries to improve performance.

-- Instructions:

-- Write an initial query that retrieves all bookings
--along with the user details, property details, and payment details
SELECT *
FROM
users u  INNER JOIN booking AS b ON b.user_id = u.user_id
INNER JOIN property AS p ON b.property_id = p.property_id
INNER JOIN payment AS pa ON pa.booking_id = b.booking_id;