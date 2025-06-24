-- A script that inserts data into AirBnB database;
USE AirBnB;
-- Insert host
INSERT INTO users (
    first_name, last_name, email,
    password_hash, phone_number, role
    )
    VALUES
    ('Obiora', 'Gabriel', 'obimaco@gmail.com', 'ddetwiagd', '090473627456', 'host'),
    ('Daniel', 'Omokiri', 'omo@gmail.com', 'adahhdaldd', '344318831813', 'guest'),
    ('Ada', 'Nwoke', 'adanwoke@gmail.com', 'a1b2c3d4', '08123456789', 'guest'),
    ('Chinedu', 'Okafor', 'chineduokafor@gmail.com', 'p9q8r7s6', '08011112222', 'host'),
    ('Ngozi', 'Iheanacho', 'ngozzii@gmail.com', 'pass1234', '07099887766', 'guest'),
    ('Kelechi', 'Umeh', 'kelechiumeh@gmail.com', 'zxcvbnm1', '08033334444', 'host'),
    ('Tunde', 'Bello', 'tundebello@gmail.com', 'letmein123', '09087654321', 'guest'),
    ('Amina', 'Yusuf', 'aminayusuf@gmail.com', 'myp@ssword', '08120030040', 'host'),
    ('Ifeanyi', 'Eze', 'ifeanyieze@gmail.com', 'qwertyui', '07070080090', 'guest'),
    ('Funmi', 'Adeola', 'funmiadeola@gmail.com', 'welcome@1', '08090909090', 'host');

-- Insert Property
INSERT INTO property (
    host_id, name, description,
    location, pricepernight
)
VALUES
(1, 'Cozy Lagos Apartment', 'A comfortable and affordable flat in the heart of Lagos.', 'Lagos, Nigeria', 15000),
(4, 'Waterfront Villa', 'Luxurious villa with a view of the lagoon.', 'Lekki, Lagos', 45000),
(6, 'Urban Studio', 'Modern studio perfect for short stays.', 'Abuja, Nigeria', 20000),
(8, 'Peaceful Garden Home', 'Quiet house surrounded by nature.', 'Ibadan, Nigeria', 18000),
(10, 'Budget Room', 'Simple room for budget-conscious travelers.', 'Kano, Nigeria', 9000),
(1, 'Chic Penthouse', 'Stylish top-floor apartment with city views.', 'Enugu, Nigeria', 35000),
(4, 'Family Bungalow', 'Spacious home for families or groups.', 'Port Harcourt, Nigeria', 22000),
(6, 'Student Crib', 'Affordable spot for students and interns.', 'Ife, Nigeria', 10000),
(8, 'Heritage House', 'Traditional house with modern touches.', 'Calabar, Nigeria', 17000),
(10, 'Luxury High-Rise', 'Premium high-rise apartment with all amenities.', 'Victoria Island, Lagos', 60000);

-- Insert Booking
INSERT INTO booking (
    property_id, user_id, start_date,
    end_date, total_price, status
)
VALUES
(1, 2, '2025-07-01', '2025-07-05', 60000, 'confirmed'),
(2, 3, '2025-07-10', '2025-07-15', 225000, 'pending'),
(3, 5, '2025-08-01', '2025-08-03', 40000, 'confirmed'),
(4, 7, '2025-06-25', '2025-06-30', 90000, 'canceled'),
(5, 9, '2025-09-01', '2025-09-07', 63000, 'confirmed'),
(6, 2, '2025-07-20', '2025-07-22', 70000, 'confirmed'),
(7, 3, '2025-08-15', '2025-08-18', 66000, 'pending'),
(8, 5, '2025-10-05', '2025-10-10', 85000, 'confirmed'),
(9, 7, '2025-07-11', '2025-07-13', 34000, 'confirmed'),
(10, 9, '2025-08-25', '2025-08-28', 180000, 'canceled');

-- Insert Payment
INSERT INTO payment (
    booking_id, amount, payment_method
)
VALUES
(1, 60000, 'credit_card'),
(2, 225000, 'paypal'),
(3, 40000, 'stripe'),
(4, 90000, 'credit_card'),
(5, 63000, 'paypal'),
(6, 70000, 'stripe'),
(7, 66000, 'credit_card'),
(8, 85000, 'paypal'),
(9, 34000, 'stripe'),
(10, 180000, 'credit_card');

-- Insert Review
INSERT INTO review (
    property_id, user_id, rating, comment
)
VALUES
(1, 2, 5, 'Amazing place! Super clean and cozy.'),
(2, 3, 4, 'Great view but the Wi-Fi was spotty.'),
(3, 5, 3, 'Decent stay, value for the price.'),
(4, 7, 2, 'Too noisy at night, but host was helpful.'),
(5, 9, 5, 'Perfect! Would stay again.'),
(6, 2, 4, 'Comfortable and neat, enjoyed my stay.'),
(7, 3, 3, 'Okay for a weekend. Needs better lighting.'),
(8, 5, 5, 'Excellent location and facilities!'),
(9, 7, 4, 'Nice home with a peaceful environment.'),
(10, 9, 1, 'Disappointed. It looked better in pictures.');

-- Insert Message
INSERT INTO message (
    sender_id, recipient_id, message_body
)
VALUES
(2, 1, 'Hi, is the apartment still available for next weekend?'),
(1, 2, 'Yes, it is. You can go ahead and book.'),
(3, 4, 'Hello, can you tell me more about the neighborhood?'),
(4, 3, 'Sure! It’s quiet and close to a shopping mall.'),
(5, 6, 'Is early check-in possible on Friday?'),
(6, 5, 'Yes, early check-in from 10 AM is fine.'),
(7, 8, 'Do you allow pets in the house?'),
(8, 7, 'Unfortunately, no pets are allowed.'),
(9, 10, 'Can I get a discount for a 2-week stay?'),
(10, 9, 'Yes, I can offer 10% off for long stays.');

