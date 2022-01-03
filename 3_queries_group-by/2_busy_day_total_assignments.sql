/* https://web.compass.lighthouselabs.ca/days/w05d1/activities/937 


CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER
);

CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);


Get the total number of assignments for each day of bootcamp.

Select the day and the total assignments.
Order the results by day.
This query only requires the assignments table.
Only return rows where total assignments is greater than or equal to 10.

*/

SELECT day, count(*) AS total_assignments 
FROM assignments
GROUP BY day
HAVING count(*) >= 10
ORDER BY day;