-- -----------------------------------------------------------------------------

-- Tipe ENUM kustom untuk kolom gender
CREATE TYPE gender_type AS ENUM ('M', 'F');

-- Tabel employees: satu baris per karyawan
CREATE TABLE employees (
  emp_no     INTEGER      NOT NULL,
  birth_date DATE         NOT NULL,
  first_name VARCHAR(14)  NOT NULL,
  last_name  VARCHAR(16)  NOT NULL,
  gender     gender_type  NOT NULL,
  hire_date  DATE         NOT NULL,
  PRIMARY KEY (emp_no)
);

-- Tabel departments: satu baris per departemen
CREATE TABLE departments (
  dept_no   CHAR(4)     NOT NULL,
  dept_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (dept_no),
  UNIQUE (dept_name)
);

-- Tabel dept_emp: riwayat karyawan per departemen
CREATE TABLE dept_emp (
  emp_no    INTEGER NOT NULL,
  dept_no   CHAR(4) NOT NULL,
  from_date DATE    NOT NULL,
  to_date   DATE    NOT NULL,
  PRIMARY KEY (emp_no, dept_no)
);
CREATE INDEX idx_dept_emp_emp_no  ON dept_emp (emp_no);
CREATE INDEX idx_dept_emp_dept_no ON dept_emp (dept_no);

-- Tabel dept_manager: riwayat manajer per departemen
CREATE TABLE dept_manager (
  dept_no   CHAR(4)  NOT NULL,
  emp_no    INTEGER  NOT NULL,
  from_date DATE     NOT NULL,
  to_date   DATE     NOT NULL,
  PRIMARY KEY (dept_no, emp_no)
);
CREATE INDEX idx_dept_manager_emp_no  ON dept_manager (emp_no);
CREATE INDEX idx_dept_manager_dept_no ON dept_manager (dept_no);

-- Tabel salaries: riwayat gaji karyawan
CREATE TABLE salaries (
  emp_no    INTEGER NOT NULL,
  salary    INTEGER NOT NULL,
  from_date DATE    NOT NULL,
  to_date   DATE    NOT NULL,
  PRIMARY KEY (emp_no, from_date)
);
CREATE INDEX idx_salaries_emp_no ON salaries (emp_no);

-- Tabel titles: riwayat jabatan karyawan
CREATE TABLE titles (
  emp_no    INTEGER     NOT NULL,
  title     VARCHAR(50) NOT NULL,
  from_date DATE        NOT NULL,
  to_date   DATE,
  PRIMARY KEY (emp_no, title, from_date)
);
CREATE INDEX idx_titles_emp_no ON titles (emp_no);

-- -----------------------------------------------------------------------------

-- employees (5 karyawan)
INSERT INTO employees VALUES
(10001, '1953-09-02', 'Georgi',    'Facello',  'M', '1986-06-26'),
(10002, '1964-06-02', 'Bezalel',   'Simmel',   'F', '1985-11-21'),
(10003, '1959-12-03', 'Parto',     'Bamford',  'M', '1986-08-28'),
(10004, '1954-05-01', 'Chirstian', 'Koblick',  'M', '1986-12-01'),
(10005, '1955-01-21', 'Kyoichi',   'Maliniak', 'M', '1989-09-12');

-- departments (5 departemen)
INSERT INTO departments VALUES
('d001', 'Marketing'),
('d002', 'Finance'),
('d003', 'Human Resources'),
('d004', 'Production'),
('d005', 'Development');

-- dept_emp
INSERT INTO dept_emp VALUES
(10001, 'd005', '1986-06-26', '9999-01-01'),
(10002, 'd002', '1996-08-03', '9999-01-01'),
(10003, 'd004', '1995-12-03', '9999-01-01'),
(10004, 'd004', '1986-12-01', '9999-01-01'),
(10005, 'd003', '1989-09-12', '9999-01-01');

-- dept_manager
INSERT INTO dept_manager VALUES
('d001', 10001, '1991-10-01', '9999-01-01'),
('d002', 10002, '1989-08-17', '9999-01-01'),
('d003', 10003, '1992-03-21', '9999-01-01'),
('d004', 10004, '1988-09-09', '9999-01-01'),
('d005', 10005, '1990-01-03', '9999-01-01');

-- salaries (emp_no 10001 memiliki dua entri riwayat gaji)
INSERT INTO salaries VALUES
(10001, 60117, '1986-06-26', '1987-06-26'),
(10001, 62102, '1987-06-26', '9999-01-01'),
(10002, 65828, '1996-08-03', '9999-01-01'),
(10003, 40006, '1995-12-03', '9999-01-01'),
(10004, 40054, '1986-12-01', '9999-01-01'),
(10005, 78228, '1989-09-12', '9999-01-01');

-- titles (emp_no 10004 memiliki dua riwayat jabatan)
INSERT INTO titles VALUES
(10001, 'Senior Engineer', '1986-06-26', '9999-01-01'),
(10002, 'Staff',           '1996-08-03', '9999-01-01'),
(10003, 'Senior Engineer', '1995-12-03', '9999-01-01'),
(10004, 'Engineer',        '1986-12-01', '1995-12-01'),
(10004, 'Senior Engineer', '1995-12-01', '9999-01-01'),
(10005, 'Senior Staff',    '1996-09-12', '9999-01-01');

-- -----------------------------------------------------------------------------

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;
