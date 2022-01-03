/* https://web.compass.lighthouselabs.ca/days/w05d1/activities/933 */


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

/*  ATTEMPT #1
  CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  wrong -----> name VARCHAR(255) NOT NULL,
  wrong -----> content VARCHAR(255),
  wrong -----> day DATE,
  wrong -----> chapter VARCHAR(255),
  duration INTEGER
);


  CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE 
  */