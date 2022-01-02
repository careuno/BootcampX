/*  https://web.compass.lighthouselabs.ca/days/w05d1/activities/932 

Get the names of all of the students from a single cohort.

Select their id and name.
Order them by their name in alphabetical order.
Since this query needs to work with any specific cohort, just use any number for the cohort_id.

*/

SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name;
