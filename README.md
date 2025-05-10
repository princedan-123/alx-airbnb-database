# AirBnB Database Schema

This repository contains the SQL schema for the **AirBnB** application. It includes tables and relationships necessary to manage users, properties, bookings, payments, reviews, and messages within the platform.

## Database Overview

The schema defines the following entities and their relationships:

- **User**: Represents individuals who use the platform, including guests, hosts, and admins.
- **Property**: Represents the properties listed by hosts.
- **Booking**: Represents a reservation made by a user for a specific property.
- **Payment**: Represents a payment made for a booking.
- **Review**: Represents user reviews for properties.
- **Message**: Represents messages exchanged between users (hosts/guests).

## Tables and Their Fields

### 1. **User Table**
Stores user information such as name, email, role, and more.

```sql
CREATE TABLE User (
    user_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX user_id(user_id)
);
```

- `user_id`: Unique identifier for each user (UUID).
- `first_name`: First name of the user.
- `last_name`: Last name of the user.
- `email`: Unique email address.
- `password_hash`: Hashed password.
- `phone_number`: Optional phone number.
- `role`: User role (guest, host, admin).
- `created_at`: Timestamp when the user was created.

### 2. **Property Table**
Stores information about properties listed by hosts.

```sql
CREATE TABLE Property (
    property_id CHAR(36) Primary Key DEFAULT (UUID()),
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
```

- `property_id`: Unique identifier for each property (UUID).
- `host_id`: Foreign key linking to the user who owns the property.
- `name`: Name of the property.
- `description`: Detailed description of the property.
- `location`: Location of the property.
- `pricepernight`: Price per night for booking the property.
- `created_at`: Timestamp when the property was created.
- `updated_at`: Timestamp when the property was last updated.

### 3. **Booking Table**
Stores information about bookings made by users for properties.

```sql
CREATE TABLE Booking (
    booking_id CHAR(36) Primary Key DEFAULT (UUID()),
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
```

- `booking_id`: Unique identifier for each booking (UUID).
- `property_id`: Foreign key linking to the booked property.
- `user_id`: Foreign key linking to the user who made the booking.
- `start_date`: The start date of the booking.
- `end_date`: The end date of the booking.
- `total_price`: Total price for the booking.
- `status`: Status of the booking (pending, confirmed, or canceled).
- `created_at`: Timestamp when the booking was created.

### 4. **Payment Table**
Stores payment information for bookings.

```sql
CREATE TABLE Payment (
    payment_id CHAR(36) Primary Key DEFAULT(UUID()),
    booking_id CHAR(36),
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
    FOREIGN KEY(booking_id) REFERENCES Booking(booking_id),
    INDEX payment_id(payment_id)
);
```

- `payment_id`: Unique identifier for each payment (UUID).
- `booking_id`: Foreign key linking to the related booking.
- `amount`: Amount paid for the booking.
- `payment_date`: Timestamp when the payment was made.
- `payment_method`: Payment method used (credit_card, paypal, or stripe).

### 5. **Review Table**
Stores reviews made by users on properties.

```sql
CREATE TABLE Review (
    review_id CHAR(36) Primary Key DEFAULT(UUID()),
    property_id CHAR(36),
    user_id CHAR(36),
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX review_id(review_id),
    FOREIGN KEY(property_id) REFERENCES Property(property_id),
    FOREIGN KEY(user_id) REFERENCES User(user_id)
);
```

- `review_id`: Unique identifier for each review (UUID).
- `property_id`: Foreign key linking to the property being reviewed.
- `user_id`: Foreign key linking to the user who left the review.
- `rating`: Rating given to the property (1 to 5).
- `comment`: Textual comment provided by the user.
- `created_at`: Timestamp when the review was created.

### 6. **Message Table**
Stores messages exchanged between users (hosts and guests).

```sql
CREATE TABLE Message (
    message_id CHAR(36) Primary Key DEFAULT(UUID()),
    sender_id CHAR(36),
    recipient_id CHAR(36),
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX message_id(message_id),
    FOREIGN KEY (sender_id) REFERENCES User(user_id),
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
);
```

- `message_id`: Unique identifier for each message (UUID).
- `sender_id`: Foreign key linking to the sender of the message.
- `recipient_id`: Foreign key linking to the recipient of the message.
- `message_body`: Content of the message.
- `sent_at`: Timestamp when the message was sent.

## How to Use

1. **Set up your MySQL Database**: Make sure you have MySQL installed and running.
   
2. **Create Database and Tables**: Run the `schema.sql` script using the following command:

    ```bash
    mysql -u <username> -p <schema.sql>
    ```

3. **Modify the Schema**: Adjust the schema as needed to fit the specific requirements of your application.

4. **Interact with the Database**: Use your MySQL client to interact with the database, insert data, or run queries based on the schema provided.

## Conclusion

This schema provides a foundation for the AirBnB-like application. It handles basic user information, property listings, bookings, payments, reviews, and messaging between users. You can extend the schema by adding more features like support for promotions, availability calendars, etc.