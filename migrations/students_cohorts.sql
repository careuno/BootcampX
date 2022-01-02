/* https://web.compass.lighthouselabs.ca/activities/930 */

CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date DATE,
  end_date DATE
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(32),
  github VARCHAR(255),
  start_date DATE,
  end_date DATE,
  cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE 
);

/*  cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE  

this line uses foreign key constraints, linking the value between two related tables 

https://www.postgresql.org/docs/9.5/ddl-constraints.html

ON DELETE CASCADE: option is to specify whether you want rows deleted in a child table when corresponding rows are deleted in the parent table.

if a record in the parent table is deleted, then the corresponding records in the child table will automatically be deleted. This is called a cascade delete.

https://stackoverflow.com/questions/14141266/postgresql-foreign-key-on-delete-cascade

*/

