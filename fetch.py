import psycopg2

def get_employee_by_id(emp_id):
    try:
        conn = psycopg2.connect(
            host="localhost",
            dbname="postgres",
            user="postgres",
            password="Manideep@56",
            port=5433
        )
        cur = conn.cursor()
        cur.execute("""
            SELECT 
                e.emp_id,
                e.first_name,
                e.last_name,
                e.email,
                e.phone,
                e.job_title,
                e.department,
                e.salary,
                e.hire_date,
                m.first_name AS manager_first,
                m.last_name AS manager_last
            FROM employees e
            LEFT JOIN employees m ON e.manager_id = m.emp_id
            WHERE e.emp_id = %s;
        """, (emp_id,))

        row = cur.fetchone()
        if not row:
            print(f"Employee ID {emp_id} not found.")
            return

        (
            emp_id, first_name, last_name, email, phone,
            job_title, department, salary, hire_date,
            manager_first, manager_last
        ) = row

        print(f"Employee ID: {emp_id}")
        print(f"Name: {first_name} {last_name}")
        print(f"Email: {email}")
        print(f"Phone: {phone}")
        print(f"Job Title: {job_title}")
        print(f"Department: {department}")
        print(f"Salary: ${salary:,.2f}")
        print(f"Hire Date: {hire_date}")
        if manager_first and manager_last:
            print(f"Manager: {manager_first} {manager_last}")
        else:
            print("Manager: None (Top Level)")

    except Exception as e:
        print("Error:", e)

    finally:
        if conn:
            cur.close()
            conn.close()


if __name__ == "__main__":
    get_employee_by_id(1) 