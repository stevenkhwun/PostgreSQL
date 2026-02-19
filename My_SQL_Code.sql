---------------------------------------------------------------------------
-- Practical SQL: A Beginner's Guide to Storytelling with Data, 2nd Edition
-- by Anthony DeBarros

-- Chapter 1 Code Examples
----------------------------------------------------------------------------

-- Listing 1-1: Checking your PostgreSQL version

SELECT version();

-- Chapter 2 Code Examples
----------------------------------------------------------------------------

-- Listing 2-1: Creating a database named analysis

CREATE DATABASE analysis;

-- Listing 2-2: Creating a table named teachers with six columns

CREATE TABLE teachers (
    id bigserial,
    first_name varchar(25),
    last_name varchar(50),
    school varchar(50),
    hire_date date,
    salary numeric
);

-- This command will remove (drop) the table.
-- DROP TABLE teachers;

-- Listing 2-3 Inserting data into the teachers table

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);

-- Chapter 3 Code Examples
----------------------------------------------------------------------------

-- Listing 3-1: Querying all rows and columns from the teachers table

SELECT * FROM teachers;

-- Note that this standard SQL shorthand also works:

TABLE teachers;

-- Listing 3-2: Querying a subset of columns

SELECT last_name, first_name, salary FROM teachers;

-- Listing 3-3: Sorting a column with ORDER BY

SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary DESC;

-- Note you can also specify the sort column by
-- using a number representing its position in the result.

SELECT first_name, last_name, salary
FROM teachers
ORDER BY 3 DESC;

-- Listing 3-4: Sorting multiple columns with ORDER BY

SELECT last_name, school, hire_date
FROM teachers
ORDER BY school ASC, hire_date DESC;

-- Listing 3-5: Querying distinct values in the school column
-- It is useful to understand the range of values in a column.

SELECT DISTINCT school
FROM teachers
ORDER BY school;

-- Listing 3-6: Querying distinct pairs of values in the school and salary
-- columns
-- The DISTINCT keyword works on more than one column at a time
-- It returns each unique pair of values
-- This technique gives us the ability to ask:
-- "For each x in the table, what are all the y values?"

SELECT DISTINCT school, salary
FROM teachers
ORDER BY school, salary;

-- Listing 3-7: Filtering rows using WHERE

SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';

-- Examples of WHERE comparison operators

-- Teachers with first name of Janet
SELECT first_name, last_name, school
FROM teachers
WHERE first_name = 'Janet';

-- School names not equal to F.D. Roosevelt HS
SELECT school
FROM teachers
WHERE school <> 'F.D. Roosevelt HS';

-- Teachers hired before Jan. 1, 2000
SELECT first_name, last_name, hire_date
FROM teachers
WHERE hire_date < '2000-01-01';

-- Teachers earning 43,500 or more
SELECT first_name, last_name, salary
FROM teachers
WHERE salary >= 43500;

-- Teachers who earn from $40,000 to $65,000
SELECT first_name, last_name, school, salary
FROM teachers
WHERE salary BETWEEN 40000 AND 65000;

SELECT first_name, last_name, school, salary
FROM teachers
WHERE salary >= 40000 AND salary <= 65000;

-- Listing 3-8: Filtering with LIKE AND ILIKE

SELECT first_name
FROM teachers
WHERE first_name LIKE 'sam%';

SELECT first_name
FROM teachers
WHERE first_name ILIKE 'sam%';

-- Listing 3-9: Combining operators using AND and OR

SELECT *
FROM teachers
WHERE school = 'Myers Middle School'
      AND salary < 40000;

SELECT *
FROM teachers
WHERE last_name = 'Cole'
      OR last_name = 'Bush';

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS'
      AND (salary < 38000 OR salary > 40000);

-- Note how the results change if we omit parentheses. That's
-- because the AND operator takes precedence over OR and is
-- evaluated first:

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS'
      AND salary < 38000 OR salary > 40000;

-- Listing 3-10: A SELECT statement including WHERE and ORDER BY

SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;



