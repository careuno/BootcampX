/* https://web.compass.lighthouselabs.ca/days/w05d1/activities/932
Get all graduates without a linked Github account.

Get their name, email, and phone. */



SELECT name, email, phone
FROM students
WHERE github IS NULL
AND end_date IS NOT NULL;