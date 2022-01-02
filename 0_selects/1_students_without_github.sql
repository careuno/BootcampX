/* https://web.compass.lighthouselabs.ca/days/w05d1/activities/931 

Your task is to get all students without a Github username.

Select their id, name, email, and cohort_id.
Order them by cohort_id.

*/

SELECT id, name, email, cohort_id
FROM students
WHERE github IS NULL
ORDER BY cohort_id

/* WHERE github IS NULL not = NULL 
Use a separate line for each clause.
Uppercase each reserved SQL keyword.
*/

