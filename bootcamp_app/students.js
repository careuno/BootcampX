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


//We get to write a powerful query using SQL, then our results come back to us as humble JavaScript objects.

const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
// Store all potentially malicious values in an array.
const values = [`%${cohortName}%`, limit];
//parameterized queries ... naming it and passing the parameter variable to pool.query()
//Always use parameterized queries when you have data that comes from an untrusted source, which is pretty much every source.


const queryString = `
  SELECT students.id as student_id, students.name as name, cohorts.name as cohort
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2;
  `;

pool.query(queryString, values)
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
