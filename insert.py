import psycopg2
from psycopg2 import sql, errors

def add_employee(employee_data):
    required_fields = ["first_name", "last_name", "email", "hire_date"]
    for field in required_fields:
        if field not in employee_data or not employee_data[field]:
            raise ValueError("Missing required field: ",field)

    try:
        conn = psycopg2.connect(
            host="localhost",
            dbname="postgres",
            user="postgres",
            password="Manideep@56",
            port=5433
        )
        cur = conn.cursor()

        cur.execute("SELECT emp_id FROM employees WHERE email = %s", (employee_data["email"],))
        if cur.fetchone():
            raise ValueError("An employee with this email already exists.")

        insert_query = """
            INSERT INTO employees (
                first_name, last_name, email, phone,
                hire_date, job_title, department, salary, manager_id
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
            RETURNING emp_id;
        """

        cur.execute(insert_query, (
            employee_data.get("first_name"),
            employee_data.get("last_name"),
            employee_data.get("email"),
            employee_data.get("phone"),
            employee_data.get("hire_date"),
            employee_data.get("job_title"),
            employee_data.get("department"),
            employee_data.get("salary"),
            employee_data.get("manager_id")
        ))

        new_emp_id = cur.fetchone()[0]
        conn.commit()

        return new_emp_id

    except Exception as e:
        conn.rollback()
        raise e
    finally:
        cur.close()
        conn.close()

if __name__ == "__main__":
    employee_data = {
        "first_name": "John",
        "last_name": "Doe",
        "email": "john.doe@company.com",
        "phone": "555-0101",
        "hire_date": "2023-01-15",
        "job_title": "Software Engineer",
        "department": "IT",
        "salary": 75000.00,
        "manager_id": None
    }

    try:
        new_id = add_employee(employee_data)
        print("New employee ID:", new_id)
    except Exception as err:
        print("Error:", err)
