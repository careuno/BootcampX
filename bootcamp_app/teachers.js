const { Pool } = require('pg');

//pg translates sql data into objects 

//we passed in the config obj anonymously
const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

//pool.query is a func that accepts an SQL query as a JS string, pool is an obj that knows how to talk to db
//query method allows our JS file to access db and retrieve information or whatever query (you pass to it) without having to access it through terminal in psql command line shell
//const cohort = process.argv[2];
//const limit = process.argv[3];
//WHERE cohorts.name LIKE '%${process.argv[2]}%'


//We get to write a powerful query using SQL, then our results come back to us as humble JavaScript objects.
pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
ORDER BY teacher;
`)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));

