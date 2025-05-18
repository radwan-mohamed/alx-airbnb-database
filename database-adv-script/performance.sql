SELECT b.id AS booking_id, u.name AS user_name, p.name AS property_name, py.amount AS payment_amount
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN properties p ON b.property_id = p.id
INNER JOIN payments py ON b.id = py.booking_id;
