import psycopg2

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
        CREATE TABLE IF NOT EXISTS employees (
            emp_id SERIAL PRIMARY KEY,
            first_name VARCHAR(50) NOT NULL,
            last_name VARCHAR(50) NOT NULL,
            email VARCHAR(100) UNIQUE NOT NULL,
            phone VARCHAR(15),
            hire_date DATE NOT NULL,
            job_title VARCHAR(100),
            department VARCHAR(50),
            salary DECIMAL(10,2),
            manager_id INTEGER REFERENCES employees(emp_id),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
    """)

    cur.execute("""
        CREATE TABLE IF NOT EXISTS departments (
            dept_id SERIAL PRIMARY KEY,
            dept_name VARCHAR(100) UNIQUE NOT NULL,
            location VARCHAR(100),
            budget DECIMAL(12,2),
            manager_id INTEGER REFERENCES employees(emp_id),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
    """)

    cur.execute("""
        CREATE TABLE IF NOT EXISTS projects (
            project_id SERIAL PRIMARY KEY,
            project_name VARCHAR(100) NOT NULL,
            description TEXT,
            start_date DATE,
            end_date DATE,
            budget DECIMAL(12,2),
            status VARCHAR(20) DEFAULT 'ACTIVE',
            dept_id INTEGER REFERENCES departments(dept_id),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        );
    """)

    conn.commit()
    print("Tables created successfully!")

except Exception as e:
    print("Error:", e)

finally:
    if conn:
        cur.close()
        conn.close()
