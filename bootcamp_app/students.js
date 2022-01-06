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


//We get to write a powerful query using SQL, then our results come back to us as humble JavaScript objects.
pool.query(`
SELECT students.id as student_id, students.name as name, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE '%${process.argv[2]}%'
LIMIT ${process.argv[3] || 5};
`)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
  //console.log(res.rows);
  //returns a JS object
  })
})
.catch(err => console.error('query error', err.stack));


// switch (cohort) {
//   case 'FEB':
//     pool.query(`
//       SELECT students.id as student_id, students.name as name, cohorts.name as cohort
//       FROM students
//       WHERE cohort.name LIKE '${cohort}%'
//       JOIN cohorts ON cohorts.id = cohort_id
//       LIMIT ${limit};
//       `)
//     .then(res => {
//       res.rows.forEach(user => {
//         console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohort} cohort`);
//     })
//   });
