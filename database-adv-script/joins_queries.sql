-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT b.id AS booking_id, u.id AS user_id, u.name AS user_name
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: Retrieve all properties and their reviews, including properties with no reviews
SELECT p.id AS property_id, p.name AS property_name, r.id AS review_id, r.content AS review_content
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- FULL OUTER JOIN: Retrieve all users and all bookings
SELECT u.id AS user_id, b.id AS booking_id
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;
