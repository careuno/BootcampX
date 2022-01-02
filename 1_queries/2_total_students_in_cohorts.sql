/* https://web.compass.lighthouselabs.ca/days/w05d1/activities/932  


Select the total number of students who were in the first 3 cohorts.
*/

SELECT COUNT(id)
FROM students
WHERE cohort_id IN (1 , 2, 3);
