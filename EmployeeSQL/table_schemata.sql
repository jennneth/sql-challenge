CREATE TABLE departments (
    dept_no CHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(35) NOT NULL
);

DROP TABLE titles;
CREATE TABLE titles (
    title_id CHAR(5)   NOT NULL PRIMARY KEY,
    title VARCHAR(25)   NOT NULL
);


CREATE TABLE employees (
    emp_no INT   NOT NULL PRIMARY KEY,
    emp_title CHAR(5)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    sex CHAR(1) CHECK (sex = 'M' OR sex = 'F'),
    hire_date DATE   NOT NULL,
    FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
DROP TABLE dept_emp;
CREATE TABLE dept_emp (
    emp_no INT NOT NULL ,
    dept_no CHAR(4) NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no,dept_no)
);
DROP TABLE dept_manager;
CREATE TABLE dept_manager (
    dept_no CHAR(4)   NOT NULL ,
    emp_no INT   NOT NULL PRIMARY KEY,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;