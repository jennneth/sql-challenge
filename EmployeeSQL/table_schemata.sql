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

/* query 1 
1. List the following details of each employee: employee number, last name, first name, sex, and salary.
*/
-- use a LEFT JOIN -- 
SELECT e.emp_no, e.last_name,e.first_name, e.sex, s.salary
FROM employees as e
LEFT JOIN salaries as s ON
e.emp_no = s.emp_no;

/* query 2
2. List first name, last name, and hire date for employees who were hired in 1986.
*/
SELECT e.first_name,e.last_name, e.hire_date
FROM employees as e
WHERE e.hire_date BETWEEN '$1986-01-01' AND '$1986-12-31';

/*query 3
3. List the manager of each department with the following information: department number,
department name, the manager's employee number, last name, first name.
*/
SELECT d.dept_no, d.dept_name, m.emp_no AS mgr_emp_no, e.last_name,e.first_name
FROM departments AS d
LEFT JOIN dept_manager m ON
d.dept_no = m.dept_no
JOIN employees e ON
m.emp_no = e.emp_no;

/*query 4
4. List the department of each employee with the following information:
employee number, last name, first name, and department name.
*/
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
JOIN departments d ON
dept_emp.dept_no = d.dept_no;

/*query 5
5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
*/
SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

/*query 6
6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
*/
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
JOIN departments d ON
dept_emp.dept_no = d.dept_no
WHERE d.dept_name LIKE 'Sales%';

/*query 7
7. List all employees in the Sales and Development departments,
including their employee number, last name, first name, and department name.
*/
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN dept_emp ON
e.emp_no = dept_emp.emp_no
JOIN departments d ON
dept_emp.dept_no = d.dept_no
WHERE d.dept_name LIKE 'Sales%' OR
d.dept_name LIKE 'Dev%';

/*query 8
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
*/
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
;