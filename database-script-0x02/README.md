# AirBnB Sample Data

## **Overview**
This script populates the AirBnB database with realistic sample data including:
- 6 users (3 guests, 2 hosts, 1 admin)
- 3 properties
- 3 bookings (2 confirmed, 1 pending)
- 2 payments
- 2 reviews
- 2 messages

## **How to Use**
1. Ensure `schema.sql` has been executed first.
2. Run the seed script:
   ```bash
   mysql -u [username] -p airbnb_db < seed.sql