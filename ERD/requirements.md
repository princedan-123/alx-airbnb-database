## Introduction
This document outlines the Entity-Relationship Diagram (ERD) for the AirBnB-like database as specified. The ERD visualizes the entities, attributes, and relationships necessary to model the system.

## Entities and Attributes

### Entities and Attributes

### User

-   **user_id**: Primary Key, UUID, Indexed
-   **first_name**: VARCHAR, NOT NULL
-   **last_name**: VARCHAR, NOT NULL
-   **email**: VARCHAR, UNIQUE, NOT NULL
-   **password_hash**: VARCHAR, NOT NULL
-   **phone_number**: VARCHAR, NULL
-   **role**: ENUM (`guest`,  `host`,  `admin`), NOT NULL
-   **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Property

-   **property_id**: Primary Key, UUID, Indexed
-   **host_id**: Foreign Key, references  `User(user_id)`
-   **name**: VARCHAR, NOT NULL
-   **description**: TEXT, NOT NULL
-   **location**: VARCHAR, NOT NULL
-   **price_per_night**: DECIMAL, NOT NULL
-   **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
-   **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### Booking

-   **booking_id**: Primary Key, UUID, Indexed
-   **property_id**: Foreign Key, references  `Property(property_id)`
-   **user_id**: Foreign Key, references  `User(user_id)`
-   **start_date**: DATE, NOT NULL
-   **end_date**: DATE, NOT NULL
-   **total_price**: DECIMAL, NOT NULL
-   **status**: ENUM (`pending`,  `confirmed`,  `canceled`), NOT NULL
-   **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Payment

-   **payment_id**: Primary Key, UUID, Indexed
-   **booking_id**: Foreign Key, references  `Booking(booking_id)`
-   **amount**: DECIMAL, NOT NULL
-   **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
-   **payment_method**: ENUM (`credit_card`,  `paypal`,  `stripe`), NOT NULL

### Review

-   **review_id**: Primary Key, UUID, Indexed
-   **property_id**: Foreign Key, references  `Property(property_id)`
-   **user_id**: Foreign Key, references  `User(user_id)`
-   **rating**: INTEGER, CHECK:  `rating >= 1 AND rating <= 5`, NOT NULL
-   **comment**: TEXT, NOT NULL
-   **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Message

-   **message_id**: Primary Key, UUID, Indexed
-   **sender_id**: Foreign Key, references  `User(user_id)`
-   **recipient_id**: Foreign Key, references  `User(user_id)`
-   **message_body**: TEXT, NOT NULL
-   **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Constraints

### User Table

-   Unique constraint on  `email`.
-   Non-null constraints on required fields.

### Property Table

-   Foreign key constraint on  `host_id`.
-   Non-null constraints on essential attributes.

### Booking Table

-   Foreign key constraints on  `property_id`  and  `user_id`.
-   `status`  must be one of  `pending`,  `confirmed`, or  `canceled`.

### Payment Table

-   Foreign key constraint on  `booking_id`, ensuring payment is linked to valid bookings.

### Review Table

-   Constraints on  `rating`  values (1-5).
-   Foreign key constraints on  `property_id`  and  `user_id`.

### Message Table

-   Foreign key constraints on  `sender_id`  and  `recipient_id`.

## Indexing

-   **Primary Keys**: Indexed automatically.
-   **Additional Indexes**:
    -   `email`  in the  **User**  table.
    -   `property_id`  in the  **Property**  and  **Booking**  tables.
    -   `booking_id`  in the  **Booking**  and  **Payment**  tables.

## Relationships
- A **User** can be a host (linked to Properties) or a guest (linked to Bookings).
- A **Property** is hosted by one User and can have multiple Bookings and Reviews.
- A **Booking** is made by a User for a specific Property and results in one Payment.
- A **Review** is written by a User about a Property.
- A **Payment** is made for a specific Booking.
- A **Message** is sent from one User to another User.

## ERD
ERD diagram is availaible here: [ERD](https://drive.google.com/file/d/14Ksj069JBVxQqyQMa3tNFWVJ3nmo_1b1/view?usp=sharing)