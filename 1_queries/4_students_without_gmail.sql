/* https://web.compass.lighthouselabs.ca/days/w05d1/activities/932 


Get all of the students without a gmail.com account and a phone number.

Get their name, email, id, and cohort_id.

*/


SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%gmail.com' 
AND phone IS NULL;