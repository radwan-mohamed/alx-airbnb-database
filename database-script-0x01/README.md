# AirBnB Database Schema

## **Overview**
This SQL script defines the schema for an AirBnB-like booking system, including tables for:
- Users (guests, hosts, admins)
- Properties
- Bookings
- Payments
- Reviews
- Messages

## **Features**
✅ **Normalized to 3NF** (No redundant data)  
✅ **UUID Primary Keys** (Secure, non-sequential IDs)  
✅ **Foreign Key Constraints** (Data integrity)  
✅ **Optimized Indexes** (Faster queries on critical columns)  

## **How to Use**
1. Run `schema.sql` in MySQL/MariaDB:
   ```bash
   mysql -u [username] -p < schema.sql