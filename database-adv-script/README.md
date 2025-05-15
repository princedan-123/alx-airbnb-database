# SQL Joins and Aggregation Practice

## 📌 Objective

This SQL script is designed to help you **master SQL joins** and **aggregation functions** by writing and executing queries involving:

- `INNER JOIN`
- `LEFT JOIN`
- Simulated `FULL OUTER JOIN` (MySQL workaround using `UNION`)
- `COUNT()` with `GROUP BY` for data aggregation

---

## 🧠 What You'll Learn

- How to join tables to retrieve related data
- The differences between inner, left, and full joins
- How to count grouped records using aggregate functions
- How to simulate a `FULL OUTER JOIN` in MySQL

---

## 🗂️ Tables Used

### 🧑 User
- `user_id` (Primary Key)
- `first_name`
- Other unspecified user details

### 📘 Booking
- `booking_id` (Primary Key assumed)
- `user_id` (Foreign Key referencing `User.user_id`)
- Other unspecified booking details

---

## 📄 SQL Script Overview

```sql
-- Retrieve all bookings and the users who made those bookings
SELECT * FROM User 
INNER JOIN Booking ON User.user_id = Booking.user_id;

-- Retrieve all bookings, including those without a matching user
SELECT * FROM Booking 
LEFT JOIN User ON User.user_id = Booking.user_id;

-- Simulate a full outer join (MySQL doesn't support it directly)
SELECT * FROM User 
LEFT JOIN Booking ON User.user_id = Booking.user_id
UNION
SELECT * FROM User 
RIGHT JOIN Booking ON User.user_id = Booking.user_id;

-- Find total number of bookings made by each user
SELECT User.first_name, COUNT(*) AS total_booking 
FROM User 
INNER JOIN Booking ON User.user_id = Booking.user_id 
GROUP BY Booking.user_id;
