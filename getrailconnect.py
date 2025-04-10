import mysql.connector
conn = mysql.connector.connect(
    host="localhost",
    port="your_port_number",
    user="your_username",
    password="your_password",
    database="GetRail"
)

cursor = conn.cursor()

cursor.execute("SELECT * FROM Passenger")
rows = cursor.fetchall()

for row in rows:
    print(row)

insert_query = """
        INSERT INTO Passenger (name, phone_no, age, gender, authentication_proof)
        VALUES (%s, %s, %s, %s, %s)
        """
data = ("Ravi Das", "9876500021", 35, "Male", "AADHAAR_2233")

cursor.execute(insert_query, data)
conn.commit()
print("Record inserted successfully!")
try:
    cursor.execute("SHOW TABLES")
    rows = cursor.fetchall()

    for row in rows:
        print(row)
except mysql.connector.Error as err:
    print("Error:", err)
finally:    
    cursor.close()
    conn.close()
