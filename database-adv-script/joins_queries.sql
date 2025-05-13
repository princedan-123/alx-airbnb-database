-- Objective: Master SQL joins by writing complex queries using different types of joins.

-- Write a query using an INNER JOIN
-- to retrieve all bookings and the respective users who made those bookings.
SELECT * FROM User INNER JOIN Booking ON User.user_id =  Booking.user_id;

-- Left join
SELECT * FROM Booking LEFT JOIN User ON User.user_id =  Booking.user_id;
-- full outer join
-- MYSQL Does not natively support full outer join without union
SELECT * FROM User LEFT JOIN Booking ON User.user_id = Booking.user_id 
UNION 
SELECT * FROM User RIGHT JOIN Booking ON User.user_id = Booking.user_id;