-- Objective: Master SQL joins by writing complex queries using different types of joins.

-- Write a query using an INNER JOIN
-- to retrieve all bookings and the respective users who made those bookings.
SELECT first_name, last_name, role, b.booking_id, b.property_id, b.user_id, b.start_date, b.end_date, b.status, b.total_price FROM users AS u INNER JOIN booking AS b ON u.user_id =  b.user_id ORDER BY  u.first_name;

-- Left join
SELECT * FROM Booking LEFT JOIN User ON User.user_id =  Booking.user_id;
-- full outer join
-- MYSQL Does not natively support full outer join without union
SELECT * FROM User LEFT JOIN Booking ON User.user_id = Booking.user_id 
UNION 
SELECT * FROM User RIGHT JOIN Booking ON User.user_id = Booking.user_id;