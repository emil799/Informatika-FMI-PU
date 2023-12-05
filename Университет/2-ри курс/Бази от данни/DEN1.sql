--comment

/*
1 COMMENT
2
3
*/
----------------------------------------------
---------------DDL-----------------------------
----------------------------------------------

--CREATE DATABASE DB_INF
--USE DB_INF

CREATE TABLE STUDENTS
(
	F_NUM VARCHAR(15) NOT NULL,
	NAME VARCHAR(50) NOT NULL,
	PHONE VARCHAR(15) NULL
)

---ADD COLUMN
ALTER TABLE STUDENTS 
ADD ADDRESS VARCHAR(50)

--CHANGE DATATYPE OF COLUMN FROM TABLE
ALTER TABLE STUDENTS
ALTER COLUMN ADDRESS TEXT

--DROP COLUMN FROM TABLE
ALTER TABLE STUDENTS 
DROP COLUMN PHONE 

DROP TABLE STUDENTS

--DROP DATABASE DB_INF

----------------------------------------------
---------------DML-----------------------------
----------------------------------------------

CREATE TABLE STUDENTS
(
	F_NUM VARCHAR(15) NOT NULL PRIMARY KEY,
	NAME VARCHAR(50) NOT NULL,
	PHONE VARCHAR(15) NULL,
	GENDER CHAR(1) NULL DEFAULT 'M' CHECK(GENDER IN('F','M'))
)

-- 1) �� 1 ����� 
INSERT INTO STUDENTS(F_NUM, NAME, PHONE)
VALUES('1401682043','���� ������','032 45 67')

-- 2) �� 1 ����� 
INSERT INTO STUDENTS --������ ������
VALUES('1401682044','���� ������','032 45 67', NULL)

-- 3) �� ������� ������ ��������
INSERT INTO STUDENTS(F_NUM, NAME, PHONE, GENDER)
VALUES('1401682045', '����� ������', '0892 456 567', 'F'),
      ('1401682046', '���� ������', '0892 456 568', 'F'),
	  ('1401682047', '������ ��������', '0892 456 578', 'M')


--  ������� ����� �� ������� � F_NUM = '1401682045'
UPDATE STUDENTS
SET NAME = '����� ������-�������'
WHERE F_NUM = '1401682045'

--������ ������� � F_NUM = '1401682047'
DELETE FROM STUDENTS
WHERE F_NUM = '1401682047'

--��������� �� ������ ������
SELECT * FROM STUDENTS

--��������� �� ���� � �������
SELECT NAME, PHONE
FROM STUDENTS

----��������� �� ������ ������,�� � ������� �������� �� ���� 'F' ��� ������ GENDER
SELECT *
FROM STUDENTS
WHERE GENDER = 'F'

----------------------------------------------------------------------
----------------------------------------------------------------------
----------------------------------------------------------------------


--1. ������� �� ������������� �� ������
----------------------------------------------------------------------
--��������� ��� ���������:
	--? expression � ������� �����, ���������� �� ����� �� ���� ������������;
	--? data_type � ���, ��� ����� �� ����� �������������;
	--? length � �������� ��������� �� ���������� ������ ����� (������);
	--? style � ����, ��������� ��� ������������� �� ���� � ������;

----------CAST (expression AS data_type [ ( length ) ]) ;
-- ����������� �������� (�� ����� � �� � ���) � ������������ ��� 
SELECT CAST(10.3496847 AS money)

----------CONVERT (data_type [ ( length ) ] , expression [ , style])
-- ����������� �������� (�� ����� � �� � ���) � ������������ ��� 
SELECT GETDATE()
SELECT CONVERT(varchar, GETDATE(), 103)
SELECT CONVERT(datetime, '2019-08-25', 105) -- out-of-range value.
SELECT CONVERT(datetime, '2019-25-08', 105)


----------------------------------------------------------------------
-----------------------TRADE COMPANY----------------------------------
----------------------------------------------------------------------

DROP TABLE COUNTRIES
DROP TABLE STUDENTS


CREATE TABLE REGIONS
(
	REGION_ID SMALLINT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	NAME VARCHAR(25) NOT NULL UNIQUE
)

CREATE TABLE COUNTRIES
(
	COUNTRY_ID CHAR(2) NOT NULL,
	NAME VARCHAR(40) NOT NULL,
	REGION_ID SMALLINT NULL,

	CONSTRAINT PK_COUNTRIES PRIMARY KEY (COUNTRY_ID),
	CONSTRAINT FK_COUNTRIES_REGIONS FOREIGN KEY (REGION_ID)
		REFERENCES REGIONS(REGION_ID)
)

