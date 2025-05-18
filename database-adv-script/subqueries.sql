-- Non-correlated subquery: Find properties with an average rating > 4.0
SELECT id, name
FROM properties
WHERE (SELECT AVG(rating) FROM reviews WHERE property_id = properties.id) > 4.0;

-- Correlated subquery: Find users with more than 3 bookings
SELECT id, name
FROM users u
WHERE (SELECT COUNT(*) FROM bookings b WHERE b.user_id = u.id) > 3;
