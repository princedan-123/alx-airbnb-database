# AirBnB Database Seeder

This project contains a SQL script used to populate the **AirBnB** database with sample data. It includes seed data for users (hosts and guests), properties, bookings, payments, reviews, and messages.

## 📋 Prerequisites

- MySQL installed and running
- A database named `AirBnB` created
- Tables created with appropriate schemas for:
  - `User`
  - `Property`
  - `Booking`
  - `Payment`
  - `Review`
  - `Message`

## 📥 How to Use

1. Ensure your MySQL service is running.
2. Open a terminal and run:

   ```bash
   mysql -u your_username -p < seed.sql
## 🗃️ What This Script Does
- Inserts a host and a guest into the User table.
- Inserts a property listed by the host.
- Adds a booking made by the guest.
- Adds a payment for the booking.
- Records a review left by the guest.
- Stores a message from the guest to the host.

## 🧪 Sample Data Overview
- Host: Obiora Gabriel
- Guest: Daniel Mabia
- Property: "chopay", located in Benin
- Booking: May 10 – May 15, 2025
- Payment Method: Credit card
- Review: 5-star rating with a positive comment
- Message: "Are pets allowed?"
## ⚠️ Notes
- Ensure the User, Property, and other tables use appropriate UUID types or strings for primary keys.
- Run this only on a test or development database to avoid affecting production data.