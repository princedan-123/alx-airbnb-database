-- Create database
CREATE DATABASE IF NOT EXISTS AirBnB;
USE AirBnB;
-- Create user table
CREATE TABLE User (
    user_id CHAR(36) PRIMARY KEY DEFAULT (uuid()),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX user_id(user_id)
);
-- Create Property table
CREATE TABLE Property (
    property_id CHAR(36) Primary Key DEFAULT (uuid()),
    host_id CHAR(36),
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    pricepernight DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES User(user_id),
    INDEX property_id(property_id)
);
-- Create Booking table
CREATE TABLE Booking (
    booking_id CHAR(36) Primary Key DEFAULT (uuid()),
    property_id CHAR(36),
    user_id CHAR(36),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(property_id) REFERENCES Property(property_id),
    FOREIGN KEY(user_id) REFERENCES User(user_id),
    INDEX booking_id(booking_id)
);
-- Create Payment table
CREATE TABLE Payment(
    payment_id CHAR(36) Primary Key DEFAULT(uuid()),
    booking_id  CHAR(36),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY(booking_id) REFERENCES Booking(booking_id),
    INDEX payment_id(payment_id)
);
-- Create Review table
CREATE TABLE Review (
    review_id CHAR(36) Primary Key DEFAULT(uuid()),
    property_id CHAR(36),
    user_id CHAR(36),
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5), 
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX review_id(review_id),
    FOREIGN KEY(property_id) REFERENCES Property(property_id),
    FOREIGN KEY(user_id) REFERENCES User(user_id)
);
-- Create Message table
CREATE TABLE Message (
    message_id CHAR(36) Primary Key DEFAULT(uuid()),
    sender_id CHAR(36),
    recipient_id CHAR(36),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX message_id(message_id),
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);