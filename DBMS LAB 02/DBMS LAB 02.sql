-- Set the context by logging into DBMSLAB02 schema (done via your session)
-- CREATE TABLE Employees
CREATE TABLE Employees (
    EMPNO NUMBER(5) PRIMARY KEY,
    ENAME VARCHAR2(50) NOT NULL,
    JOB VARCHAR2(30),
    MGR NUMBER(5),
    FOREIGN KEY (MGR) REFERENCES Employees(EMPNO),
    HIREDATE DATE,
    SALARY NUMBER(10,2) NOT NULL,
    COMM NUMBER(10,2),
    DEPTNO NUMBER(5),
    FOREIGN KEY (DEPTNO) REFERENCES DEPT(DEPTNO)
);

-- Add comments on columns
COMMENT ON COLUMN Employees.EMPNO IS 'Employee number (unique identifier)';
COMMENT ON COLUMN Employees.ENAME IS 'Employee name';
COMMENT ON COLUMN Employees.JOB IS 'Employee job title';
COMMENT ON COLUMN Employees.MGR IS 'Manager employee number (self-reference)';
COMMENT ON COLUMN Employees.HIREDATE IS 'Hire date of the employee';
COMMENT ON COLUMN Employees.SALARY IS 'Salary of the employee';
COMMENT ON COLUMN Employees.COMM IS 'Commission amount (optional)';
COMMENT ON COLUMN Employees.DEPTNO IS 'Department number (links to DEPT)';

-- CREATE TABLE DEPT
CREATE TABLE DEPT (
    DEPTNO NUMBER(5) PRIMARY KEY,
    DNAME VARCHAR2(50) NOT NULL,
    LOC VARCHAR2(50)
);

-- Add comments on columns for DEPT
COMMENT ON COLUMN DEPT.DEPTNO IS 'Department number (unique identifier)';
COMMENT ON COLUMN DEPT.DNAME IS 'Department name';
COMMENT ON COLUMN DEPT.LOC IS 'Location of the department';

-- Insert sample data into DEPT
INSERT INTO DEPT (DEPTNO, DNAME, LOC) 
VALUES (10, 'Accounting', 'New York');

INSERT INTO DEPT (DEPTNO, DNAME, LOC) 
VALUES (20, 'Research', 'Dallas');

INSERT INTO DEPT (DEPTNO, DNAME, LOC) 
VALUES (30, 'Sales', 'Chicago');

INSERT INTO DEPT (DEPTNO, DNAME, LOC) 
VALUES (40, 'IT', 'San Francisco');

-- Insert sample data into Employees table
-- Since MGR is NULL, this should be valid
INSERT INTO Employees (EMPNO, ENAME, JOB, MGR, HIREDATE, SALARY, COMM, DEPTNO)
VALUES (12345, 'John Doe', 'Manager', NULL, TO_DATE('2022-01-01', 'YYYY-MM-DD'), 50000, 2000, 10);

-- Query to check if the data has been inserted into Employees
SELECT * FROM dbmslab02.Employees;
