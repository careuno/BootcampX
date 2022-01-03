/* https://web.compass.lighthouselabs.ca/days/w05d1/activities/935

CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
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

Get the total amount of time that a student has spent on all assignments.

This should work for any student but use 'Ibrahim Schimmel' for now.
Select only the total amount of time as a single column.

WANT TO JOIN 
STUDENT + ASSSIGNMENT SUBMISSIONS @ student_id

WHERE students.name = 'Ibrahim Schimmel';

 */

SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';