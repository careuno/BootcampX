/* https://web.compass.lighthouselabs.ca/days/w05d1/activities/932 

Get all of the students that don't have an email or phone number.

Get their name, id, and cohort_id.



*/

SELECT name, id, cohort_id
FROM students
WHERE phone IS NULL 
OR email IS NULL;