CREATE TABLE CUSTOMERS
(
	CUSTOMER_ID NUMERIC(6) NOT NULL,
	COUNTRY_ID CHAR(2) NOT NULL,
	FNAME VARCHAR(20) NOT NULL,
	LNAME VARCHAR(20) NOT NULL,
	ADDRESS TEXT NULL,
	EMAIL VARCHAR(30) NULL,

	GENDER CHAR(1) NULL DEFAULT 'M' 
		CHECK(GENDER IS NULL OR (GENDER IN ('M','F'))),
	CONSTRAINT PK_CUSTOMERS PRIMARY KEY (CUSTOMER_ID)
)

ALTER TABLE CUSTOMERS
ADD CONSTRAINT FK_CUSTOMERS_COUNTRIES FOREIGN KEY (COUNTRY_ID)
	REFERENCES COUNTRIES(COUNTRY_ID)

CREATE TABLE JOBS
(
	JOB_ID VARCHAR(10) NOT NULL PRIMARY KEY,
	JOB_TITLE VARCHAR(35) NOT NULL,
	MIN_SALARY NUMERIC(6) NULL,
	MAX_SALARY NUMERIC(6) NULL
)

CREATE TABLE EMPLOYEES 
(
	EMPLOYEE_ID INT NOT NULL PRIMARY KEY,
	FNAME VARCHAR(20) NOT NULL,
	LNAME VARCHAR(25) NOT NULL,
	EMAIL VARCHAR(40) NOT NULL UNIQUE,
	PHONE VARCHAR(20) NULL,
	HIRE_DATE DATETIME NOT NULL,
	SALARY NUMERIC(8,2) NOT NULL,
	JOB_ID VARCHAR(10) NOT NULL,
	MANAGER_ID INT NULL,
	DEPARTMENT_ID INT NULL,
	CONSTRAINT FK_EMPLOYEES_JOBS FOREIGN KEY (JOB_ID)
	REFERENCES JOBS(JOB_ID),
	CONSTRAINT FK_EMPLOYEE_MANAGERS FOREIGN KEY (MANAGER_ID)
	REFERENCES EMPLOYEES(EMPLOYEE_ID)
)

ALTER TABLE EMPLOYEES
ADD CONSTRAINT SLARY_CHECK CHECK(SALARY>0)

CREATE TABLE DEPARTMENTS
(
	DEPARTMENT_ID INT NOT NULL PRIMARY KEY,
	NAME VARCHAR(30) NOT NULL,
	MANAGER_ID INT NULL,
	COUNTRY_ID CHAR(2) NOT NULL,
	CITY VARCHAR(30) NOT NULL,
	STATE VARCHAR(25) NULL,
	ADDRESS VARCHAR(40) NULL,
	POSTAL_CODE VARCHAR(12) NULL,
	CONSTRAINT FK_DEPARTMENT_MANAGER FOREIGN KEY (MANAGER_ID)
		REFERENCES EMPLOYEES (EMPLOYEE_ID),
	CONSTRAINT FK_DEPT_COUNTRIES FOREIGN KEY(COUNTRY_ID)
		REFERENCES COUNTRIES(COUNTRY_ID)
)
ALTER TABLE EMPLOYEES
ADD CONSTRAINT FK_EMPLOYEES_DEPARTMENTS FOREIGN KEY (DEPARTMENT_ID)
	REFERENCES DEPARTMENTS (DEPARTMENT_ID)

CREATE TABLE PRODUCTS
(
	PRODUCT_ID INT NOT NULL PRIMARY KEY,
	NAME VARCHAR(70) NOT NULL,
	PRICE NUMERIC(8,2) NOT NULL,
	DESCR VARCHAR(2000) NULL
)

CREATE TABLE ORDERS
(
	ORDER_ID INT NOT NULL PRIMARY KEY,
	ORDER_DATE DATETIME NOT NULL,
	CUSTOMER_ID NUMERIC(6) NOT NULL FOREIGN KEY REFERENCES CUSTOMERS,
	EMPLOYEE_ID INT NOT NULL FOREIGN KEY REFERENCES EMPLOYEES,
	SHIP_ADDRESS VARCHAR(150) NULL
)

CREATE TABLE ORDER_ITEMS
(
	ORDER_ID INT NOT NULL ,
	PRODUCT_ID INTEGER NOT NULL,
		PRIMARY KEY(ORDER_ID, PRODUCT_ID),
	UNIT_PRICE NUMERIC(8,2) NOT NULL,
	QUANTITY NUMERIC(8) NOT NULL,

	CONSTRAINT FK_OI_ORDERS FOREIGN KEY (ORDER_ID) 
		REFERENCES ORDERS(ORDER_ID) 
			ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_OI_PRODUCTS FOREIGN KEY (PRODUCT_ID) 
		REFERENCES PRODUCTS(PRODUCT_ID)
)