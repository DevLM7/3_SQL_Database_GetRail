
# 🚆 GetRail - Railway Reservation System

## 📘 Description
**GetRail** is a robust railway reservation database management system built using **MySQL** and integrated with **Python**. It includes various entities like passengers, trains, tickets, payments, and technical supervisors. The system supports advanced operations including data manipulation, SQL functions, triggers, joins, and Python-based interactions.

---

## 📁 Tables Overview

- **Passenger**: Stores personal details of railway users.  
- **Payment**: Stores payment mode for each passenger.  
- **Ticket**: Stores ticket details linked to passengers and trains.  
- **TrainDetails**: Contains information about different trains.  
- **TechnicalSupervisor**: Stores supervisors managing the trains.  
- **TrainManagement**: Mapping table linking trains with supervisors.

---

## 📥 Data Insertion
- Added 15 passengers, 8 supervisors, and 5 trains.
- Assigned supervisors to trains via `TrainManagement`.
- Issued tickets to passengers.
- Recorded payment modes.

---

## ✏️ Data Modification Operations
- `UPDATE` to correct phone numbers, ages, and emails.
- `DELETE` to remove incorrect records (payment and supervisor mappings).
- Additional `INSERT` queries to maintain consistency.

---

## 🔢 Number Functions
- Calculated average, maximum, and minimum age of passengers.
- Counted total tickets.
- Example queries using `ROUND()` and `SUM()`.

---

## 🔤 Character Functions
- Converted names to uppercase/lowercase.
- Extracted prefixes using `LEFT()`.
- Calculated name length and concatenated data.

---

## 🔍 SELECT Queries & Conditions
- Tickets by reservation status.
- Name pattern searches.
- Trains going to specific destinations.
- Passengers in age ranges.

---

## 🔗 SQL Joins
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`, `CROSS JOIN` on passengers, tickets, and trains.

---

## ⚙️ Trigger
- `after_ticket_insert`: Adds a pending payment when a ticket is booked.

---

## 👤 User Management
- Created and granted privileges to a new user.
- Demonstrated `GRANT` and `REVOKE` operations.

---

## 🧠 Functional Dependencies & 3NF
- Described FDs and derived candidate keys using attribute closure.
- Example of relation decomposition into 3NF.

---

## 🐍 Python Integration
- Connected MySQL database with Python using `mysql.connector`.
- Inserted new records and fetched data with exception handling.
- Example snippet:

```python
try:
    cursor.execute("SELECT * FROM students")
    results = cursor.fetchall()
    for row in results:
        print(row)
except mysql.connector.Error as err:
    print(f"Error: {err}")
finally:
    cursor.close()
    db_connection.close()
```

---

## 📊 Bonus Queries

- String pattern matching:

```sql
SELECT * FROM Passenger WHERE name LIKE 'Tend%ar';
```

- Sorting query:

```sql
SELECT * FROM Passenger ORDER BY age ASC;
```
