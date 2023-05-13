-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Department" (
    "dept_no" Varchar   NOT NULL,
    "dept_Name" Varchar   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Emp" (
    "emp_no" int   NOT NULL,
    "dpt_no" Varchar   NOT NULL,
    CONSTRAINT "pk_Dept_Emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_Manager" (
    "emp_no" int   NOT NULL,
    "dept_no" Varchar   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "Emp_title_ID" Varchar   NOT NULL,
    "Brith_Date" Date(mm/dd/yy)   NOT NULL,
    "First_name" Varchar   NOT NULL,
    "Last_name" Varchar   NOT NULL,
    "Sex" Varcchar   NOT NULL,
    "Hire_date" Date(mm/dd/yy)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "Emp_no" int   NOT NULL,
    "Salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "Title" (
    "Title_ID" Varchar   NOT NULL,
    "Title" Varchar   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "Title_ID"
     )
);

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_dpt_no" FOREIGN KEY("dpt_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("Emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Emp_title_ID" FOREIGN KEY("Emp_title_ID")
REFERENCES "Title" ("Title_ID");

