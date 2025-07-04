-- Create database
DROP DATABASE IF EXISTS AirBnB;
CREATE DATABASE IF NOT EXISTS AirBnB;
USE AirBnB;
-- Create user table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Create Property table
CREATE TABLE property (
    property_id INT AUTO_INCREMENT PRIMARY KEY,
    host_id INT,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES users(user_id)
);
-- Create Booking table
CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    user_id INT,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(property_id) REFERENCES property(property_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);
-- Create Payment table
CREATE TABLE payment(
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY(booking_id) REFERENCES booking(booking_id)
);
-- Create Review table
CREATE TABLE review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    property_id INT,
    user_id INT,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5), 
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(property_id) REFERENCES property(property_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
);
-- Create Message table
CREATE TABLE message (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT,
    recipient_id INT,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(user_id),
    FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);