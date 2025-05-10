-- A script that inserts data into AirBnB database;
USE AirBnB;
-- Insert host
INSERT INTO User (
    user_id, first_name, last_name, email,
    password_hash, phone_number, role
    )
    VALUES(
        '7f4b27c2-813e-4bd4-bda3-2a1f517ee0d4','Obiora', 'Gabriel', 'obimaco@gmail.com', 'ddetwiagd', '090473627456',
        'host'
    );
-- Insert Guest
INSERT INTO User (
    user_id, first_name, last_name, email,
    password_hash, phone_number, role
    )
    VALUES(
        'c1e9f4e2-7a64-4a3b-a9f2-12b3f81eaa01','Daniel', 'Mabia',
        'ebus@gmail.com','ddjdjsjjadahd', '09047362736',
        'guest'
    );

-- Insert Property
INSERT INTO Property (
    property_id, host_id, name, description,
    location, pricepernight
)
VALUES(
    '58af4bc1-b12a-4c5e-b79f-9f7e5dbeec2c', '7f4b27c2-813e-4bd4-bda3-2a1f517ee0d4',
    'chopay', 'home away from home', 'Benin',
    5000.00
);
-- Insert Booking
INSERT INTO Booking (
    booking_id, property_id, user_id, start_date,
    end_date, total_price, status
)
VALUES(
    '4a8b07d1-52e9-4db6-8c4b-dbd9f5a3f53a', '58af4bc1-b12a-4c5e-b79f-9f7e5dbeec2c',
    'c1e9f4e2-7a64-4a3b-a9f2-12b3f81eaa01',
    '2025-05-10', '2025-05-15', 5000.00,
    'confirmed' 
);
-- Insert Payment
INSERT INTO Payment (
    payment_id, booking_id, amount, payment_method
)
VALUES(
    'df1a798d-99b7-4c0e-a1a0-b763c91e0e33', '4a8b07d1-52e9-4db6-8c4b-dbd9f5a3f53a',
    5000.00, 'credit_card'
);
-- Insert Review
INSERT INTO Review (
    review_id, property_id, user_id, rating, comment
)
VALUES(
    '6c423d91-b4fe-46aa-a25e-f849db8b92d9',
    '58af4bc1-b12a-4c5e-b79f-9f7e5dbeec2c',
    'c1e9f4e2-7a64-4a3b-a9f2-12b3f81eaa01',
    5,
    'It was a nice and comfortable apartment'
    );
-- Insert Message
INSERT INTO Message (
    message_id, sender_id, recipient_id, message_body
)
VALUES(
    '2abcef10-d7d3-4f2b-a4b7-12e4d908a0b5',
    'c1e9f4e2-7a64-4a3b-a9f2-12b3f81eaa01',
    '7f4b27c2-813e-4bd4-bda3-2a1f517ee0d4',
    'are pets allowed?'
    )


