USE airbnb_db;

-- Clear existing data (optional, for testing)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Message;
TRUNCATE TABLE Review;
TRUNCATE TABLE Payment;
TRUNCATE TABLE Booking;
TRUNCATE TABLE Property;
TRUNCATE TABLE User;
SET FOREIGN_KEY_CHECKS = 1;

-- Insert Users (3 guests, 2 hosts, 1 admin)
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
-- Guests
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', '$2a$10$xyz123', '+1234567890', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', '$2a$10$abc456', '+1987654321', 'guest'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Brown', 'charlie@example.com', '$2a$10$def789', '+1122334455', 'guest'),
-- Hosts
('44444444-4444-4444-4444-444444444444', 'David', 'Wilson', 'david@example.com', '$2a$10$ghi012', '+1555666777', 'host'),
('55555555-5555-5555-5555-555555555555', 'Eve', 'Davis', 'eve@example.com', '$2a$10$jkl345', '+1444333222', 'host'),
-- Admin
('66666666-6666-6666-6666-666666666666', 'Admin', 'User', 'admin@example.com', '$2a$10$mno678', '+1999888777', 'admin');

-- Insert Properties (3 properties by 2 hosts)
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night) VALUES
-- David's properties
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', 'Cozy Cabin', 'A rustic cabin in the woods', 'Mountain View, CA', 120.00),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '44444444-4444-4444-4444-444444444444', 'Luxury Penthouse', 'High-end apartment with city views', 'San Francisco, CA', 350.00),
-- Eve's property
('cccccccc-cccc-cccc-cccc-cccccccccccc', '55555555-5555-5555-5555-555555555555', 'Beach House', 'Oceanfront property with private beach', 'Malibu, CA', 275.00);

-- Insert Bookings (3 bookings)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status) VALUES
-- Alice books Cozy Cabin
('dddddddd-dddd-dddd-dddd-dddddddddddd', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2023-06-01', '2023-06-07', 'confirmed'),
-- Bob books Luxury Penthouse
('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', '2023-07-15', '2023-07-20', 'confirmed'),
-- Charlie books Beach House
('ffffffff-ffff-ffff-ffff-ffffffffffff', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '33333333-3333-3333-3333-333333333333', '2023-08-10', '2023-08-17', 'pending');

-- Insert Payments (for confirmed bookings)
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
-- Alice's payment for Cozy Cabin (6 nights * $120 = $720)
('gggggggg-gggg-gggg-gggg-gggggggggggg', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 720.00, 'credit_card'),
-- Bob's payment for Luxury Penthouse (5 nights * $350 = $1750)
('hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 1750.00, 'paypal');

-- Insert Reviews (for completed stays)
INSERT INTO Review (review_id, booking_id, rating, comment) VALUES
-- Alice reviews Cozy Cabin
('iiiiiiii-iiii-iiii-iiii-iiiiiiiiiiii', 'dddddddd-dddd-dddd-dddd-dddddddddddd', 5, 'Perfect getaway! The cabin was adorable and had everything we needed.'),
-- Bob reviews Luxury Penthouse
('jjjjjjjj-jjjj-jjjj-jjjj-jjjjjjjjjjjj', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 4, 'Amazing views, but the building elevator was occasionally slow.');

-- Insert Messages (communication between users)
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
-- Alice messages David (host)
('kkkkkkkk-kkkk-kkkk-kkkk-kkkkkkkkkkkk', '11111111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444444', 'Hi David, is the cabin pet-friendly?'),
-- David replies to Alice
('llllllll-llll-llll-llll-llllllllllll', '44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', 'Yes Alice, we allow small dogs with a $20 fee.');